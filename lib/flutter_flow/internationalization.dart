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
  // auth_2_Create
  {
    'sht9uwx7': {
      'en': 'Welcome',
      'ar': '',
    },
    'tw24gd8q': {
      'en': 'Get started by creating an account using the form below.',
      'ar': '',
    },
    'lqrhnnf7': {
      'en': 'Email',
      'ar': '',
    },
    '0i1i0lvh': {
      'en': 'Password',
      'ar': '',
    },
    'z926luj6': {
      'en': 'Create Account',
      'ar': '',
    },
    'i18emh3e': {
      'en': 'Or sign up with',
      'ar': '',
    },
    'q1oizl2u': {
      'en': 'Continue with Google',
      'ar': '',
    },
    'ex1dbrek': {
      'en': 'Continue with Apple',
      'ar': '',
    },
    '2mjukngq': {
      'en': 'Already have an account? ',
      'ar': '',
    },
    '9q3zxjzn': {
      'en': 'Sign in here',
      'ar': '',
    },
    'uglqffug': {
      'en': 'Home',
      'ar': '',
    },
  },
  // auth_2_Login
  {
    'upt8a07t': {
      'en': 'Welcome Back',
      'ar': '',
    },
    'kb3j3jww': {
      'en': 'Fill out the information below in order to access your account.',
      'ar': '',
    },
    '0s2nths3': {
      'en': 'Email',
      'ar': '',
    },
    '5ps09llj': {
      'en': 'Password',
      'ar': '',
    },
    'gq5vsbc6': {
      'en': 'Sign In',
      'ar': '',
    },
    'en9mydfc': {
      'en': 'Or sign in with',
      'ar': '',
    },
    '5h1gg4sy': {
      'en': 'Continue with Google',
      'ar': '',
    },
    'hiauoi9l': {
      'en': 'Continue with Apple',
      'ar': '',
    },
    'ta8vp1j1': {
      'en': 'Don\'t have an account?  ',
      'ar': '',
    },
    '63vdg6zq': {
      'en': 'Create Account',
      'ar': '',
    },
    'hg8e7zdg': {
      'en': 'Forgot password?',
      'ar': '',
    },
    'kjhbi5sw': {
      'en': 'Home',
      'ar': '',
    },
  },
  // auth_2_ForgotPassword
  {
    'l3hdefps': {
      'en': 'Forgot Password',
      'ar': '',
    },
    '8cue2mac': {
      'en':
          'Please fill out your email belo in order to recieve a reset password link.',
      'ar': '',
    },
    'umvif78k': {
      'en': 'Email',
      'ar': '',
    },
    't0u263td': {
      'en': 'Send Reset Link',
      'ar': '',
    },
    't0f8y9n3': {
      'en': 'Home',
      'ar': '',
    },
  },
  // auth_2_createProfile
  {
    'usa6o3fl': {
      'en': 'Home',
      'ar': '',
    },
  },
  // auth_2_Profile
  {
    'v30actt1': {
      'en': 'Your Account',
      'ar': '',
    },
    'mummkci3': {
      'en': 'Edit Profile',
      'ar': '',
    },
    'sxorn7mt': {
      'en': 'App Settings',
      'ar': '',
    },
    'evyq0mf5': {
      'en': 'Support',
      'ar': '',
    },
    '5u7n0bwy': {
      'en': 'Terms of Service',
      'ar': '',
    },
    'g6kmphlf': {
      'en': 'Log Out',
      'ar': '',
    },
    'g8j00a5w': {
      'en': 'Home',
      'ar': '',
    },
  },
  // auth_2_EditProfile
  {
    'iuvpacsk': {
      'en': 'Home',
      'ar': '',
    },
  },
  // editProfile_auth_2
  {
    'xsard4hl': {
      'en': 'Adjust the content below to update your profile.',
      'ar': '',
    },
    '6nka246g': {
      'en': 'Change Photo',
      'ar': '',
    },
    'y5424z0p': {
      'en': 'Full Name',
      'ar': '',
    },
    't0zjvnbh': {
      'en': 'Your full name...',
      'ar': '',
    },
    'uo7dys9g': {
      'en': 'Your Role',
      'ar': '',
    },
    '3n3y8jrq': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'dkwneq80': {
      'en': 'Owner/Founder',
      'ar': '',
    },
    'yshe5w0s': {
      'en': 'Director',
      'ar': '',
    },
    '1avnf1oz': {
      'en': 'Manager',
      'ar': '',
    },
    'la4xqiem': {
      'en': 'Mid-Manager',
      'ar': '',
    },
    'tkkxz3g2': {
      'en': 'Employee',
      'ar': '',
    },
    '20bp6ceh': {
      'en': 'Short Description',
      'ar': '',
    },
    'r41wv5zw': {
      'en': 'A little about you...',
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
