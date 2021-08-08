import 'package:firebase_auth/firebase_auth.dart';
import 'package:medo/models/the_user.dart';
import 'package:medo/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create theUser obj based on user
  TheUser? _theUserFromUser(User user) {
    return TheUser(uid: user.uid);
  }

  // auth change user stream
  Stream<TheUser?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _theUserFromUser(user!));
  }

  // sign in anon
  Future signInAnon() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      User? user = userCredential.user;
      return _theUserFromUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email/pass
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = userCredential.user;
      return _theUserFromUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // register with email/pass
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;

      // create a new document for the user with the uid
      await DatabaseService(uid: user!.uid)
          .updateUserData('New user', 'Unspecified');

      return _theUserFromUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
