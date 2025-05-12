import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'qrb22l6h': {
      'en': 'Home',
      'ar': '',
    },
    '4h385brk': {
      'en': 'Events',
      'ar': '',
    },
    'binkrnmi': {
      'en': 'check.io',
      'ar': '',
    },
    'ckbyq1ue': {
      'en': 'Platform Navigation',
      'ar': '',
    },
    'qp1rugos': {
      'en': 'Dashboard',
      'ar': '',
    },
    'p5v5lg4o': {
      'en': 'Chats',
      'ar': '',
    },
    'g5rfa73k': {
      'en': 'Projects',
      'ar': '',
    },
    'w0sym6ip': {
      'en': 'Settings',
      'ar': '',
    },
    '2gxlqptq': {
      'en': 'Notifications',
      'ar': '',
    },
    't72lek32': {
      'en': '12',
      'ar': '',
    },
    'x7fqhrkt': {
      'en': 'Billing',
      'ar': '',
    },
    'u40cghvq': {
      'en': 'Explore',
      'ar': '',
    },
    'vk6f7vvm': {
      'en': 'Light Mode',
      'ar': '',
    },
    '96856zlx': {
      'en': 'Dark Mode',
      'ar': '',
    },
    'io5r93bo': {
      'en': 'Andrew D.',
      'ar': '',
    },
    's9kulmbl': {
      'en': 'admin@gmail.com',
      'ar': '',
    },
    'x3to4qwg': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Login
  {
    'xay0ge2k': {
      'en': 'Mixed Feelings',
      'ar': '',
    },
    'iyv3a0hx': {
      'en': 'Welcome',
      'ar': '',
    },
    'q1lozfh3': {
      'en': 'Let\'s get started by logging in',
      'ar': '',
    },
    'sphlv1yn': {
      'en': 'Email',
      'ar': '',
    },
    'e1plc9ql': {
      'en': 'Password',
      'ar': '',
    },
    'd3p4ip5q': {
      'en': 'Sign In',
      'ar': '',
    },
    '8whdkb4o': {
      'en': 'OR',
      'ar': '',
    },
    'mwltwwar': {
      'en': 'Continue with Google',
      'ar': '',
    },
    'n87s8z91': {
      'en': 'Continue with Apple',
      'ar': '',
    },
    '0rt0o9fc': {
      'en': 'Don\'t have an account? ',
      'ar': '',
    },
    'fb2jjoia': {
      'en': 'Sign Up here',
      'ar': '',
    },
    '91jms8z0': {
      'en': 'UserName',
      'ar': '',
    },
    '91s27j7m': {
      'en': 'Overall',
      'ar': '',
    },
    '0e5ypsye': {
      'en': '5',
      'ar': '',
    },
    'rkb6c63i': {
      'en':
          'Nice outdoor courts, solid concrete and good hoops for the neighborhood.',
      'ar': '',
    },
    'cubi3vpg': {
      'en': 'Home',
      'ar': '',
    },
  },
  // EventReservation
  {
    '0igss0wo': {
      'en': 'Log Out',
      'ar': '',
    },
    'k23daoxy': {
      'en': 'Upcoming Events',
      'ar': '',
    },
  },
  // CreateAccount2
  {
    'kcezdvv0': {
      'en': 'Mixed Feelings',
      'ar': '',
    },
    'q8x88jck': {
      'en': 'Create an account',
      'ar': '',
    },
    'xe71cegy': {
      'en': 'Let\'s get started by filling out the form below.',
      'ar': '',
    },
    '0s2nths3': {
      'en': 'First Name',
      'ar': '',
    },
    'eggdsc5g': {
      'en': 'Last Name',
      'ar': '',
    },
    'henf1602': {
      'en': 'Email',
      'ar': '',
    },
    '5ps09llj': {
      'en': 'Password',
      'ar': '',
    },
    'dwvlj8rl': {
      'en': 'Confirm Password',
      'ar': '',
    },
    '7uqyhzie': {
      'en': 'Create Account',
      'ar': '',
    },
    'tg0dl21y': {
      'en': 'Already have an account? ',
      'ar': '',
    },
    '461tt8rz': {
      'en': ' Sign In here',
      'ar': '',
    },
    'rtyg20jh': {
      'en': 'UserName',
      'ar': '',
    },
    'wf637hx8': {
      'en': 'Overall',
      'ar': '',
    },
    'bohkyx3l': {
      'en': '5',
      'ar': '',
    },
    'gv0mdsac': {
      'en':
          'Nice outdoor courts, solid concrete and good hoops for the neighborhood.',
      'ar': '',
    },
    'uglqffug': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Miscellaneous
  {
    '5qrsffqx': {
      'en':
          'This is required for certain features of the app to function fully.',
      'ar': '',
    },
    'x643ugun': {
      'en':
          'This is required for certain features of the app to function fully.',
      'ar': '',
    },
    '3lkqo6ba': {
      'en': '',
      'ar': '',
    },
    'wihijgl2': {
      'en': '',
      'ar': '',
    },
    'yzog6njy': {
      'en': '',
      'ar': '',
    },
    '5g9a1b2y': {
      'en': '',
      'ar': '',
    },
    'wuf73ud9': {
      'en': '',
      'ar': '',
    },
    'wjnrf7wv': {
      'en': '',
      'ar': '',
    },
    'm5m2xx82': {
      'en': '',
      'ar': '',
    },
    '5yiymqlt': {
      'en': '',
      'ar': '',
    },
    '16p2zqc3': {
      'en': '',
      'ar': '',
    },
    'zyf3t4mg': {
      'en': '',
      'ar': '',
    },
    '9nrhmmmy': {
      'en': '',
      'ar': '',
    },
    '5at79d66': {
      'en': '',
      'ar': '',
    },
    'fib92754': {
      'en': '',
      'ar': '',
    },
    '0uo90gw7': {
      'en': '',
      'ar': '',
    },
    'gev07len': {
      'en': '',
      'ar': '',
    },
    'usz0vl21': {
      'en': '',
      'ar': '',
    },
    'mn1sbiv0': {
      'en': '',
      'ar': '',
    },
    'b0gzyzxs': {
      'en': '',
      'ar': '',
    },
    'w23h0mk6': {
      'en': '',
      'ar': '',
    },
    'jg0vqnf1': {
      'en': '',
      'ar': '',
    },
    '9ae1a1ak': {
      'en': '',
      'ar': '',
    },
    'ldaofpr7': {
      'en': '',
      'ar': '',
    },
    's4ef5zov': {
      'en': '',
      'ar': '',
    },
    '486w0p84': {
      'en': '',
      'ar': '',
    },
    '4zs6huek': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
