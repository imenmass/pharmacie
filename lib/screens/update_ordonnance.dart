import 'package:flutter/material.dart';
import 'package:pharmacie/Services/ordonnance_services.dart';
import 'package:pharmacie/screens/pharmacien.dart';
import 'package:pharmacie/screens/ordonnance.dart';
import 'package:pharmacie/screens/medicament.dart';
import 'package:pharmacie/screens/patient.dart';
class UpdateOrdonnance extends StatefulWidget {
  late String _id ;
  late String _date ;
  late String _id_patient ;
   UpdateOrdonnance({required id,required date,required id_patient , Key? key}) :

  _id = id , _date = date , _id_patient = id_patient , super(key: key);

  @override
  _UpdateOrdonnanceState createState() => _UpdateOrdonnanceState();
}

class _UpdateOrdonnanceState extends State<UpdateOrdonnance> {

  GlobalKey<FormState> _myKey = new GlobalKey();
  var id ;
  var date ;
  var id_patient  ;

  @override
  void initState() {
    id = widget._id;
    date = widget._date ;
    id_patient = widget._id_patient ;
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
                "Modifier ordonnance",
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
                initialValue:  widget._id,
                onChanged: (value){
                  setState(() {
                    print("inside !!!!!!!");
                    id = value ;
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
                  labelText: "Enter l'id",
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
                initialValue: widget._date,
                onChanged: (value){
                  setState(() {
                    date = value ;
                  });
                },
                style: TextStyle(fontSize: 12),
                decoration: InputDecoration(
                  suffixIcon:Icon(
                    Icons.date_range_rounded,
                    color: Color(0xFF363636),
                  ),
                  labelText: "Enter la date",
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
                initialValue: widget._id_patient,
                onChanged:  (value){
                  setState(() {
                    id_patient = value ;
                  });
                },
                style: TextStyle(fontSize: 12),
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.person,
                    color: Color(0xFF363636),
                  ),
                  labelText: "id patient",
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
                    OrdonnanceServices().UpdateOrdonnance(widget._id, date, id_patient)
                        .then((value) =>
                    {
                        Navigator.of(context)
                        .pushReplacement(new MaterialPageRoute<Ordonnance>(
                      builder: (BuildContext context) {
                        return new Ordonnance();
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
