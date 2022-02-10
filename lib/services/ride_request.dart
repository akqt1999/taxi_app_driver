
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taxi_app_flutter/helpers/constants.dart';
import 'package:taxi_app_flutter/models/ride_Request.dart';

class RideRequestServices {
  String collection = "requests";

  void updateRequest(Map<String, dynamic> values) {
    firebaseFiretore.collection(collection).doc(values['id']).update(values);
  }

  Stream<QuerySnapshot> requestStream({ String id}) {
    CollectionReference reference = firebaseFiretore.collection(collection);
    return reference.snapshots();
  }

  Future<RequestModelFirebase> getRequestById(String id) =>
      firebaseFiretore.collection(collection).doc(id).get().then((doc) {
        return RequestModelFirebase.fromSnapshot(doc);
      });

}
