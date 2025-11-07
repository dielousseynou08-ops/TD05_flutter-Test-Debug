import 'package:flutter_test/flutter_test.dart';
import 'package:appnoteetudiant/main.dart';
import 'package:appnoteetudiant/widgets/widget_class_etudiant.dart';

void main() {
  group('calculateMoyenne', () {
    test('calcule correctement la moyenne de la classe', () {
      final etudiants = [
        Etudiants(name: 'Alice', moyenne: 18),
        Etudiants(name: 'Bob', moyenne: 14),
        Etudiants(name: 'Charlie', moyenne: 16),
      ];

      final moyenne = calculateMoyenne(etudiants);

      expect(moyenne, equals(16)); // (18 + 14 + 16) / 3 = 16
    });

    test('retourne 0 pour une liste vide', () {
      final moyenne = calculateMoyenne([]);
      expect(moyenne.isNaN || moyenne == 0, isTrue);
    });
  });
}
