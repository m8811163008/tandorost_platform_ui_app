import 'package:authentication_app/src/login/cubit/login_cubit.dart';
import 'package:authentication_app/src/login/login_form.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tandorost_components/tandorost_components.dart';

class LoginListener extends StatelessWidget {
  const LoginListener({
    super.key,
    this.goToRegisterRoute,
    this.goToForgotPasswordRoute,
    this.goToHomeRoute,
  });
  final VoidCallback? goToRegisterRoute;
  final VoidCallback? goToForgotPasswordRoute;
  final VoidCallback? goToHomeRoute;
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<LoginCubit, LoginState>(
          listenWhen: (previous, current) =>
              previous.loginStatus != current.loginStatus,
          listener: (context, state) {
            if (state.loginStatus.isConnectionError) {
              final content = context.l10n.networkError;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.exception ?? content)),
              );
            } else if (state.loginStatus.isConnectionError) {
              final content = context.l10n.internetConnectionError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (state.loginStatus.isSuccess) {
              goToHomeRoute?.call();
            }
          },
        ),
        BlocListener<LoginCubit, LoginState>(
          listenWhen: (previous, current) =>
              previous.onVerifyGoogleTokenStatus !=
              current.onVerifyGoogleTokenStatus,
          listener: (context, state) {
            if (state.onVerifyGoogleTokenStatus.isConnectionError) {
              final content = context.l10n.networkError;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.exception ?? content)),
              );
            } else if (state.onVerifyGoogleTokenStatus.isConnectionError) {
              final content = context.l10n.internetConnectionError;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(content)));
            } else if (state.onVerifyGoogleTokenStatus.isSuccess) {
              goToHomeRoute?.call();
            }
          },
        ),
        BlocListener<LoginCubit, LoginState>(
          listenWhen: (previous, current) =>
              previous.initializingGoogleAuthStatus !=
              current.initializingGoogleAuthStatus,
          listener: (context, state) {
            if (state.initializingGoogleAuthStatus.isConnectionError) {
              final messenger = ScaffoldMessenger.of(context);
              String content;
              if (state.googleSignInException != null) {
                switch (state.googleSignInException!.code) {
                  case GoogleSignInExceptionCode.canceled:
                    content = context.l10n.googleAuthExceptionCanceled;
                    break;
                  case GoogleSignInExceptionCode.unknownError:
                    content = context.l10n.googleAuthExceptionUnknownError;
                    break;
                  case GoogleSignInExceptionCode.interrupted:
                    content = context.l10n.googleAuthExceptionInterrupted;
                    break;
                  case GoogleSignInExceptionCode.clientConfigurationError:
                    content = context
                        .l10n
                        .googleAuthExceptionClientConfigurationError;
                    break;
                  case GoogleSignInExceptionCode.providerConfigurationError:
                    content = context
                        .l10n
                        .googleAuthExceptionProviderConfigurationError;
                    break;
                  case GoogleSignInExceptionCode.uiUnavailable:
                    content = context.l10n.googleAuthExceptionUiUnavailable;
                    break;
                  case GoogleSignInExceptionCode.userMismatch:
                    content = context.l10n.googleAuthExceptionUserMismatch;
                    break;
                  default:
                    content = context.l10n.googleAuthExceptionUnknownError;
                }
              } else {
                content = context.l10n.networkError;
              }
              messenger.showSnackBar(SnackBar(content: Text(content)));
            } else if (state.initializingGoogleAuthStatus.isSuccess) {
              // navigate to dashboard
            }
          },
        ),
      ],
      child: LoginForm(
        goToRegisterRoute: goToRegisterRoute,
        goToForgotPasswordRoute: goToForgotPasswordRoute,
        goToHomeRoute: goToHomeRoute,
      ),
    );
  }
}
