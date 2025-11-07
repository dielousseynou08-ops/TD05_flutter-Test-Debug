import 'package:flutter_test/flutter_test.dart';
import 'package:appnoteetudiant/main.dart';

void main() {
  testWidgets('Affiche la liste des étudiants et navigue vers les détails', (
    WidgetTester tester,
  ) async {
    // Build du widget
    await tester.pumpWidget(const MyApp());

    // Vérifie la présence du titre principal
    expect(find.text('Liste des Etudiants !'), findsOneWidget);

    // Vérifie qu'au moins un étudiant est affiché
    expect(find.textContaining('Nom : Alice'), findsOneWidget);

    // Simule un clic sur le premier étudiant
    await tester.tap(find.textContaining('Alice'));
    await tester.pumpAndSettle();

    // Vérifie que la page de détail est affichée
    expect(find.text("Details de l'étudiant"), findsOneWidget);
    expect(find.textContaining("Nom de l'étudiant : Alice"), findsOneWidget);
  });
}
