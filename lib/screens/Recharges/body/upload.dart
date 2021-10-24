import 'dart:collection';
import 'package:flutter/material.dart';
//screens
import 'package:gam_paiement/databasemanager/databasemanager.dart';
import 'operation.dart';
import 'paiement.dart';
import 'info.dart';

class Upload extends StatefulWidget {
  var mapInfo = HashMap<String, String>();

  Upload(this.mapInfo);

  @override
  State<StatefulWidget> createState() {
    return UploadState();
  }
}

class UploadState extends State<Upload> {
  //Function which shows Alert Dialog
  alertDialog(BuildContext context) {
    // This is the ok button
    Widget ok = FlatButton(
      child: Text("Ok"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    // show the alert dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("opération effectué avec succès",
              style: new TextStyle(color: Colors.green)),
          actions: [
            ok,
          ],
          elevation: 5,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var fournisseur = widget.mapInfo["fournisseur"];
    var numero_client = widget.mapInfo["numero_client"];
    var numero_recharge = widget.mapInfo["numero_recharge"];
    var type_recharge = widget.mapInfo["type_recharge"];
    var montant = widget.mapInfo["montant"];

    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                "N Ligne Client ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(numero_client, style: TextStyle(fontSize: 16)),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              Text(
                "N a recharger : ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(numero_recharge, style: TextStyle(fontSize: 16)),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              Text(
                "Fournisseur: ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(fournisseur, style: TextStyle(fontSize: 16)),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              Text(
                "Type de recharge :",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(type_recharge, style: TextStyle(fontSize: 16)),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              Text(
                "Montant de recharge (DH):",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(montant, style: TextStyle(fontSize: 16)),
            ],
          ),
          Row(
            children: <Widget>[
              new RaisedButton(
                child: new Text(
                  'Save details',
                  style: new TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {
                  submitAction(context);
                  alertDialog(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

submitAction(BuildContext context) {
  createrecharge(
    OperationState.fournisseur.text,
    InfoState.numero_client.text,
    InfoState.numero_recharge.text,
    InfoState.type_recharge.text,
    InfoState.montant.text,
    PaiementState.entitee.toString(),
    PaiementState.status.toString(),
    PaiementState.agence.toString(),
    PaiementState.dateTransaction,
  );
}

//create methode
void createrecharge(
  String fournisseur,
  String numero_client,
  String numero_recharge,
  String type_recharge,
  String montant,
  String entitee,
  String status,
  String agence,
  DateTime dateTransaction,
) async {
  await DatabaseManager().createrechargeData(
      fournisseur,
      numero_client,
      numero_recharge,
      type_recharge,
      montant,
      entitee,
      status,
      agence,
      dateTransaction);
}
