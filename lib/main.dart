import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medo/models/the_user.dart';
import 'package:medo/screens/wrapper.dart';
import 'package:medo/services/auth.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const myApp());
}

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<TheUser?>.value(
      catchError: (_, err) => null,
      initialData: null,
      value: AuthService().user,
      child: const MaterialApp(
        title: 'Medo - Medicine & Doctor',
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
