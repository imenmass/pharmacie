import 'package:flutter/material.dart';
import 'package:pharmacie/Services/patient_services.dart';
import 'package:pharmacie/screens/patient.dart';
import 'package:pharmacie/screens/pharmacien.dart';
import 'package:pharmacie/screens/ordonnance.dart';
import 'package:pharmacie/screens/medicament.dart';
class UpdatePatient extends StatefulWidget {
  late String _id ;
  late String _nom ;
  late String _prenom ;
  late String _ntel ;
  late String _cin ;
  late String _email ;
   UpdatePatient({required id,required nom,required prenom,required ntel,required cin,  Key? key}) :

  _id = id , _nom = nom , _prenom = prenom , _ntel = ntel ,_cin = cin , super(key: key);

  @override
  _UpdatePatientState createState() => _UpdatePatientState();
}

class _UpdatePatientState extends State<UpdatePatient> {

  GlobalKey<FormState> _myKey = new GlobalKey();
  var nom ;
  var prenom ;
  var ntel  ;
  var cin ;

  @override
  void initState() {
    nom = widget._nom;
    prenom = widget._prenom ;
    ntel = widget._ntel ;
    cin = widget._cin;
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
                "Modifier Patient",
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


              TextFormField(
                initialValue:  widget._nom,
                onChanged: (value){
                  setState(() {
                    print("inside !!!!!!!");
                    nom = value ;
                    print(value);
                    print("inside !!!!!!!");
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
              TextFormField(
                initialValue: widget._prenom,
                onChanged: (value){
                  setState(() {
                    prenom = value ;
                  });
                },
                style: TextStyle(fontSize: 12),
                decoration: InputDecoration(
                  suffixIcon:Icon(
                    Icons.person,
                    color: Color(0xFF363636),
                  ),
                  labelText: "Enter le prenom",
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
              TextFormField(
                initialValue: widget._cin,
                onChanged:  (value){
                  setState(() {
                    cin = value ;
                  });
                },
                style: TextStyle(fontSize: 12),
                decoration: InputDecoration(
                  suffixIcon: Icon(
                  Icons.credit_card,
                  color: Color(0xFF363636),
                  ),
                  labelText: "cin",
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
              TextFormField(
                initialValue: widget._ntel,
                onChanged:  (value){
                  setState(() {
                    ntel = value ;
                  });
                },
                style: TextStyle(fontSize: 12),
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.phone,
                    color: Color(0xFF363636),
                  ),
                  labelText: "telephone",
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
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    PatientServices().UpdatePatient(widget._id, nom, prenom, cin, ntel)
                        .then((value) =>
                    {
                        Navigator.of(context)
                        .pushReplacement(new MaterialPageRoute<Patient>(
                      builder: (BuildContext context) {
                        return new Patient();
                      },
                    ))
                    });

                  },
                  child: Text("modifier"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
