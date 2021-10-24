import 'package:flutter/material.dart';
import 'package:gam_paiement/constants/Theme.dart';
//widgets
import 'package:gam_paiement/widgets/navbar.dart';
import 'package:gam_paiement/widgets/drawer.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
//firestore
import 'package:cloud_firestore/cloud_firestore.dart';

final Map<String, Map<String, String>> homeCards = {
  "Ice Cream": {
    "title": "Ice cream is made with carrageenan …",
    "image":
        "https://images.unsplash.com/photo-1516559828984-fb3b99548b21?ixlib=rb-1.2.1&auto=format&fit=crop&w=2100&q=80"
  },
  "Makeup": {
    "title": "Is makeup one of your daily esse …",
    "image":
        "https://images.unsplash.com/photo-1519368358672-25b03afee3bf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2004&q=80"
  },
  "Coffee": {
    "title": "Coffee is more than just a drink: It’s …",
    "image":
        "https://images.unsplash.com/photo-1500522144261-ea64433bbe27?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2102&q=80"
  },
  "Fashion": {
    "title": "Fashion is a popular style, especially in …",
    "image":
        "https://images.unsplash.com/photo-1487222477894-8943e31ef7b2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1326&q=80"
  },
  "Argon": {
    "title": "Argon is a great free UI packag …",
    "image":
        "https://images.unsplash.com/photo-1482686115713-0fbcaced6e28?fit=crop&w=1947&q=80"
  }
};

class Body extends StatelessWidget {
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(
          title: "Home",
          searchBar: true,
          categoryOne: "Recharges",
          categoryTwo: "Paiment Factures",
        ),
        backgroundColor: ArgonColors.bgColorScreen,
        // key: _scaffoldKey,
        drawer: ArgonDrawer(currentPage: "Home"),
        body: Container(
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 32),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Historique paiementfacture",
                        style: TextStyle(
                            color: ArgonColors.text,
                            fontWeight: FontWeight.w600,
                            fontSize: 16)),
                  ),
                ),
                //children: <Widget>[
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
                              leading: Icon(
                                Icons.history,
                                color: Color(0xFF2377B4),
                              ),
                              title: Text("N a recharger:" +
                                  snapshot.data.docs[index]["numero_client"]),
                              subtitle: Text("N de la ligne : " +
                                  snapshot.data.docs[index]["numero_recharge"]),

                              children: <Widget>[
                                Divider(
                                  thickness: 1.0,
                                  height: 1.0,
                                ),
                              ],
                            );
                          },
                        );
                    }),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 32),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Historique Recharges",
                        style: TextStyle(
                            color: ArgonColors.text,
                            fontWeight: FontWeight.w600,
                            fontSize: 16)),
                  ),
                ),
                StreamBuilder<QuerySnapshot>(
                    stream: db.collection('recharges').snapshots(),
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
                              leading: Icon(
                                Icons.history,
                                color: Color(0xFF2377B4),
                              ),

                              title: Text("N a recharger:" +
                                  snapshot.data.docs[index]["numero_client"]),
                              subtitle: Text("N de la ligne : " +
                                  snapshot.data.docs[index]["numero_recharge"]),

                              children: <Widget>[
                                Divider(
                                  thickness: 1.0,
                                  height: 1.0,
                                ),
                              ],
                            );
                          },
                        );
                    }),
              ],
            ),
          ),
        ));
  }
}
