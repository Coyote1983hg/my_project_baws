import 'package:flutter/material.dart';
import 'package:my_project_baws/data/mock_database.dart';
import 'package:my_project_baws/screens/signin_screen.dart';
import 'package:my_project_baws/screens/signup_screen.dart';
import 'package:my_project_baws/theme/theme.dart';
import 'package:my_project_baws/widgets/custom_scaffold.dart';
import 'package:my_project_baws/widgets/welcome_button.dart';

class WelcomeScreen extends StatelessWidget {
  MockDatabase mockDatabase;
  WelcomeScreen(this.mockDatabase, {super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          Flexible(
              flex: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 40.0,
                ),
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      children: [
                        TextSpan(
                            text: 'Welcome Back!\n',
                            style: TextStyle(
                              fontSize: 45.0,
                              fontWeight: FontWeight.w600,
                            )),
                        TextSpan(
                            text:
                                '\nEnter personal details to your employee account',
                            style: TextStyle(
                              fontSize: 20,
                              // height: 0,
                            ))
                      ],
                    ),
                  ),
                ),
              )),
          Align(
            alignment: Alignment.bottomRight,
            child: Row(
              children: [
                 Expanded(
                  child: WelcomeButton(
                    buttonText: 'Sign in',
                    onTap: SignInScreen(mockDatabase),
                    color: Colors.transparent,
                    textColor: Colors.white,
                  ),
                ),
                Expanded(
                  child: WelcomeButton(
                    buttonText: 'Sign up',
                    onTap:  SignUpScreen(mockDatabase),
                    color: Colors.white,
                    textColor: lightColorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
