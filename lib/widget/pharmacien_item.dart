import 'package:flutter/material.dart';
import 'package:pharmacie/Services/pharmacien_services.dart';
import 'package:pharmacie/screens/pharmacien.dart';
import 'package:pharmacie/screens/update_pharmacien.dart';

class PharmacienItem extends StatelessWidget {
  final String id;
  final String nom;
  final String prenom;
  final String email;
  final String cin;
  final String tel;
  const PharmacienItem(this.id, this.nom, this.prenom, this.cin, this.email , this.tel);
  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushReplacement(new MaterialPageRoute<UpdatePharmacien>(
            builder: (BuildContext context) {
              return new UpdatePharmacien(id: id, nom: nom, prenom: prenom, email: email , cin: cin, ntel:tel);
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
                email,
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
                PharmacienServices().DeletePharmacien(id).then((value) =>   Navigator.of(context)
                    .pushReplacement(new MaterialPageRoute<Pharmacien>(
                  builder: (BuildContext context) {
                    return new Pharmacien();
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
