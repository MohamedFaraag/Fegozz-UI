import 'package:fegoz/providers/language_provider.dart';
import 'package:fegoz/screens/SignUp.dart';
import 'package:fegoz/screens/rest.dart';
import 'package:fegoz/widgets/Input.dart';
import 'package:fegoz/widgets/trensations_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LogInScreen extends StatefulWidget {
  static String routeName = '/LoginScreen';
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: theme.primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                ),
              ),
              child: SvgPicture.asset('assets/images/login.svg'),
            ),
          ),
          Expanded(
            child: Container(
              color: theme.backgroundColor,
              child: ListView(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ShakeTransition(
                    offest: 140,
                    child: InputCard(
                      label: getTranslationText(context, 'email_address'),
                      hint: 'example@gmail.com',
                      icon: FontAwesomeIcons.solidEnvelope,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  ShakeTransition(
                    duration: Duration(milliseconds: 1200),
                    offest: 140,
                    child: InputCard(
                      label: getTranslationText(context, 'pass'),
                      hint: 'pass',
                      icon: FontAwesomeIcons.lock,
                      isPass: true,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  ShakeTransition(
                    duration: Duration(milliseconds: 1600),
                    offest: 140,
                    child: Container(
                      width: mSize.width,
                      height: 45.0,
                      margin: EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: BoxDecoration(
                        color: theme.primaryColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Text(
                          getTranslationText(context, 'signIn'),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ShakeTransition(
                          duration: Duration(milliseconds: 1800),
                          offest: 140,
                          child: InkWell(
                            onTap: () => Navigator.of(context)
                                .pushNamed(SignUpScreen.routeName),
                            child: Text(
                              getTranslationText(context, 'signUp'),
                              style: TextStyle(
                                color: theme.primaryColor.withOpacity(0.5),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        ShakeTransition(
                          duration: Duration(milliseconds: 1800),
                          offest: 140,
                          child: InkWell(
                            onTap: () => Navigator.of(context)
                                .pushNamed(ResetPasswordScreen.routeName),
                            child: Text(
                              getTranslationText(context, 'resst'),
                              style: TextStyle(
                                color: theme.primaryColor.withOpacity(0.5),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
