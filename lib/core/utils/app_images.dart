import 'package:meta/meta.dart';

class AppImages {
  static String _geral({@required String iconName}) {
    return 'assets/images/$iconName.png';
  }

  static String get man => _geral(iconName: 'person');

  static String get relatives => _geral(iconName: 'parentes');

  static String get doctors => _geral(iconName: 'medicos');

  static String get doctor => _geral(iconName: 'medica');

  static String get family => _geral(iconName: 'familia');

  static String get logo => _geral(iconName: 'hiso_logo');

  static String get facebook => _geral(iconName: 'facebook');

  static String get google => _geral(iconName: 'google');

  static String get apple => _geral(iconName: 'apple');
}
