import 'package:flutter/material.dart';

import 'package:gam_paiement/widgets/navbar.dart';
import 'package:gam_paiement/widgets/drawer.dart';
//widgets

class SecondeStep extends StatefulWidget {
  SecondeStep({Key key}) : super(key: key);

  @override
  _SecondeStepState createState() => _SecondeStepState();
}

class _SecondeStepState extends State<SecondeStep> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.horizontal;
  var _typeSelected = '';

  Widget _buildContactType(String title) {
    return InkWell(
      child: Container(
        height: 40,
        width: 90,
        decoration: BoxDecoration(
          color: _typeSelected == title
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
          _typeSelected = title;
        });
      },
    );
  }

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
    return Scaffold(
      appBar: Navbar(
        title: "Paiement Facture",
      ),
      drawer: ArgonDrawer(currentPage: "Paiement Facture"),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Stepper(
                type: stepperType,
                physics: ScrollPhysics(),
                currentStep: _currentStep,
                onStepTapped: (step) => tapped(step),
                onStepContinue: continued,
                onStepCancel: cancel,
                steps: <Step>[
                  Step(
                    title: new Text('Moyen de paiement'),
                    content: Column(children: <Widget>[
                      SizedBox(
                        height: 15,
                      ),
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
                    ]),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 0
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                ],
              ),
            ),
            new RaisedButton(
              child: new Text(
                'Save details',
                style: new TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                //submitAction(context);submitAction(context);
                alertDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }
}
