import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InfoState();
  }
}

class InfoState extends State<Info> {
  static final formKey = GlobalKey<FormState>();

  static TextEditingController numero_client = new TextEditingController();
  static TextEditingController numero_recharge = new TextEditingController();
  static TextEditingController type_recharge = new TextEditingController();
  static TextEditingController montant = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: Form(
      key: formKey,
      autovalidate: false,
      child: Column(
        children: <Widget>[
          TextFormField(
            maxLines: 1,
            controller: numero_client,
            decoration: InputDecoration(
              hintText: 'Numéro de la ligne de téléphone du client',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
            validator: (value) {
              if (value.trim().isEmpty) {
                return "Numéro Obligatoire";
              }
            },
          ),
          TextFormField(
            maxLines: 1,
            controller: numero_recharge,
            decoration: InputDecoration(
              hintText: 'Numéro de la ligne de téléphone à recharger ',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
            validator: (value) {
              if (value.trim().isEmpty) {
                return "Numéro obligatoire";
              }
            },
          ),
          TextFormField(
            maxLines: 1,
            controller: type_recharge,
            decoration: InputDecoration(
              hintText: 'Type de recharge',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
            validator: (value) {
              if (value.trim().isEmpty) {
                return "Type Obligatoire";
              }
            },
          ),
          TextFormField(
            maxLines: 1,
            controller: montant,
            decoration: InputDecoration(
              hintText: 'Montant de recharge',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
            validator: (value) {
              if (value.trim().isEmpty) {
                return "Montant Obligatoire";
              }
            },
          ),
        ],
      ),
    ));
  }
}
