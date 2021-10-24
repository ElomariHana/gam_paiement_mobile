import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:gam_paiement/constants/Theme.dart';
import 'package:gam_paiement/widgets/drawer-tile.dart';
import 'package:provider/provider.dart';
import '../services/authentication_service.dart';

class ArgonDrawer extends StatelessWidget {
  final String currentPage;

  ArgonDrawer({this.currentPage});

  _launchURL() async {
    const url = 'https://creative-tim.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      color: ArgonColors.white,
      child: Column(children: [
        Container(
            height: MediaQuery.of(context).size.height * 0.20,
            width: MediaQuery.of(context).size.width * 0.70,
            child: SafeArea(
              bottom: false,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Image.asset("assets/img/argon-logo.png"),
                ),
              ),
            )),
        Expanded(
          flex: 2,
          child: ListView(
            padding: EdgeInsets.only(top: 80, left: 16, right: 16),
            children: [
              DrawerTile(
                  icon: Icons.home,
                  onTap: () => {
                        if (currentPage != "HomePage")
                          Navigator.pushReplacementNamed(context, '/home'),
                        //Navigator.of(context).pop(),
                        //Navigator.pushNamed(cnontext, "/home")
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => HomePage(),
                        //   ),
                        // ),
                      },
                  iconColor: ArgonColors.initial,
                  title: "Home",
                  isSelected: currentPage == "HomePage" ? true : false),
              DrawerTile(
                  icon: Icons.phonelink,
                  onTap: () => {
                        if (currentPage != "PaiementFacture")
                          Navigator.pushReplacementNamed(
                              context, '/paiementFacture'),
                        //Navigator.pushReplacementNamed(
                        // context, '/PaiementFacture');
                      },
                  iconColor: ArgonColors.initial,
                  title: "Paiement_Facture",
                  isSelected: currentPage == "PaiementFacture" ? true : false),
              DrawerTile(
                  icon: Icons.pending_actions_sharp,
                  onTap: () {
                    if (currentPage != "HistoriqueFacture")
                      Navigator.pushReplacementNamed(context, '/historiqueFac');
                  },
                  iconColor: ArgonColors.initial,
                  title: "Liste des transactions",
                  isSelected:
                      currentPage == "HistoriqueFacture" ? true : false),
              Expanded(
                flex: 1,
                child: Container(
                    padding: EdgeInsets.only(left: 8, right: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(
                            height: 4, thickness: 0, color: ArgonColors.muted),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 16.0, left: 16, bottom: 8),
                        ),
                      ],
                    )),
              ),
              DrawerTile(
                  icon: Icons.phone_iphone_outlined,
                  onTap: () => {
                        if (currentPage != "Recharges")
                          //Navigator.of(context).pop(),
                          Navigator.pushNamed(context, "/recharge"),
                        // Navigator.pushReplacementNamed(context, '/Recharges');
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => RechargeOperation(),
                        //   ),
                        // ),
                      },
                  iconColor: ArgonColors.initial,
                  title: "Recharges",
                  isSelected: currentPage == "Recharges" ? true : false),
              DrawerTile(
                  icon: Icons.pending_actions_sharp,
                  onTap: () {
                    if (currentPage != "HistoriqueRecharge")
                      //Navigator.pushReplacementNamed(context, '/historiqueRe')
                      Navigator.pushNamed(context, "/historiqueRe");
                  },
                  iconColor: ArgonColors.initial,
                  title: "Liste des transactions",
                  isSelected:
                      currentPage == "HistoriqueRecharge" ? true : false),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
              padding: EdgeInsets.only(left: 8, right: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(height: 4, thickness: 0, color: ArgonColors.muted),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 16.0, left: 16, bottom: 8),
                  ),
                  DrawerTile(
                      icon: Icons.power_settings_new_sharp,
                      onTap: () => {
                            // if (currentPage != "Logout")
                            print(" Sign out pressed"),
                            context.read<AuthenticationService>().signOut(),
                            if (Navigator.of(context).canPop())
                              {
                                Navigator.pushReplacementNamed(
                                    context, '/signIn')
                              }
                            //Navigator.of(context).pop(),
                            //Navigator.pushNamed(context, "/signin")
                          },
                      iconColor: Color(0xFFEE722D),
                      title: "Logout",
                      isSelected:
                          currentPage == "Getting started" ? true : false),
                ],
              )),
        ),
      ]),
    ));
  }
}
