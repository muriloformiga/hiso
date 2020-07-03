import 'package:hiso/core/utils/ui/dimensoes_tela.dart';
import 'package:meta/meta.dart';

class ScreenUtils {
  /// Subtrai a altura da tela do dispositivo com [alturaAComparar].
  /// [espacoDisponivel] parâmetro opcional, serve como limiar para uma tela ser pequena.
  static bool isTelaPequena(
      {@required double alturaAComparar, double espacoDisponivel}) {
    final espacoRestante = DimensoesTela.altura - alturaAComparar;
    return espacoRestante < (espacoDisponivel ?? 400.0);
  }
}
