import 'dart:convert';

import 'package:http/http.dart' as http;
class OrdonnanceServices{

  Future<String?> AddOrdonnance(String date ,String id_patient ) async {
    String url = "https://localhost:5001/ordonnance";
    if ( date!=null ||id_patient !=null  ) {
      final response =
      await http.post(Uri.parse(url), body:
      jsonEncode({
        "prenom": date,
        "cin": id_patient
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
  Future<void> DeleteOrdonnance(String id ) async {
    String url = "https://localhost:5001/ordonnance/"+id;
      final response =
      await http.delete(Uri.parse(url)  , headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      });
      print ("bara mriguel !");

    }


  Future<String?> UpdateOrdonnance(String id ,String date , String id_patient ) async {
    String url = "https://localhost:5001/ordonnance/"+id;
    print(date);
    print(id_patient);
    if (date !=null || id_patient!=null  ) {
      final response =
      await http.put(Uri.parse(url), body:
      jsonEncode({
        "id" : id,
        "date": date,
        "id_patient": id_patient,
      }), headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      });
      print("sucess");

    }
    return "ok" ;
  }


  }
