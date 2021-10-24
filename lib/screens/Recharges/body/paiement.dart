import 'package:flutter/material.dart';

class Paiement extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PaiementState();
  }
}

class PaiementState extends State<Paiement> {
  static final formKey = GlobalKey<FormState>();

  static String status = "Accepte";
  static String entitee = "Mono";
  static String agence = "AgenceMono";
  static DateTime dateTransaction = DateTime.now();

  var typeSelected = '';

  Widget _buildContactType(String title) {
    return InkWell(
      child: Container(
        height: 40,
        width: 90,
        decoration: BoxDecoration(
          color: typeSelected == title
              ? Colors.green
              : Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
      onTap: () {
        setState(() {
          typeSelected = title;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: Form(
      key: formKey,
      autovalidate: false,
      child: Column(
        children: <Widget>[
          Container(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildContactType('Especes'),
                SizedBox(width: 10),
                _buildContactType('cheque'),
                SizedBox(width: 10),
                _buildContactType('carte bancaire'),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
