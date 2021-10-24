import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager {
  // Create a CollectionReference called recharge that references the firestore collection
  final CollectionReference recharges =
      FirebaseFirestore.instance.collection('recharges');

  Future<void> createrechargeData(
    // Call the recharge CollectionReference to add a new user
    String fournisseur,
    String numero_client,
    String numero_recharge,
    String type_recharge,
    String montant,
    String entitee,
    String status,
    String agence,
    DateTime dateTransaction,
  ) async {
    return await recharges.doc(numero_client).set({
      'fournisseur': fournisseur,
      'numero_client': numero_client,
      'numero_recharge': numero_recharge,
      'type_recharge': type_recharge,
      'montant': montant,
      'entitee': entitee,
      'status': status,
      'agence': agence,
      'dateTransaction': dateTransaction
    });
  }

  Future updaterechargeData(
      String fournisseur,
      String numero_client,
      String numero_recharge,
      String type_recharge,
      String montant,
      String type_paiement,
      String entitee,
      String status,
      String agence,
      DateTime dateTransaction) async {
    return await recharges.doc(numero_client).update({
      'fournisseur': fournisseur,
      'numero_client': numero_client,
      'numero_recharge': numero_recharge,
      'type_recharge': type_recharge,
      'montant': montant,
      'type_paiement': type_paiement,
      'entitee': entitee,
      'status': status,
      'agence': agence,
      'dateTransaction': dateTransaction,
    });
  }

  Future getrechargeList() async {
    List itemsList = [];

    try {
      await recharges.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          itemsList.add(element.data);
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Create a CollectionReference called recharge that references the firestore collection
  final CollectionReference paiementfacture =
      FirebaseFirestore.instance.collection('paiementfacture');

  Future<void> createpaiementfacture(
    // Call the recharge CollectionReference to add a new user
    String fournisseur,
    String produit,
    String numero_ligne,
    DateTime dateTransaction,
  ) async {
    return await paiementfacture.doc(numero_ligne).set({
      'fournisseur': fournisseur,
      'numero_client': produit,
      'numero_recharge': numero_ligne,
      'dateTransaction': dateTransaction
    });
  }
}
