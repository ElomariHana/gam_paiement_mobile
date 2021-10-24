import 'package:flutter/material.dart';
import 'package:gam_paiement/screens/PaiementFacture/body/mainFac.dart';

//widgets

class PaiementFacture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterStepperPage(),
    );
  }
}

/*import 'package:flutter/material.dart';
//databases
import 'package:gam_paiement/databasemanager/databasemanager.dart';
//widgets
import 'package:gam_paiement/widgets/navbar.dart';
import 'package:gam_paiement/widgets/drawer.dart';

List<GlobalKey<FormState>> formKeys = [
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>()
];

class MyData {
  String fournisseur = "";
  String produit = "";
  String numero_ligne = "";
}

class PaiementFacture extends StatefulWidget {
  PaiementFacture({Key key}) : super(key: key);

  @override
  _PaiementFactureStaet createState() => _PaiementFactureStaet();
}

class _PaiementFactureStaet extends State<PaiementFacture> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: ArgonDrawer(currentPage: "Paiement Facture"),
      appBar: Navbar(
        title: "Paiement Facture",
      ),
      body: StepperBody(),
    );
  }
}

class StepperBody extends StatefulWidget {
  @override
  _StepperBodyState createState() => _StepperBodyState();
}

class _StepperBodyState extends State<StepperBody> {
  static TextEditingController fournisseur = new TextEditingController();
  static TextEditingController produit = new TextEditingController();
  static TextEditingController numero_ligne = new TextEditingController();
  static DateTime dateTransaction = DateTime.now();
  //form
  int currStep = 0;
  static var _focusNode = FocusNode();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static MyData data = MyData();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
      print('Has focus: $_focusNode.hasFocus');
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  List<Step> steps = [
    Step(
        title: const Text('Choix du fournisseur'),
        //subtitle: const Text('Enter your name'),
        isActive: true,
        //state: StepState.error,
        state: StepState.indexed,
        content: Form(
          key: formKeys[0],
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: fournisseur,
                focusNode: _focusNode,
                keyboardType: TextInputType.text,
                autocorrect: false,
                onSaved: (String value) {
                  data.fournisseur = value;
                },

                maxLines: 1,
                //initialValue: 'Aseem Wangoo',
                validator: (value) {
                  if (value.isEmpty || value.length < 1) {
                    return 'Please enter fournisseur';
                  }
                },
                decoration: InputDecoration(
                    labelText: 'saisie your fournisseur',
                    hintText: 'saisie a fournisseur',
                    //filled: true,
                    icon: const Icon(Icons.person),
                    labelStyle:
                        TextStyle(decorationStyle: TextDecorationStyle.solid)),
              ),
            ],
          ),
        )),
    Step(
      title: const Text('Choix produit'),
      //subtitle: const Text('Subtitle'),
      isActive: true,
      //state: StepState.editing,
      state: StepState.indexed,
      content: Form(
        key: formKeys[1],
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: produit,
              keyboardType: TextInputType.text,
              autocorrect: false,
              validator: (value) {
                if (value.isEmpty || value.length < 10) {
                  return 'Numero de lign mobile';
                }
              },
              onSaved: (String value) {
                data.produit = value;
              },
              maxLines: 1,
              decoration: InputDecoration(
                  labelText: 'numero de lign du client',
                  hintText: 'numero de lign du client',
                  icon: const Icon(Icons.phone),
                  labelStyle:
                      TextStyle(decorationStyle: TextDecorationStyle.solid)),
            ),
          ],
        ),
      ),
    ),

    Step(
      title: const Text('saisie information Client'),
      //subtitle: const Text('Subtitle'),
      isActive: true,
      //state: StepState.editing,
      state: StepState.indexed,
      content: Form(
        key: formKeys[2],
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: numero_ligne,
              keyboardType: TextInputType.text,
              autocorrect: false,
              validator: (value) {
                if (value.isEmpty || value.length < 10) {
                  return 'Numero de lign mobile';
                }
              },
              onSaved: (String value) {
                data.numero_ligne = value;
              },
              maxLines: 1,
              decoration: InputDecoration(
                  labelText: 'numero de lign du client',
                  hintText: 'numero de lign du client',
                  icon: const Icon(Icons.phone),
                  labelStyle:
                      TextStyle(decorationStyle: TextDecorationStyle.solid)),
            ),
          ],
        ),
      ),
    ),

    //  Step(
    //     title: const Text('Fifth Step'),
    //     subtitle: const Text('Subtitle'),
    //     isActive: true,
    //     state: StepState.complete,
    //     content: const Text('Enjoy Step Fifth'))
  ];

  @override
  Widget build(BuildContext context) {
    void showSnackBarMessage(String message,
        [MaterialColor color = Colors.red]) {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
    }

    return Container(
        child: Form(
      key: _formKey,
      child: ListView(children: <Widget>[
        Stepper(
          steps: steps,
          type: StepperType.vertical,
          currentStep: this.currStep,
          onStepContinue: () {
            setState(() {
              if (formKeys[currStep].currentState.validate()) {
                if (currStep < steps.length - 1) {
                  currStep = currStep + 1;
                } else {
                  currStep = 0;
                }
              }
              // else {
              // Scaffold
              //     .of(context)
              //     .showSnackBar( SnackBar(content:  Text('$currStep')));

              // if (currStep == 1) {
              //   print('First Step');
              //   print('object' + FocusScope.of(context).toStringDeep());
              // }

              // }
            });
          },
          onStepCancel: () {
            setState(() {
              if (currStep > 0) {
                currStep = currStep - 1;
              } else {
                currStep = 0;
              }
            });
          },
          onStepTapped: (step) {
            setState(() {
              currStep = step;
            });
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
      ]),
    ));
  }

  //create methode
  submitAction(BuildContext context) {
    createfacture(
      fournisseur.text,
      produit.text,
      numero_ligne.text,
      dateTransaction,
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
}
*/
