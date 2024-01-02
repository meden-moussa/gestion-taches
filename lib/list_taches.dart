import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListTache extends StatefulWidget {
  const ListTache({super.key});

  @override
  State<ListTache> createState() => _ListTacheState();
}

class _ListTacheState extends State<ListTache> {
  @override
  void dispose() {
    // ...
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.add,
            color: Colors.blueAccent,
          ),
          onPressed: () {
            Navigator.pushNamed(context, "creerTache");
          }),
      appBar: AppBar(
        title: const Text(
          "Mes taches",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("tache").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: snapshot.data!.docs.map((doc) {
                  return Column(
                    children: [
                      Text(doc["titre"]),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(doc["type"]),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(doc["dateDebut"]),
                      Text(doc["dateFin"]),
                      Text(doc["etat"]),
                      Text(doc["progression"]),
                    ],
                  );
                }).toList(),
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
