import 'dart:convert';

import 'package:http/http.dart' as http;
class PharmacienServices{

  Future<String?> AddPharmacien(String nom , String prenom ,String cin ,String email ,String tel ) async {
    String url = "https://localhost:5001/pharmacien";
    if (nom !=null || prenom!=null ||cin !=null ||email!=null || tel!=null  ) {
      final response =
      await http.post(Uri.parse(url), body:
      jsonEncode({
        "nom": nom,
        "prenom": prenom,
        "cin": cin,
        "tel": tel,
        "email": email
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
  Future<void> DeletePharmacien(String id ) async {
    String url = "https://localhost:5001/pharmacien/"+id;
      final response =
      await http.delete(Uri.parse(url)  , headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      });
      print ("bara mriguel !");

    }


  Future<String?> UpdatePharmacien(String id ,String nom , String prenom ,String cin ,String email ,String tel ) async {
    String url = "https://localhost:5001/pharmacien/"+id;
    print(nom);
    print(prenom);
    print(email);
    print(cin);
    print(tel);
    if (nom !=null || prenom!=null ||cin !=null ||email!=null || tel!=null  ) {
      final response =
      await http.put(Uri.parse(url), body:
      jsonEncode({
        "id" : id,
        "nom": nom,
        "prenom": prenom,
        "email": email,
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
