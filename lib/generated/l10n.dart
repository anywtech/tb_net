// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Some localized strings:`
  String get pageHomeListTitle {
    return Intl.message(
      'Some localized strings:',
      name: 'pageHomeListTitle',
      desc: '',
      args: [],
    );
  }

  /// `Welcome {name}`
  String pageHomeSamplePlaceholder(Object name) {
    return Intl.message(
      'Welcome $name',
      name: 'pageHomeSamplePlaceholder',
      desc: '',
      args: [name],
    );
  }

  /// `My name is {lastName}, {firstName} {lastName}`
  String pageHomeSamplePlaceholdersOrdered(Object firstName, Object lastName) {
    return Intl.message(
      'My name is $lastName, $firstName $lastName',
      name: 'pageHomeSamplePlaceholdersOrdered',
      desc: '',
      args: [firstName, lastName],
    );
  }

  /// `{howMany, plural, one{You have 1 message} other{You have {howMany} messages}}`
  String pageHomeSamplePlural(num howMany) {
    return Intl.plural(
      howMany,
      one: 'You have 1 message',
      other: 'You have $howMany messages',
      name: 'pageHomeSamplePlural',
      desc: '',
      args: [howMany],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
      Locale.fromSubtags(languageCode: 'de', countryCode: 'GE'),
      Locale.fromSubtags(languageCode: 'es', countryCode: 'US'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}