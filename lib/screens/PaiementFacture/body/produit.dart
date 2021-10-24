import 'package:flutter/material.dart';

class Produit extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProduitState();
  }
}

class ProduitState extends State<Produit> {
  static final formKey = GlobalKey<FormState>();

  static TextEditingController produit = new TextEditingController();
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
            controller: produit,
            decoration: InputDecoration(
              hintText: 'Choix produit',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
            validator: (value) {
              if (value.trim().isEmpty) {
                return "Produit obligatoire";
              }
            },
          ),
        ],
      ),
    ));
  }
}
