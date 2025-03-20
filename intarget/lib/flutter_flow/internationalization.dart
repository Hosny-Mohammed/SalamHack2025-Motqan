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
  // Authintication
  {
    '0abtjg8g': {
      'en': 'InTarget',
      'ar': 'في الهدف',
    },
    '989bcwo5': {
      'en': 'Sign In',
      'ar': 'تسجيل الدخول',
    },
    'hxql7zyz': {
      'en': 'Let\'s get started by filling out the form below.',
      'ar': 'لنبدأ بملء النموذج أدناه.',
    },
    '5ysxnbzk': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
    },
    '0vqeiw8q': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    't6a317dq': {
      'en': 'Sign In',
      'ar': 'تسجيل الدخول',
    },
    'ap8x4qud': {
      'en': 'Forgot Password',
      'ar': 'هل نسيت كلمة السر',
    },
    'der9teyg': {
      'en': 'Sign Up',
      'ar': 'اشتراك',
    },
    'l3511kls': {
      'en': 'Let\'s get started by filling out the form below.',
      'ar': 'لنبدأ بملء النموذج أدناه.',
    },
    'brl7qxm5': {
      'en': 'Name',
      'ar': 'اسم',
    },
    'c5k5n4af': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
    },
    'i713vvak': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    '57v2r60f': {
      'en': 'Confirm Password',
      'ar': 'تأكيد كلمة المرور',
    },
    '3bmgdf6u': {
      'en': 'Create Account',
      'ar': 'إنشاء حساب',
    },
    'cpzmt4k0': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // homepage
  {
    'cy5znk9d': {
      'en': 'In Target',
      'ar': 'في الهدف',
    },
    '7cp6wy2c': {
      'en': 'My Targets',
      'ar': 'أهدافي',
    },
  },
  // profile
  {
    'qd2fd1yr': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
    },
    'nox4ikru': {
      'en': 'Switch to Dark Mode',
      'ar': 'التبديل إلى الوضع الداكن',
    },
    'xep64o49': {
      'en': 'Switch to Light Mode',
      'ar': 'التبديل إلى وضع الإضاءة',
    },
    'zogk13pr': {
      'en': 'Account Settings',
      'ar': 'إعدادات الحساب',
    },
    'rvfi5jc1': {
      'en': 'Change Password',
      'ar': 'تغيير كلمة المرور',
    },
    '7d1qbjt4': {
      'en': 'Select Select Language...',
      'ar': 'حدد حدد اللغة...',
    },
    'j8he4h8x': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    'oj81uysw': {
      'en': 'Arabic',
      'ar': 'العربية',
    },
    'jyazahbx': {
      'en': 'English',
      'ar': 'الإنجليزية',
    },
    'el8ahd4w': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
    },
    'fs4hx8xo': {
      'en': 'Log Out',
      'ar': 'تسجيل الخروج',
    },
    'vu5zi9h6': {
      'en': '__',
      'ar': '__',
    },
  },
  // TargetPlan
  {
    'hu1pro1g': {
      'en': 'Target',
      'ar': 'هدف',
    },
    's3tdopzg': {
      'en': ' - Phases',
      'ar': '- المراحل',
    },
    'g2wtgms5': {
      'en': 'Total Days: ',
      'ar': 'إجمالي الأيام:',
    },
    'hoejruyn': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // PhaseDetails
  {
    '4nh0lexe': {
      'en': 'Phase Details',
      'ar': 'تفاصيل المرحلة',
    },
    '8m8kxa7g': {
      'en': 'Tasks',
      'ar': 'المهام',
    },
    'msv58cjv': {
      'en': 'Phase Check List',
      'ar': 'قائمة التحقق من المرحلة',
    },
    'aamfsbte': {
      'en': 'Materials',
      'ar': 'مواد',
    },
    'xos11h3b': {
      'en': 'Phase Materials List',
      'ar': 'قائمة مواد المرحلة',
    },
    '02lbm4zi': {
      'en': 'Sub Phases',
      'ar': 'المراحل الفرعية',
    },
    'hipxz3v6': {
      'en': 'Generate',
      'ar': 'يولد',
    },
    'yryqhd6n': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // phaseListViewer
  {
    'rmtwswl8': {
      'en': 'Taken Days: ',
      'ar': 'أيام الالتقاط:',
    },
  },
  // CreateTarget
  {
    '3p577mo1': {
      'en': 'Create Target',
      'ar': 'إنشاء هدف',
    },
    '6t8548fr': {
      'en': 'Please enter the information below to add a project.',
      'ar': 'الرجاء إدخال المعلومات أدناه لإضافة مشروع.',
    },
    'vaannbj5': {
      'en': 'Target Name',
      'ar': 'اسم الهدف',
    },
    '33kuzdn2': {
      'en': 'Details...',
      'ar': 'تفاصيل...',
    },
    'bi6rgshq': {
      'en': 'Achive Period...',
      'ar': 'فترة الإنجاز...',
    },
    '07b6v2g8': {
      'en': 'Days',
      'ar': 'أيام',
    },
    'psnf7h75': {
      'en': 'Select Unit...',
      'ar': 'حدد الوحدة...',
    },
    '2zvn7s1s': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    'lxbw3p61': {
      'en': 'Days',
      'ar': 'أيام',
    },
    'zgnsv2u0': {
      'en': 'Back Ground...',
      'ar': 'خلفية...',
    },
    'w14bk2rj': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    'wqr3a07e': {
      'en': 'Begainner',
      'ar': 'مبتدئ',
    },
    'er2i0fra': {
      'en': 'Mid-level',
      'ar': 'مستوى متوسط',
    },
    'eie6f02r': {
      'en': 'Proffiional',
      'ar': 'محترف',
    },
    'f3bu3r1y': {
      'en': 'Create Target',
      'ar': 'إنشاء هدف',
    },
    'pwx7hodm': {
      'en': 'Target Name is required',
      'ar': 'اسم الهدف مطلوب',
    },
    '4cd5caci': {
      'en': 'Minimum is 5',
      'ar': 'الحد الأدنى هو 5',
    },
    'font7fwl': {
      'en': 'Too Long',
      'ar': 'طويل جدًا',
    },
    '55jy06r3': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
    },
    'bq9sni5e': {
      'en': 'Detail is required',
      'ar': 'التفاصيل مطلوبة',
    },
    'xxge8gw7': {
      'en': 'please provide more details',
      'ar': 'يرجى تقديم المزيد من التفاصيل',
    },
    'mo30x6av': {
      'en': 'too longe',
      'ar': 'طويل جدًا',
    },
    'pqhb9o7i': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
    },
    'q3v3vav4': {
      'en': 'Achive Period is required',
      'ar': 'الفترة المطلوبة',
    },
    'x2t10eut': {
      'en': 'minimum target is 7 days',
      'ar': 'الحد الأدنى للهدف هو 7 أيام',
    },
    'wx9emhvg': {
      'en': 'max',
      'ar': 'الأعلى',
    },
    'tgzkk7jl': {
      'en': 'The numbe of days only between 10 and 120',
      'ar': 'عدد الأيام فقط بين 10 و 120',
    },
    'n1pf6nt4': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
    },
  },
  // TargetBox
  {
    'ssui59wo': {
      'en': 'Total Days: ',
      'ar': 'إجمالي الأيام:',
    },
  },
  // Miscellaneous
  {
    '9221ozyg': {
      'en': '',
      'ar': '',
    },
    'iur6fjmm': {
      'en': '',
      'ar': '',
    },
    'h3zue8q1': {
      'en': '',
      'ar': '',
    },
    '9ttkhk60': {
      'en': '',
      'ar': '',
    },
    '8h0tcykn': {
      'en': '',
      'ar': '',
    },
    'yriplio9': {
      'en': '',
      'ar': '',
    },
    'vyycemla': {
      'en': '',
      'ar': '',
    },
    's122diuo': {
      'en': '',
      'ar': '',
    },
    'm8gljtkk': {
      'en': '',
      'ar': '',
    },
    'j5pdb07n': {
      'en': '',
      'ar': '',
    },
    'xhm3hjft': {
      'en': '',
      'ar': '',
    },
    'xv6d1krv': {
      'en': '',
      'ar': '',
    },
    'pp48kdmq': {
      'en': '',
      'ar': '',
    },
    'ak9ec181': {
      'en': '',
      'ar': '',
    },
    'p0jq0x3j': {
      'en': '',
      'ar': '',
    },
    '16pzaaki': {
      'en': '',
      'ar': '',
    },
    'dl8kg1jx': {
      'en': '',
      'ar': '',
    },
    'i8sq2jjs': {
      'en': '',
      'ar': '',
    },
    '9bkdatta': {
      'en': '',
      'ar': '',
    },
    'gu58evh7': {
      'en': '',
      'ar': '',
    },
    '85tpyosw': {
      'en': '',
      'ar': '',
    },
    'r7ij7vy5': {
      'en': '',
      'ar': '',
    },
    'lt6r53b0': {
      'en': '',
      'ar': '',
    },
    '22xt34i9': {
      'en': '',
      'ar': '',
    },
    'qkae149g': {
      'en': '',
      'ar': '',
    },
    't5iulk7c': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
