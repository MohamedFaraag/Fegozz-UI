import 'dart:convert';

import 'package:fegoz/Model/LanguageModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DemoLocalization {
  Locale locale;
  DemoLocalization({this.locale});
  static DemoLocalization of(BuildContext context) {
    return Localizations.of<DemoLocalization>(context, DemoLocalization);
  }

  Map<String, String> _localizedValues;
  Future load() async {
    //get files json
    String jsonStringValue = await rootBundle
        .loadString('assets/language/${locale.languageCode}.json');
    //convert json
    Map<String, dynamic> mappedJson = json.decode(jsonStringValue);
    //convert json dynamic value to => String and pass it to _localizedValues
    _localizedValues =
        mappedJson.map((key, value) => MapEntry(key, value.toString()));
  }

  String getTranslatedValue(String key) {
    return _localizedValues[key];
  }

  static const LocalizationsDelegate<DemoLocalization> delegate =
      _DemoLocalizationDeleget();
}

class _DemoLocalizationDeleget extends LocalizationsDelegate<DemoLocalization> {
  const _DemoLocalizationDeleget();
  @override
  bool isSupported(Locale locale) {
    return Language.isSupported.contains(locale.languageCode);
  }

  @override
  Future<DemoLocalization> load(Locale locale) async {
    DemoLocalization demoLocalization = DemoLocalization(locale: locale);
    await demoLocalization.load();
    return demoLocalization;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<DemoLocalization> old) =>
      false;
}
