import 'package:fegoz/Helper/constants.dart';
import 'package:fegoz/providers/language_provider.dart';
import 'package:fegoz/screens/MainScreen.dart';
import 'package:fegoz/widgets/MyDrawer.dart';
import 'package:flutter/material.dart';

import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

class InitScreen extends StatefulWidget {
  static String routeName = '/InitScreen';
  @override
  _InitScreenState createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final page_2 = PageViewModel(
      pageColor: theme.backgroundColor,
      iconImageAssetPath: kPage_1,
      body: Text(
        getTranslationText(context, 'desc_intro_2'),
        style: TextStyle(
          color: theme.accentColor,
        ),
      ),
      title: Text(
        getTranslationText(context, 'tile_intro_2'),
        style: TextStyle(
          color: theme.accentColor,
          fontSize: 25.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      mainImage: Image.asset(
        kPage_1,
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle(color: theme.accentColor),
      bodyTextStyle: TextStyle(color: theme.accentColor),
    );
    final page_1 = PageViewModel(
      pageColor: theme.backgroundColor,
      iconImageAssetPath: kPage_2,
      body: Text(
        getTranslationText(context, 'desc_intro_1'),
        style: TextStyle(
          color: theme.accentColor,
        ),
      ),
      title: Text(
        getTranslationText(context, 'tile_intro_1'),
        style: TextStyle(
          color: theme.accentColor,
          fontSize: 25.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      mainImage: Image.asset(
        kPage_2,
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle(color: theme.accentColor),
      bodyTextStyle: TextStyle(color: theme.accentColor),
    );
    final page_3 = PageViewModel(
      pageColor: theme.backgroundColor,
      iconImageAssetPath: kPage_3,
      body: Text(
        getTranslationText(context, 'desc_intro_3'),
        style: TextStyle(
          color: theme.accentColor,
        ),
      ),
      title: Text(
        getTranslationText(context, 'tile_intro_3'),
        style: TextStyle(
          color: theme.accentColor,
          fontSize: 25.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      mainImage: Image.asset(
        kPage_3,
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle(color: theme.accentColor),
      bodyTextStyle: TextStyle(color: theme.accentColor),
    );

    return IntroViewsFlutter(
      [page_1, page_2, page_3],
      onTapDoneButton: () {
        Navigator.of(context).pushReplacementNamed(CardDrawer.routeName);
      },
      showSkipButton: true,
      skipText: Text(
        getTranslationText(context, 'skip'),
        style: TextStyle(
          color: theme.accentColor,
        ),
      ),
      doneText: Text(
        getTranslationText(context, 'done'),
        style: TextStyle(
          color: theme.accentColor,
        ),
      ),
      pageButtonTextStyles: TextStyle(
        color: theme.accentColor,
        fontSize: 18.0,
      ),
    );
  }
}
