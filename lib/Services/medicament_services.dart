import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
  
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('medicament');

class MedicamentServices {
  Future<String?> AddMedicament(
      String nom, String prix, String id_pharmacien, String id_patient) async {
    String url = "https://localhost:5001/medicament";
    if (nom != null ||
        prix != null ||
        id_pharmacien != null ||
        id_patient != null) {
      final response = await http.post(Uri.parse(url),
          body: jsonEncode({
            "nom": nom,
            "prix": prix,
            "id_pharmacien": id_pharmacien,
            "id_patient": id_patient
          }),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          });
      return "";
    } else {
      return "l'ajout est echoué";
    }
  }

  Future<void> DeleteMedicament(String id) async {
    String url = "https://localhost:5001/medicament/" + id;
    final response = await http.delete(Uri.parse(url), headers: {
      "Accept": "application/json",
      "content-type": "application/json"
    });
    print("bara mriguel !");
  }

  Future<String?> UpdateMedicament(String id, String nom, String prix,
      String id_pharmacien, String id_ordonnance) async {
    String url = "https://localhost:5001/medicament/" + id;

    if (id != null ||
        nom != null ||
        prix != null ||
        id_pharmacien != null ||
        id_ordonnance != null) {
      final response = await http.put(Uri.parse(url),
          body: jsonEncode({
            "id": id,
            "nom": nom,
            "prix": prix,
            "id_pharmacien": id_pharmacien,
            "id_ordonnance": id_ordonnance
          }),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          });
      print("sucess");
    }
    return "ok";
  }

static String? id;

 static Future<void> addItem({
    required String id,
    required String nom,
    required String prix,
    required String id_pharmacien,
    required String id_ordonnance,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(id).collection('items').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "id": id,
    "nom": nom,
    "prix": prix,
    "id_pharmacien": id_pharmacien,
    "id_ordonnance": id_ordonnance,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Notes item added to the database"))
        .catchError((e) => print(e));
  }

  
  static Stream<QuerySnapshot> readItems() {
    CollectionReference notesItemCollection =
        _mainCollection.doc(id).collection('items');

    return notesItemCollection.snapshots();
  }

  static Future<void> updateItem({
    required String title,
    required String description,
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(id).collection('items').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "description": description,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Note item updated in the database"))
        .catchError((e) => print(e));
  }

  static Future<void> deleteItem({
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(id).collection('items').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Note item deleted from the database'))
        .catchError((e) => print(e));
  }

}


