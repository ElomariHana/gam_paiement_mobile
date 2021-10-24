import 'package:flutter/material.dart';

//widgets
import 'package:gam_paiement/widgets/navbar.dart';
// screens
import 'package:gam_paiement/screens/PaiementFacture/body/secondSted.dart';

class NextStep extends StatefulWidget {
  NextStep({Key key}) : super(key: key);

  @override
  _NextStepState createState() => _NextStepState();
}

class _NextStepState extends State<NextStep> {
  bool valuefirst = false;
  bool valuesecond = false;

  @override
  Widget build(BuildContext context) {
    final cols1 = [
      new DataColumn(
        label: const Text(''),
      ),
      new DataColumn(
        label: const Text('ReferenceFacture'),
      ),
      new DataColumn(
        label: const Text('Date'),
      ),
    ];
    final cols2 = [
      new DataColumn(
        label: const Text('Montant'),
      ),
    ];
    final rows1 = new List.generate(
        1,
        (_) => new DataRow(cells: [
              new DataCell(new Checkbox(
                  value: this.valuefirst,
                  onChanged: (bool value) {
                    setState(() {
                      this.valuefirst = value;
                    });
                  })),
              new DataCell(new Text('000128749000')),
              new DataCell(new Text('31/05/2021')),
            ]));
    final rows2 = new List.generate(
        1,
        (_) => new DataRow(cells: [
              new DataCell(new Text('1990DH')),
            ]));
    return Scaffold(
      appBar: Navbar(
        title: "Paiement_Facture",
        rightOptions: false,
      ),
      body: new Column(
        children: [
          new Padding(padding: const EdgeInsets.only(top: 10.0)),
          new Material(
            child: new DataTable(columns: cols1, rows: rows1),
          ),
          new Material(
            child: new DataTable(columns: cols2, rows: rows2),
          ),
          new RaisedButton(
            child: Text(
              'next',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/seconde');
            },
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
