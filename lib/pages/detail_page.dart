import 'package:appnoteetudiant/widgets/widget_class_etudiant.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    // securité de validation

    final args = ModalRoute.of(context)?.settings.arguments;
    if (args == null || args is! Etudiants) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: Colors.white),
          ),
          title: const Text("Erreur", style: TextStyle(color: Colors.white)),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: const Center(child: Text("Aucun étudiant trouvé.")),
      );
    }

    final etudiant = args;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Détails de l'étudiant",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(15),
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey[200],
          ),
          child: ListTile(
            leading: CircleAvatar(radius: 50, child: Icon(Icons.person)),
            title: Text(
              "Nom de l'étudiant : ${etudiant.name}",
              style: const TextStyle(fontSize: 24),
            ),
            subtitle: Text(
              "Moyenne : ${etudiant.moyenne}",
              style: const TextStyle(fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}
