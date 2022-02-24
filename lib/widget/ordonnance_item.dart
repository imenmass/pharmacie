import 'package:flutter/material.dart';
import 'package:pharmacie/Services/ordonnance_services.dart';
import 'package:pharmacie/screens/ordonnance.dart';
import 'package:pharmacie/screens/update_ordonnance.dart';

class OrdonnanceItem extends StatelessWidget {
  final String id;
  final String date;
  final String id_patient;
  const OrdonnanceItem(this.id, this.date, this.id_patient);
  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushReplacement(new MaterialPageRoute<UpdateOrdonnance>(
            builder: (BuildContext context) {
              return new UpdateOrdonnance(id: id, date: date, id_patient:id_patient );
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
                    id + " : " + date,
                    style: TextStyle(
                      color: Color(0xFF1F2937),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  Text(
                    id_patient,
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
                    OrdonnanceServices().DeleteOrdonnance(id).then((value) =>   Navigator.of(context)
                        .pushReplacement(new MaterialPageRoute<Ordonnance>(
                      builder: (BuildContext context) {
                        return new Ordonnance();
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
