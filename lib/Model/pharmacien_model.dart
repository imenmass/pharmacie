// To parse this JSON data, do
//
//     final pharmacienModel = pharmacienModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';


String pharmacienModelToMap(PharmacienModel data) => json.encode(data.toMap());

class PharmacienModel {
  PharmacienModel(
     this.id,
     this.nom,
     this.prenom,
     this.cin,
     this.tel,
     this.email,
  );

  String id;
  String nom;
  String prenom;
  String cin;
  String tel;
  String email;


  Map<String, dynamic> toMap() => {
    "id": id,
    "nom": nom,
    "prenom": prenom,
    "cin": cin,
    "tel": tel,
    "email": email,
  };

  @override
  String toString() {
    return 'PharmacienModel{id: $id, nom: $nom, prenom: $prenom, cin: $cin, tel: $tel, email: $email}';
  }
}
