import 'package:common/domain/model/kolam.dart';
import 'package:common/domain/model/tambak.dart';

class InputKolamArgument {
  final Tambak tambak;
  final Kolam? initialKolam;
  InputKolamArgument({
    required this.tambak,
    this.initialKolam,
  });
}