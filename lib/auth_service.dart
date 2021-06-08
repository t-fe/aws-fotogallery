import 'dart:async';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';

import 'auth_credentials.dart';

enum AuthFlowStatus { login, signUp, verification, session }

class AuthState {
  final AuthFlowStatus authFlowStatus;

  AuthState({this.authFlowStatus});
}

class AuthService {
  final authStateController = StreamController<AuthState>();
  AuthCredentials _credentials;

  void showSignUp() {
    final state = AuthState(authFlowStatus: AuthFlowStatus.signUp);
    authStateController.add(state);
  }

  void showLogin() {
    final state = AuthState(authFlowStatus: AuthFlowStatus.login);
    authStateController.add(state);
  }

  void loginWithCredentials(AuthCredentials credentials) async {
    try {
      final result = await Amplify.Auth.signIn(
          username: credentials.username, password: credentials.password);

      if (result.isSignedIn) {
        final state = AuthState(authFlowStatus: AuthFlowStatus.session);
        authStateController.add(state);
      } else {
        print('User could not be signed in');
      }
    } catch (authError) {
      print('Could not login - $authError');
    }
  }

  void signUpWithCredentials(SignUpCredentials credentials) async {
    try {
      final userAttributes = {'email': credentials.email};

      final result = await Amplify.Auth.signUp(
          username: credentials.username,
          password: credentials.password,
          options: CognitoSignUpOptions(userAttributes: userAttributes));

      if (result.isSignUpComplete) {
        if(result.nextStep is AuthNextSignUpStep) {
          this._credentials = credentials;

          final state = AuthState(authFlowStatus: AuthFlowStatus.verification);
          authStateController.add(state);
        }
        loginWithCredentials(credentials);
      } else {
        print("SignUp incomplete. Redo.");
      }
    } catch (authError) {
      print('Failed to sign up - $authError');
    }
  }

  void verifyCode(String verificationCode) async {
    try {
      final result = await Amplify.Auth.confirmSignUp(
          username: _credentials.username, confirmationCode: verificationCode);

      if (result.isSignUpComplete) {
        loginWithCredentials(_credentials);
      } else {
        // Follow next step
        print('Sign up is not complete...Next Step: ${result.nextStep}');
      }
    } catch (authError) {
      print('Could not verify code - $authError');
    }
  }

  void logOut() async {
    try {
      await Amplify.Auth.signOut();

      showLogin();
    } catch (authError) {
      print('Could not log out - $authError');
    }
  }

  void checkAuthStatus() async {
    try {
      await Amplify.Auth.fetchAuthSession();

      final state = AuthState(authFlowStatus: AuthFlowStatus.session);
      authStateController.add(state);
    } catch (_) {
      final state = AuthState(authFlowStatus: AuthFlowStatus.login);
      authStateController.add(state);
    }
  }
}
