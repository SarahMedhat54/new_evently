// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get loginScreenHeader => 'تسجيل الدخول إلى حسابك';

  @override
  String get emailHint => 'أدخل بريدك الإلكتروني';

  @override
  String get passwordHint => 'ادخل كلمة السر';

  @override
  String get forgetPassword => 'هل نسيت كلمة السر؟';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get dontHaveAccount => 'ليس لديك حساب؟ ';

  @override
  String get signUp => 'انشاء حساب';

  @override
  String get or => 'أو';

  @override
  String get loginWithGoogle => 'تسجيل الدخول باستخدام جوجل';
}
