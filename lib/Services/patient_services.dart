import 'dart:convert';

import 'package:http/http.dart' as http;
class PatientServices{

  Future<String?> AddPatient(String nom , String prenom ,String cin ,String tel ) async {
    String url = "https://localhost:5001/patient";
    if (nom !=null || prenom!=null ||cin !=null || tel!=null  ) {
      final response =
      await http.post(Uri.parse(url), body:
      jsonEncode({
        "nom": nom,
        "prenom": prenom,
        "cin": cin,
        "tel": tel
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
  Future<void> DeletePatient(String id ) async {
    String url = "https://localhost:5001/patient/"+id;
      final response =
      await http.delete(Uri.parse(url)  , headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      });
      print ("bara mriguel !");

    }


  Future<String?> UpdatePatient(String id ,String nom , String prenom ,String cin ,String tel ) async {
    String url = "https://localhost:5001/patient/"+id;
    print(nom);
    print(prenom);
    print(cin);
    print(tel);
    if (nom !=null || prenom!=null ||cin !=null || tel!=null  ) {
      final response =
      await http.put(Uri.parse(url), body:
      jsonEncode({
        "id" : id,
        "nom": nom,
        "prenom": prenom,
        "cin": cin,
        "tel": tel
      }), headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      });
      print("sucess");

    }
    return "ok" ;
  }


  }
