import 'dart:collection';
import 'package:flutter/material.dart';
import 'operation.dart';
import 'paiement.dart';
import 'info.dart';
import 'upload.dart';
import 'package:gam_paiement/widgets/navbar.dart';
import 'package:gam_paiement/widgets/drawer.dart';

class FlutterStepperPage extends StatefulWidget {
  FlutterStepperPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FlutterStepperPageState createState() => _FlutterStepperPageState();
}

class _FlutterStepperPageState extends State<FlutterStepperPage> {
  var currentStep = 0;

  @override
  Widget build(BuildContext context) {
    var mapData = HashMap<String, String>();
    mapData["fournisseur"] = OperationState.fournisseur.text;
    mapData["numero_client"] = InfoState.numero_client.text;
    mapData["numero_recharge"] = InfoState.numero_recharge.text;
    mapData["type_recharge"] = InfoState.type_recharge.text;
    mapData["montant"] = InfoState.montant.text;
    mapData["status"] = PaiementState.status.toString();
    mapData["entitee"] = PaiementState.entitee.toString();
    mapData["agence"] = PaiementState.agence.toString();
    mapData["dateTransaction"] = PaiementState.dateTransaction.toString();

    List<Step> steps = [
      Step(
        title: Text('Choix du fournisseur'),
        content: Operation(),
        state: currentStep == 0 ? StepState.editing : StepState.indexed,
        isActive: true,
      ),
      Step(
        title: Text('Saisie informations '),
        content: Info(),
        state: currentStep == 1 ? StepState.editing : StepState.indexed,
        isActive: true,
      ),
      Step(
        title: Text('Moyen Paiement'),
        content: Paiement(),
        state: currentStep == 1 ? StepState.editing : StepState.indexed,
        isActive: true,
      ),
      Step(
        title: Text('Upload'),
        content: Upload(mapData),
        state: StepState.complete,
        isActive: true,
      ),
    ];

    return Scaffold(
      appBar: Navbar(
        title: "Recharges",
      ),
      drawer: ArgonDrawer(currentPage: "Recharges"),
      body: Container(
        child: Stepper(
          currentStep: this.currentStep,
          steps: steps,
          type: StepperType.vertical,
          onStepTapped: (step) {
            setState(() {
              currentStep = step;
            });
          },
          onStepContinue: () {
            setState(() {
              if (currentStep < steps.length - 1) {
                if (currentStep == 0 &&
                    OperationState.formKey.currentState.validate()) {
                  currentStep = currentStep + 1;
                } else if (currentStep == 1 &&
                    InfoState.formKey.currentState.validate()) {
                  currentStep = currentStep + 1;
                } else if (currentStep == 1 &&
                    PaiementState.formKey.currentState.validate()) {
                  currentStep = currentStep + 1;
                } else if (currentStep == 1) {
                  currentStep = currentStep + 1;
                } else {
                  currentStep = 0;
                }
              }
            });
          },
          onStepCancel: () {
            setState(() {
              if (currentStep > 0) {
                currentStep = currentStep - 1;
              } else {
                currentStep = 0;
              }
            });
          },
        ),
      ),
    );
  }
}
