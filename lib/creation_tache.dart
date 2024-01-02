// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/models/tache.dart';

class CreationTache extends StatefulWidget {
  const CreationTache({super.key});

  @override
  State<CreationTache> createState() => _CreationTacheState();
}

class _CreationTacheState extends State<CreationTache> {
  String typevalue = "Scollaire";
  String etatvalue = "En progress";
  final titreContr = TextEditingController();
  final dateDebutContr = TextEditingController();
  final dateFinContr = TextEditingController();
  final avancemntContr = TextEditingController();

  void energistrerTache() async {
    String titreValue = titreContr.text;
    DateTime dateDebutValue = DateTime.parse(dateDebutContr.text);
    DateTime dateFinValue = DateTime.parse(dateFinContr.text);
    String typeValue = typevalue;
    String etatValue = etatvalue;
    int avancemntValue = int.parse(avancemntContr.text);
    Tache tache = Tache(
      type: typeValue,
      titre: titreValue,
      dateDebut: dateDebutValue,
      dateFin: dateFinValue,
      etat: etatValue,
      avancemnt: avancemntValue,
    );
    try {
      await FirebaseFirestore.instance
          .collection("tache")
          .doc()
          .set(tache.toFireStore());
      // Afficher une message de succès
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Tâche enregistrée"),
        backgroundColor: Colors.green,
      ));
      Navigator.pushNamed(context, "listTaches");
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("cration de taches"),
      // ),
      body: Container(
        padding:
            const EdgeInsets.only(top: 40, left: 15, right: 15, bottom: 20),
        child: ListView(
          children: [
            const Text(
              "Creer une nouvelle tache ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("Type "),
            const SizedBox(
              height: 8,
            ),
            InputDecorator(
              decoration: const InputDecoration(
                  filled: true,
                  // hintStyle: TextStyle(fontSize: 13),
                  fillColor: Color.fromRGBO(235, 233, 233, 0.612),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero),
              child: Align(
                alignment: Alignment.centerRight,
                child: DropdownButton(
                  items: const [
                    DropdownMenuItem(
                      value: "Scollaire",
                      child: Text("Scollaire"),
                    ),
                    DropdownMenuItem(
                      value: "Personelle",
                      child: Text("Personelle"),
                    ),
                  ],
                  icon: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.blueAccent,
                  ),
                  iconSize: 24,
                  // alignment: Alignment.centerRight,
                  onChanged: (value) {
                    setState(() {
                      typevalue = value!;
                    });
                  },
                  value: typevalue,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("Titre"),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: titreContr,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color.fromRGBO(235, 233, 233, 0.612),
                border: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Date de début'),
                      SizedBox(
                        // height: 40,
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: TextFormField(
                          controller: dateDebutContr,
                          keyboardType: TextInputType.datetime,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(235, 233, 233, 0.612),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Date de fin'),
                      SizedBox(
                        // height: 40,
                        width: MediaQuery.of(context).size.width * 0.48,
                        child: TextFormField(
                          controller: dateFinContr,
                          keyboardType: TextInputType.datetime,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(235, 233, 233, 0.612),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Etat'),
                      SizedBox(
                        // height: 40,
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: InputDecorator(
                          decoration: const InputDecoration(
                              filled: true,
                              // hintStyle: TextStyle(fontSize: 13),
                              fillColor: Color.fromRGBO(235, 233, 233, 0.612),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.zero),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: DropdownButton(
                              items: const [
                                DropdownMenuItem(
                                  value: "En progress",
                                  child: Text("En progress"),
                                ),
                                DropdownMenuItem(
                                  value: "A faire",
                                  child: Text("A faire"),
                                ),
                                DropdownMenuItem(
                                  value: "termine",
                                  child: Text("termine"),
                                ),
                              ],
                              icon: const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Colors.blueAccent,
                              ),
                              iconSize: 24,
                              // alignment: Alignment.centerRight,
                              onChanged: (value) {
                                setState(() {
                                  etatvalue = value!;
                                });
                              },
                              value: etatvalue,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Avancement'),
                      SizedBox(
                        // height: 40,
                        width: MediaQuery.of(context).size.width * 0.48,
                        child: TextFormField(
                          controller: avancemntContr,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(235, 233, 233, 0.612),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ), //gestion-taches
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)),
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                energistrerTache();
              },
              child: const Text("Crrér une tache"),
            )
          ],
        ),
      ),
    );
  }
}
