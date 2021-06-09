# Foto Gallery

Do you feel logged out? Unregistered? You want to enter a verification
code somewhere from time to time or do INTERNET THINGS (yes, sending
files over the net!) then this is the right app for YOU!

This project is meant to be a little demonstration of authentication
via AWS Amplify using AWS Cognito. This application takes pictures and
uploads them to AWS S3.

# Get started

First, set up your application of choice.

Ampliy supports different frameworks such as Flutter, React, Angular.

See here:
* Flutter: https://docs.amplify.aws/start/q/integration/flutter
* JavaScript: https://docs.amplify.aws/start/q/integration/js

You will find the possibility to choose the framework you love at the
the upper left.

# Authentication

See https://docs.amplify.aws/cli/auth/overview

Amplify provides the possibility to authenticate via AWS Cognito by
calling `amplify add auth`. When adding AWS S3 by calling
`amplify add storage`, the framework will ask whether the storage
is restricted by an existing authentication.

As soon as authentication is set up, you will be able to
make use of Amplify Plugins, which allow to to things like
signing in or out, registering and so on.

Find out more on how to do authentication here:
* Flutter: [https://docs.amplify.aws/lib/auth/getting-started/q/platform/flutter][Flutter]
* JavaScript: [https://docs.amplify.aws/lib/q/platform/js][JavaScript]

[Flutter]: https://docs.amplify.aws/lib/auth/getting-started/q/platform/flutter
[JavaScript]: https://docs.amplify.aws/lib/q/platform/js
