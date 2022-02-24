// To parse this JSON data, do
//
//     final medicamentodel = medicamentModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';


String medicamentModelToMap(MedicamentModel data) => json.encode(data.toMap());

class MedicamentModel {
  MedicamentModel(
      this.id,
      this.nom,
      this.prix,
      this.id_pharmacien,
      this.id_ordonnance
      );

  String id;
  String nom;
  String prix;
  String id_pharmacien;
  String id_ordonnance;


  Map<String, dynamic> toMap() => {
    "id": id,
    "nom": nom,
    "prix": prix,
    "id_pharmacien": id_pharmacien,
    "id_ordonnance": id_ordonnance,
  };



}
