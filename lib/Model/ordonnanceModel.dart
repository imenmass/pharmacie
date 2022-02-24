// To parse this JSON data, do
//
//     final ordonnanceodel = ordonnanceModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';


String ordonnanceModelToMap(OrdonnanceModel data) => json.encode(data.toMap());

class OrdonnanceModel {
  OrdonnanceModel(
      this.id,
      this.date,
      this.id_patient
      );

  String id;
  String date;
  String id_patient;


  Map<String, dynamic> toMap() => {
    "id": id,
    "date": date,
    "id_patient": id_patient,
  };

  @override
  String toString() {
    return 'OrdonnanceModel{id: $id, date: $date, id_patient: $id_patient}';
  }
}
