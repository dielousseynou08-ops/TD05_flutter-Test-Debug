import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:appnoteetudiant/main.dart';

void main() {
  testWidgets('Affiche le dialogue de moyenne quand on clique sur le bouton', (
    WidgetTester tester,
  ) async {
    // Build de l'application principale
    await tester.pumpWidget(const MyApp());

    // Vérifie que le bouton est présent
    final buttonFinder = find.text('Calculer la moyenne de la classe');
    expect(buttonFinder, findsOneWidget);

    // Clique sur le bouton
    await tester.tap(buttonFinder);
    await tester.pump(); // commence à construire le dialogue
    await tester.pump(
      const Duration(seconds: 1),
    ); // laisse le temps d'afficher le dialog

    // Vérifie que le dialogue s'affiche
    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('Moyenne des Etudiants'), findsOneWidget);
    expect(
      find.textContaining('La moyenne des étudiants est :'),
      findsOneWidget,
    );

    // Vérifie la présence du bouton "Valider" et ferme le dialogue
    await tester.tap(find.text('Valider'));
    await tester.pumpAndSettle();

    // Vérifie que le dialogue est bien fermé
    expect(find.byType(AlertDialog), findsNothing);
  });
}
