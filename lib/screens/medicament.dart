import 'package:flutter/material.dart';
import 'package:pharmacie/Model/medicamentModel.dart';
import 'package:pharmacie/screens/pharmacien.dart';
import 'package:pharmacie/screens/patient.dart';
import 'package:pharmacie/screens/ordonnance.dart';
import 'package:pharmacie/screens/add_medicament.dart';
import 'package:pharmacie/widget/medicament_item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//import 'package:shared_preferences/shared_preferences.dart';
class Medicament extends StatefulWidget {
  const Medicament({Key? key}) : super(key: key);

  @override
  _MedicamentState createState() => _MedicamentState();
}


class _MedicamentState extends State<Medicament> {

  final List<dynamic> _medicamentList = [];
  late Future<bool> futureMedicament;

  Future<bool> getAllPhrmacien() async {
    String url = "https://localhost:5001/medicament";
    bool res = false ;
    http.Response response =  await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> _medicamentsFromServer = json.decode(response.body) ;

      for (int i = 0; i < _medicamentsFromServer.length; i++) {
        print(_medicamentsFromServer);
        try {
          MedicamentModel m = MedicamentModel(
              _medicamentsFromServer[i]["id"].toString(),
              _medicamentsFromServer[i]["nom"],
              _medicamentsFromServer[i]["prix"].toString(),
              _medicamentsFromServer[i]["id_pharmacien"].toString(),
              _medicamentsFromServer[i]["id_ordonnance"].toString()
          );
        _medicamentList.add(m);
        }
        catch(e){
          print(e);
        }
      }

    res  = true ;
    }
  return res ;
  }


  @override
  void initState() {
    // TODO: implement initState
    futureMedicament = getAllPhrmacien();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Material(
          elevation: 20,
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(10.0, 0.0), //(x,y)
                    blurRadius: 30,
                    spreadRadius: 15),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: (){
                      Navigator.of(context)
                          .pushReplacement(new MaterialPageRoute<Pharmacien>(
                        builder: (BuildContext context) {
                          return new Pharmacien();
                        },
                      ));
                    }, icon: Icon(
                      Icons.local_pharmacy,
                      size: 30,
                      color: Color(0xFF1926BB),
                    )),
                    Text(
                      "Phamacien",
                      style: TextStyle(
                        color: Color(0XFF1926BB),
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: (){
                      Navigator.of(context)
                          .pushReplacement(new MaterialPageRoute<Patient>(
                        builder: (BuildContext context) {
                          return new Patient();
                        },
                      ));
                    }, icon: Icon(
                      Icons.sick,
                      size: 30,
                      color: Color(0xFF1926BB),
                    )),
                    Text(
                      "Patient",
                      style: TextStyle(
                        color: Color(0xFF363636),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    IconButton(onPressed: (){
                      Navigator.of(context)
                          .pushReplacement(new MaterialPageRoute<Medicament>(
                        builder: (BuildContext context) {
                          return new Medicament();
                        },
                      ));
                    }, icon: Icon(
                      Icons.local_hospital,
                      size: 30,
                      color: Color(0xFF1926BB),
                    )),
                    Text(
                      "Medicament",
                      style: TextStyle(
                        color: Color(0xFF363636),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: (){
                      Navigator.of(context)
                          .pushReplacement(new MaterialPageRoute<Ordonnance>(
                        builder: (BuildContext context) {
                          return new Ordonnance();
                        },
                      ));
                    }, icon: Icon(
                      Icons.description,
                      size: 30,
                      color: Color(0xFF1926BB),
                    )),
                    Text(
                      "Ordonnace",
                      style: TextStyle(
                        color: Color(0xFF363636),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFFFFFFFF),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 12, top: 45),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tous les medicaments",
                        style: TextStyle(
                          color: Color(0xFF1F2937),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      Text(
                        "Vous trouvez les condonner des medicaments ici  ",
                        style: TextStyle(
                          color: Color(0xFF6B7280),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 45,
                    height: 45,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xFFD6DAFF),
                    ),
                    child: IconButton(
                      onPressed: () {  Navigator.of(context)
                          .pushReplacement(new MaterialPageRoute<AddMedicament>(
                        builder: (BuildContext context) {
                          return new AddMedicament();
                        },
                      ));},
                      icon: Icon(
                        Icons.add,
                        color: Color(0xFF1926BB),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 37,
            ),
            Expanded(
              child: FutureBuilder<bool>(
                  future: futureMedicament,
                  builder:
                      (BuildContext context, AsyncSnapshot<bool> snapshot) {
                    if (snapshot.hasError){ return Container(
                      child: Center(
                        child: CircularProgressIndicator(),

                      ),
                    );}

                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return MedicamentItem(
                            _medicamentList[index].id,
                            _medicamentList[index].nom,
                            _medicamentList[index].prix,
                            _medicamentList[index].id_pharmacien,
                            _medicamentList[index].id_ordonnance
                        );
                      },

                      itemCount: _medicamentList.length,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
