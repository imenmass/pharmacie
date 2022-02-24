import 'package:flutter/material.dart';
import 'package:pharmacie/Services/medicament_services.dart';
import 'package:pharmacie/screens/patient.dart';
import 'package:pharmacie/screens/medicament.dart';
import 'package:pharmacie/screens/ordonnance.dart';
import 'package:pharmacie/screens/pharmacien.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pharmacie/Model/patientModel.dart';

class AddMedicament extends StatefulWidget {
  const AddMedicament({Key? key}) : super(key: key);

  @override
  _AddMedicamentState createState() => _AddMedicamentState();
}

class _AddMedicamentState extends State<AddMedicament> {
  var nom ;
  var prix ;
  var id_pharmacien ;
  var id_patient ;

  String dropdownValue = ' ';

  final List<dynamic> _patientList = [];
  late Future<bool> futurePatient;
  Future<bool> getAllPatients() async {
    String url = "https://localhost:5001/patient";
    bool res = false ;
    http.Response response =  await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> _patientsFromServer = json.decode(response.body) ;

      for (int i = 0; i < _patientsFromServer.length; i++) {
        print(_patientsFromServer.length);
        try {
          _patientList.add(_patientsFromServer[i]["id"].toString());
        }
        catch(e){
          print(e);
        }
      }

      res  = true ;
    }
    return res ;
  }

  String? error = "" ;
  GlobalKey<FormState> _myKey = new GlobalKey();
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

        margin: EdgeInsets.symmetric(horizontal: 12),
        child: Form(
          key: _myKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 38,
              ),
              const Text(
                "Ajouter medicament",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color(0xff363636),
                  fontSize: 32,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 25,
              ),


              TextField(
                onChanged: (value){
                  setState(() {
                    nom = value ;
                  });
                },
                style: TextStyle(fontSize: 12),
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.person,
                    color: Color(0xFF363636),
                  ),
                  labelText: "Enter le nom",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color(0xFF1926BB),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color(0xff363636),
                      width: 2.0,
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 21,
              ),
              TextField(
                onChanged: (value){
                  setState(() {
                    prix = value ;
                  });
                },
                style: TextStyle(fontSize: 12),
                decoration: InputDecoration(
                  suffixIcon:Icon(
                    Icons.person,
                    color: Color(0xFF363636),
                  ),
                  labelText: "Enter le prix",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color(0xFF1926BB),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color(0xff363636),
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 21,
              ),

              SizedBox(
                height: 21,
              ),
              TextField(
                onChanged:  (value){
                  setState(() {
                    id_pharmacien = value ;
                  });
                },
                style: TextStyle(fontSize: 12),
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.phone,
                    color: Color(0xFF363636),
                  ),
                  labelText: "id pharmacien",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color(0xFF1926BB),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color(0xff363636),
                      width: 2.0,
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 21,
              ),
              TextField(
                onChanged:  (value){
                  setState(() {
                    id_patient = value ;
                  });
                },
                style: TextStyle(fontSize: 12),
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.phone,
                    color: Color(0xFF363636),
                  ),
                  labelText: "id ordonnance",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color(0xFF1926BB),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color(0xff363636),
                      width: 2.0,
                    ),
                  ),
                ),
              ),

/*
          SizedBox(
            height: 21,
          ),
          FutureBuilder(
            future: futurePatient,
            builder: return DropdownButton(
        value: dropdownValue,
        icon: const Icon(Icons.arrow_downward),
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: _patientList[0]
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),

              ),
*/


              SizedBox(
                height: 20,
              ),
              Text(
                error!=""?error!:"",
                style: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    MedicamentServices().AddMedicament(nom, prix, id_pharmacien,id_patient)
                        .then((value) =>
                    {
                      if (value!="")
                        setState(() {
                          print (value);
                          error = value ;
                        })
                      else
                        Navigator.of(context)
                        .pushReplacement(new MaterialPageRoute<Medicament>(
                      builder: (BuildContext context) {
                        return new Medicament();
                      },
                    ))
                    });

                  },
                  child: Text("Valider"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
