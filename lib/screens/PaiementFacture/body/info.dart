import 'package:flutter/material.dart';
import 'operation.dart';
import 'produit.dart';
import 'package:gam_paiement/databasemanager/databasemanager.dart';

class Info extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InfoState();
  }
}

class InfoState extends State<Info> {
  static final formKey = GlobalKey<FormState>();

  static TextEditingController numero_ligne = new TextEditingController();
  static DateTime dateTransaction = DateTime.now();
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
            controller: numero_ligne,
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
          RaisedButton(
            child: Text(
              'Save details',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              submitAction(context);
              Navigator.pushReplacementNamed(context, '/next');
            },
            color: Colors.blue,
          ),
        ],
      ),
    ));
  }
}

//create methode
submitAction(BuildContext context) {
  createfacture(
    OperationState.fournisseur.text,
    ProduitState.produit.text,
    InfoState.numero_ligne.text,
    InfoState.dateTransaction,
  );
  //_nameController.clear();
  //_genderController.clear();
  //_scoreController.clear();
}

void createfacture(
  String fournisseur,
  String produit,
  String numero_ligne,
  DateTime dateTransaction,
) async {
  await DatabaseManager().createpaiementfacture(
      fournisseur, produit, numero_ligne, dateTransaction);
}
