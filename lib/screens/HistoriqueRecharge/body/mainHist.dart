import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gam_paiement/constants/Theme.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
//firestore
import 'package:cloud_firestore/cloud_firestore.dart';
//widgets
import 'package:gam_paiement/widgets/navbar.dart';
import 'package:gam_paiement/widgets/drawer.dart';

class Body extends StatelessWidget {
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: Navbar(
          title: "Historique recharges",
          transparent: true,
        ),
        backgroundColor: ArgonColors.bgColorScreen,
        drawer: ArgonDrawer(currentPage: "HistoriqueRecharge"),
        body: Stack(children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      alignment: Alignment.topCenter,
                      image: AssetImage("assets/img/profile-screen-bg.png"),
                      fit: BoxFit.fitWidth))),
          SafeArea(
            child: ListView(children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16.0, top: 80.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            elevation: .0,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0))),
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 85.0, bottom: 20.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: <Widget>[
                                          StreamBuilder<QuerySnapshot>(
                                              stream: db
                                                  .collection('recharges')
                                                  .snapshots(),
                                              builder: (context, snapshot) {
                                                if (!snapshot.hasData)
                                                  return const Text(
                                                      "Loading...");
                                                else
                                                  return new ListView.builder(
                                                    shrinkWrap: true,
                                                    itemCount: snapshot
                                                        .data.docs.length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return ExpansionTileCard(
                                                        baseColor:
                                                            Colors.cyan[50],
                                                        expandedColor:
                                                            Colors.red[50],
                                                        //key: cardA,
                                                        leading: CircleAvatar(
                                                            child: Image.asset(
                                                                "assets/images/devs.jpg")),
                                                        title: Text("Status: " +
                                                            snapshot.data
                                                                    .docs[index]
                                                                ["status"]),
                                                        subtitle: Text(
                                                            "N de la ligne : " +
                                                                snapshot.data
                                                                            .docs[
                                                                        index][
                                                                    "numero_client"]),

                                                        children: <Widget>[
                                                          Divider(
                                                            thickness: 1.0,
                                                            height: 1.0,
                                                          ),
                                                          Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                horizontal:
                                                                    16.0,
                                                                vertical: 8.0,
                                                              ),
                                                            ),
                                                          ),
                                                          ButtonBar(
                                                            alignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            buttonHeight: 52.0,
                                                            buttonMinWidth:
                                                                90.0,
                                                            children: <Widget>[
                                                              FlatButton(
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            4.0)),
                                                                onPressed: () {
                                                                  //cardA.currentState?.expand();
                                                                },
                                                                child: Column(
                                                                  children: <
                                                                      Widget>[
                                                                    Icon(Icons
                                                                        .download_sharp),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .symmetric(
                                                                          vertical:
                                                                              2.0),
                                                                    ),
                                                                    Text(
                                                                        'Reçu'),
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
                                  ],
                                ))),
                      ),
                    ]),
                  ],
                ),
              ),
            ]),
          )
        ]));
  }
}
