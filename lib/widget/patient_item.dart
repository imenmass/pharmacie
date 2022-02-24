import 'package:flutter/material.dart';
import 'package:pharmacie/Services/patient_services.dart';
import 'package:pharmacie/screens/patient.dart';
import 'package:pharmacie/screens/update_patient.dart';

class PatientItem extends StatelessWidget {
  final String id;
  final String nom;
  final String prenom;
  final String cin;
  final String tel;
  const PatientItem(this.id, this.nom, this.prenom, this.cin , this.tel);
  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushReplacement(new MaterialPageRoute<UpdatePatient>(
            builder: (BuildContext context) {
              return new UpdatePatient(id: id, nom: nom, prenom: prenom , cin: cin, ntel:tel);
            },
          ));
        },
      child :
      Container(
      height: 70,
      width: 330,
      margin: const EdgeInsets.fromLTRB(20, 8, 20, 5),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 20,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 45,
            height: 45,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(0xFFD6DAFF),
            ),
            child: Icon(
              Icons.person,
              color: Color(0xFF1926BB),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                nom + " " + prenom,
                style: TextStyle(
                  color: Color(0xFF1F2937),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Roboto',
                ),
              ),
              Text(
                cin,
                style: TextStyle(
                  color: Color(0xFF1F2937),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Roboto',
                ),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            margin: EdgeInsets.only(right: 12),
            child: IconButton(
              onPressed: () {
                PatientServices().DeletePatient(id).then((value) =>   Navigator.of(context)
                    .pushReplacement(new MaterialPageRoute<Patient>(
                  builder: (BuildContext context) {
                    return new Patient();
                  },
                )));
              },
              icon: Icon(
                Icons.delete,
                color: Color(0xFFF02020),
              ),
            ),
          ),
        ],
      ),
    ),);
  }
}
