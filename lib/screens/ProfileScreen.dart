import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:fegoz/Helper/constants.dart';
import 'package:fegoz/Model/LanguageModel.dart';
import 'package:fegoz/providers/language_provider.dart';
import 'package:fegoz/providers/theme_provider.dart';
import 'package:fegoz/widgets/Upload.dart';
import 'package:fegoz/widgets/trensations_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = '/ProfileScreen';
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  File _image;

  void _changeLanguage(Language language) async {
    Locale _temp = await setLocales(language.languageCode);
    MyApp.setLocale(context, _temp);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mSize = MediaQuery.of(context).size;
    final themeProv = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      key: _key,
      body: Stack(
        children: [
          _image == null
              ? CachedNetworkImage(
                  imageUrl: kProfile,
                  fit: BoxFit.cover,
                  colorBlendMode: BlendMode.darken,
                  color: Colors.black54,
                  width: mSize.width,
                  height: mSize.height / 3,
                )
              : Image(
                  image: FileImage(_image),
                  colorBlendMode: BlendMode.darken,
                  color: Colors.black54,
                  fit: BoxFit.cover,
                  width: mSize.width,
                  height: mSize.height / 3,
                ),
          Container(
            margin: EdgeInsets.only(top: mSize.height / 5),
            width: mSize.width,
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    padding: EdgeInsets.only(top: 70, left: 10, right: 10),
                    width: mSize.width,
                    decoration: BoxDecoration(
                      color: theme.backgroundColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40.0),
                        topLeft: Radius.circular(40.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShakeTransition(
                          duration: Duration(milliseconds: 800),
                          child: Text(
                            getTranslationText(context, 'profile_settings'),
                            style: TextStyle(
                              color: theme.accentColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Divider(
                          height: 10.0,
                          color: theme.highlightColor,
                          endIndent: 30.0,
                        ),
                        ShakeTransition(
                          duration: Duration(milliseconds: 1200),
                          child: InputUserProfile(
                            icon: FontAwesomeIcons.userAlt,
                            hint: getTranslationText(context, 'user_name'),
                          ),
                        ),
                        ShakeTransition(
                          duration: Duration(milliseconds: 1600),
                          child: InputUserProfile(
                            icon: FontAwesomeIcons.solidEnvelope,
                            hint: 'example@gmail.com',
                          ),
                        ),
                        ShakeTransition(
                          duration: Duration(milliseconds: 1800),
                          child: InputUserProfile(
                            icon: FontAwesomeIcons.lock,
                            hint: getTranslationText(context, 'pass'),
                            isPass: true,
                          ),
                        ),
                        ShakeTransition(
                          duration: Duration(milliseconds: 2200),
                          child: Text(
                            getTranslationText(context, 'settings'),
                            style: TextStyle(
                              color: theme.accentColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Divider(
                          height: 10.0,
                          color: theme.highlightColor,
                          endIndent: 30.0,
                        ),
                        ShakeTransition(
                          duration: Duration(milliseconds: 2600),
                          child: ListTile(
                            onTap: () {},
                            leading: Icon(FontAwesomeIcons.sun,
                                color: theme.accentColor),
                            title: Text(
                              themeProv.changeTheme
                                  ? "Light mode"
                                  : "Dark mode",
                              style: TextStyle(
                                color: theme.accentColor,
                              ),
                            ),
                            trailing: Switch(
                              value: themeProv.changeTheme ? false : true,
                              onChanged: (value) {
                                print(value);
                                themeProv.changeTheme = value ? false : true;
                              },
                            ),
                          ),
                        ),
                        ShakeTransition(
                          duration: Duration(milliseconds: 2800),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 17.0),
                            child: Row(
                              children: [
                                Icon(Icons.language, color: theme.accentColor),
                                SizedBox(width: 20.0),
                                Text(
                                  getTranslationText(context, 'language'),
                                  style: TextStyle(
                                    color: theme.accentColor,
                                    fontSize: 16.0,
                                  ),
                                ),
                                Spacer(),
                                DropdownButton<Language>(
                                  underline: SizedBox(),
                                  items: Language.listLanguage()
                                      .map<DropdownMenuItem<Language>>(
                                        (lang) => DropdownMenuItem<Language>(
                                          value: lang,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(lang.flag),
                                              Text(
                                                lang.name,
                                                style: TextStyle(
                                                    color: theme.accentColor),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (Language language) {
                                    _changeLanguage(language);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CardUploadImageUser(
                    onTap: () async {
                      final _selectedImage = await Upload.getImage();
                      if (_selectedImage != null) {
                        setState(() {
                          _image = _selectedImage;
                        });
                      }
                    },
                    image: _image,
                    name: "Farag",
                    email: "max.farag2017@gmail.com",
                  ),
                ],
              ),
            ),
          ),
          CardBarProfile(),
        ],
      ),
    );
  }
}

class CardBarProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              FontAwesomeIcons.chevronLeft,
              size: 20.0,
              color: Colors.white,
            ),
          ),
          Text(
            getTranslationText(context, 'profile'),
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18.0),
          ),
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              FontAwesomeIcons.solidSave,
              size: 20.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class CardUploadImageUser extends StatelessWidget {
  final File image;
  final name;
  final email;
  final onTap;

  CardUploadImageUser({this.image, this.name, this.email, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 8.0),
      child: SizedBox(
        width: mSize.width,
        height: 85.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShakeTransition(
              duration: Duration(milliseconds: 1000),
              child: InkWell(
                onTap: onTap,
                child: Hero(
                  tag: 'profile',
                  child: CircleAvatar(
                    maxRadius: 42.0,
                    backgroundColor: theme.primaryColor,
                    child: image == null
                        ? CircleAvatar(
                            maxRadius: 40.0,
                            backgroundColor: theme.primaryColor,
                            backgroundImage: NetworkImage(kProfile),
                          )
                        : Container(
                            width: double.infinity,
                            height: double.infinity,
                            margin: EdgeInsets.all(2),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.file(
                                image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10.0),
            ShakeTransition(
              duration: Duration(milliseconds: 1200),
              child: Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '$name',
                      style: TextStyle(
                        color: theme.accentColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '$email',
                      style: TextStyle(
                        color: theme.accentColor,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InputUserProfile extends StatelessWidget {
  final label;
  final hint;
  final icon;
  final controller;
  final bool isPass;

  InputUserProfile(
      {this.label, this.hint, this.icon, this.controller, this.isPass = false});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      width: mSize.width,
      decoration: BoxDecoration(
        color: theme.highlightColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPass,
        decoration: InputDecoration(
          hintText: '$hint',
          border: InputBorder.none,
          hintStyle: TextStyle(
            color: theme.highlightColor.withOpacity(0.8),
          ),
          prefixIcon: Icon(
            icon,
            size: 20.0,
          ),
        ),
      ),
    );
  }
}
