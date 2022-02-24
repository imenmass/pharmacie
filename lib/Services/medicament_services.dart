import 'dart:convert';

import 'package:http/http.dart' as http;
class MedicamentServices{

  Future<String?> AddMedicament(String nom , String prix ,String id_pharmacien ,String id_patient ) async {
    String url = "https://localhost:5001/medicament";
    if (nom !=null || prix!=null ||id_pharmacien !=null || id_patient!=null  ) {
      final response =
      await http.post(Uri.parse(url), body:
      jsonEncode({
        "nom": nom,
        "prix": prix,
        "id_pharmacien": id_pharmacien,
        "id_patient": id_patient
      }), headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      });
      return "";
    }
    else {
      return "l'ajout est echoué" ;
    }
  }
  Future<void> DeleteMedicament(String id ) async {
    String url = "https://localhost:5001/medicament/"+id;
      final response =
      await http.delete(Uri.parse(url)  , headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      });
      print ("bara mriguel !");

    }


  Future<String?> UpdateMedicament(String id ,String nom , String prix ,String id_pharmacien ,String id_ordonnance ) async {
    String url = "https://localhost:5001/medicament/"+id;

    if (id!= null || nom !=null || prix!=null||id_pharmacien !=null || id_ordonnance!=null ) {
      final response =
      await http.put(Uri.parse(url), body:
      jsonEncode({
        "id" : id,
        "nom": nom,
        "prix": prix,
        "id_pharmacien": id_pharmacien,
        "id_ordonnance": id_ordonnance
      }), headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      });
      print("sucess");

    }
    return "ok" ;
  }


  }
