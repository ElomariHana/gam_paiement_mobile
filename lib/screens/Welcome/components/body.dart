import 'package:flutter/material.dart';
import '../../../constants/Theme.dart';
import 'package:gam_paiement/screens/Welcome/components/background.dart';
//import 'package:gam_paiement/components/rounded_button.dart';
//import 'package:gam_paiement/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "WELCOME TO THE APP ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.05),
            Image.asset(
              "assets/images/pngtree.jpg",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            FlatButton(
              textColor: ArgonColors.white,
              color: Color(0xFFEE722D),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/signIn');
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
              child: Padding(
                  padding: EdgeInsets.only(
                      left: 16.0, right: 16.0, top: 12, bottom: 12),
                  child: Text("GET STARTED",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 16.0))),
            ),
          ],
        ),
      ),
    );
  }
}
