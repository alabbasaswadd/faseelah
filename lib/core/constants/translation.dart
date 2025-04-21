import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'Failed to sign in with Google': 'Failed to sign in with Google',
        },
        'ar': {
          'Failed to sign in with Google': 'فشل تسجيل الدخول عن طريق Google',
        },
      };
}
