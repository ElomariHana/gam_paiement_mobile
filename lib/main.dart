import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//FireBase Service Auth
import './services/authentication_service.dart';

// Screens
import './screens/OnBoarding/onboarding.dart';
import './screens/Home/home_page.dart';
import 'screens/sign_in_page.dart';
import './screens/HistoriqueRecharge/historiqueRe.dart';
import 'package:gam_paiement/screens/PaiementFacture/paiementFacture.dart';
import 'package:gam_paiement/screens/PaiementFacture/body/nextStep.dart';
import 'package:gam_paiement/screens/PaiementFacture/body/secondSted.dart';
import 'package:gam_paiement/screens/HistoriqueFacture/HistoriqueFacture.dart';
import 'package:gam_paiement/screens/Recharges/recharges.dart';
//import 'opening.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
          initialData: null,
        )
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          // home: AuthenticationWrapper(),
          initialRoute: "/onboarding",
          routes: <String, WidgetBuilder>{
            "/onboarding": (BuildContext context) => new Onboarding(),
            "/home": (BuildContext context) => new HomePage(),
            "/signIn": (BuildContext context) => new SignInPage(),
            "/recharge": (BuildContext context) => new Recharges(),
            "/historiqueFac": (BuildContext context) => new HistoriqueFacture(),
            "/historiqueRe": (BuildContext context) => new HistoriqueRecharge(),
            "/paiementFacture": (BuildContext context) => new PaiementFacture(),
            "/next": (BuildContext context) => new NextStep(),
            "/seconde": (BuildContext context) => new SecondeStep(),
          }

          //home: SignInPage(),
          //home: OpeningView(),
          ),
    );
  }
}

// class AuthenticationWrapper extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final firebaseUser = context.watch<User>();

//     if (firebaseUser != null) {
//       return HomePage();
//     }
//     return SignInPage();
//   }
// }
