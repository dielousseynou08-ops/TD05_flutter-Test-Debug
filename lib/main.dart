import 'package:appnoteetudiant/widgets/widget_class_etudiant.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Liste de Note Etudiant !',
      home: HomePage(),
      routes: {'/details': (context) => DetailPage()},
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Etudiants> etudiants = [
    Etudiants(name: 'Alice', moyenne: 17.2),
    Etudiants(name: 'Bob', moyenne: 15),
    Etudiants(name: 'Charlie', moyenne: 14.05),
    Etudiants(name: 'Davide', moyenne: 12.5),
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text(
          'Liste des Etudiants !',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Liste des étudiants et de leurs moyennes ',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 25),

          ListView.builder(
            shrinkWrap: true,
            itemCount: etudiants.length,
            itemBuilder: (context, index) {
              final etudiant = etudiants[index];
              return Card(
                child: ListTile(
                  title: Text('Nom : ${etudiant.name}'),
                  subtitle: Text('Moyenne: ${etudiant.moyenne}'),

                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/details',
                      arguments: etudiant,
                    );
                  },
                ),
              );
            },
          ),

          const SizedBox(height: 15),
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent,
              borderRadius: BorderRadius.circular(15),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
              ),
              onPressed: () {
                final average = calculateMoyenne(etudiants);
                moyenneAlertDialogue(context, average);
              },
              child: Text(
                'Calculer la moyenne de la classe',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

double calculateMoyenne(List<Etudiants> etudiants) {
  double totale = 0.0;

  for (var etudiant in etudiants) {
    totale += etudiant.moyenne;
  }
  return totale / etudiants.length;
}

void moyenneAlertDialogue(BuildContext context, double average) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Moyenne des Etudiants'),
        content: Text('La moyenne des étudiants est : $average'),

        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Valider'),
          ),
        ],
      );
    },
  );
}

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final etudiant = ModalRoute.of(context)!.settings.arguments as Etudiants;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("Details de l'étudiant"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              title: Text(
                "Nom de l'étudiant : ${etudiant.name}",
                style: TextStyle(fontSize: 18),
              ),
              subtitle: Text(
                "Moyenne: ${etudiant.moyenne}",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
