import 'package:meta/meta.dart';

class AppImages {
  static String _geral({@required String iconName}) {
    return 'assets/images/$iconName.png';
  }

  static String get man => _geral(iconName: 'homem');

  static String get woman => _geral(iconName: 'mulher');

  static String get manDoctor => _geral(iconName: 'doutor');

  static String get womanDoctor => _geral(iconName: 'doutora');

  static String get logo => _geral(iconName: 'hiso_logo');

  static String get facebook => _geral(iconName: 'facebook');

  static String get google => _geral(iconName: 'google');

  static String get twitter => _geral(iconName: 'twitter');
}
