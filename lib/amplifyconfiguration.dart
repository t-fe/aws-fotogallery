const amplifyconfig = ''' {
    "UserAgent": "aws-amplify-cli/2.0",
    "Version": "1.0",
    "auth": {
        "plugins": {
            "awsCognitoAuthPlugin": {
                "UserAgent": "aws-amplify-cli/0.1.0",
                "Version": "0.1.0",
                "IdentityManager": {
                    "Default": {}
                },
                "CredentialsProvider": {
                    "CognitoIdentity": {
                        "Default": {
                            "PoolId": "us-west-2:e4284e3a-1a15-4ad7-a1d3-1d17fe8c8c37",
                            "Region": "us-west-2"
                        }
                    }
                },
                "CognitoUserPool": {
                    "Default": {
                        "PoolId": "us-west-2_lOjFQy7Ul",
                        "AppClientId": "7o8r2u2af41jnjve86cts987fg",
                        "AppClientSecret": "1ri82hmlgq1gnh3vhlobo9mokn56spcqrdnogtc7geu54th85v5i",
                        "Region": "us-west-2"
                    }
                },
                "Auth": {
                    "Default": {
                        "authenticationFlowType": "USER_SRP_AUTH"
                    }
                },
                "S3TransferUtility": {
                    "Default": {
                        "Bucket": "fotogallery117e4f19571a45bb99bff120b05aee58172214-dev",
                        "Region": "us-west-2"
                    }
                }
            }
        }
    },
    "storage": {
        "plugins": {
            "awsS3StoragePlugin": {
                "bucket": "fotogallery117e4f19571a45bb99bff120b05aee58172214-dev",
                "region": "us-west-2",
                "defaultAccessLevel": "guest"
            }
        }
    }
}''';