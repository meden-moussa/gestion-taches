class Tache {
  String type;
  String titre;
  DateTime dateDebut;
  DateTime dateFin;
  String etat;
  int avancemnt;

  Tache(
      {required this.type,
      required this.titre,
      required this.dateDebut,
      required this.dateFin,
      required this.etat,
      required this.avancemnt});

  Map<String, dynamic> toFireStore() {
    return {
      "type": type,
      "titre": titre,
      "dateDebut": dateDebut.toIso8601String(),
      "dateFin": dateFin.toIso8601String(),
      "etat": etat,
      "avancement": avancemnt
    };
  }
}
