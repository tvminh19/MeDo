import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medo/models/info.dart';
import 'package:medo/models/the_user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  // collection reference
  final CollectionReference userInfoCollection =
      FirebaseFirestore.instance.collection('userInfos');

  Future updateUserData(String name, String gender) async {
    return await userInfoCollection.doc(uid).set({
      'name': name,
      'gender': gender,
    });
  }

  // infoList from snapshot
  List<Info> _infoListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Info(
        name: doc.get('name') ?? '',
        gender: doc.get('gender') ?? 'Unspecified',
      );
    }).toList();
  }

  // userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid, name: snapshot.get('name'), gender: snapshot.get('gender'));
  }

  // get userInfo stream
  Stream<List<Info>> get infos {
    return userInfoCollection.snapshots().map(_infoListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return userInfoCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
