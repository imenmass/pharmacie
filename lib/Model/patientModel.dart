// To parse this JSON data, do
//
//     final patientModel = patientModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';


String patientModelToMap(PatientModel data) => json.encode(data.toMap());

class PatientModel {
  PatientModel(
      this.id,
      this.nom,
      this.prenom,
      this.cin,
      this.tel
      );

  String id;
  String nom;
  String prenom;
  String cin;
  String tel;


  Map<String, dynamic> toMap() => {
    "id": id,
    "nom": nom,
    "prenom": prenom,
    "cin": cin,
    "tel": tel
  };

  @override
  String toString() {
    return 'patientModel{id: $id, nom: $nom, prenom: $prenom, cin: $cin, tel: $tel}';
  }
}
