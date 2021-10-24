import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:gam_paiement/constants/Theme.dart';
//firestore
import 'package:cloud_firestore/cloud_firestore.dart';

//widgets
import 'package:gam_paiement/widgets/drawer.dart';
import 'package:gam_paiement/widgets/navbar.dart';

class HistoriqueFacture extends StatelessWidget {
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(
        title: "Liste des transactions P_Facture",
        rightOptions: false,
      ),
      backgroundColor: ArgonColors.bgColorScreen,
      drawer: ArgonDrawer(currentPage: "Articles"),
      body: Card(
        margin: EdgeInsets.all(10),
        color: Colors.white,
        shadowColor: Colors.blueGrey,
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
                stream: db.collection('paiementfacture').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return const Text("Loading...");
                  else
                    return new ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ExpansionTileCard(
                          baseColor: Colors.cyan[50],
                          expandedColor: Colors.red[50],
                          //key: cardA,
                          leading: CircleAvatar(
                              child: Image.asset("assets/images/devs.jpg")),
                          title: Text("Status: Accepte",
                              style: new TextStyle(color: Colors.green)),
                          subtitle: Text("N de la ligne : " +
                              snapshot.data.docs[index]["numero_client"]),

                          children: <Widget>[
                            Divider(
                              thickness: 1.0,
                              height: 1.0,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                  vertical: 8.0,
                                ),
                                child: Text(
                                  "Agence : Mono " +
                                      "  " +
                                      "Fournisseur :" +
                                      snapshot.data.docs[index]["fournisseur"] +
                                      "N a recharger :" +
                                      snapshot.data.docs[index]
                                          ["numero_client"],
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .copyWith(fontSize: 16),
                                ),
                              ),
                            ),
                            ButtonBar(
                              alignment: MainAxisAlignment.spaceAround,
                              buttonHeight: 52.0,
                              buttonMinWidth: 90.0,
                              children: <Widget>[
                                FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0)),
                                  onPressed: () {
                                    //cardA.currentState?.expand();
                                  },
                                  child: Column(
                                    children: <Widget>[
                                      Icon(Icons.download_sharp),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2.0),
                                      ),
                                      Text('Reçu'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    );
                })
          ],
        ),
      ),
    );
  }
}
