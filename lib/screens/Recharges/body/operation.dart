import 'package:flutter/material.dart';

class Operation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return OperationState();
  }
}

class OperationState extends State<Operation> {
  static final formKey = GlobalKey<FormState>();

  static TextEditingController fournisseur = new TextEditingController();
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
            controller: fournisseur,
            decoration: InputDecoration(
              hintText: 'Choix du fournisseur',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
            validator: (value) {
              if (value.trim().isEmpty) {
                return "Fournisseur obligatoire";
              }
            },
          ),
        ],
      ),
    ));
  }
}
