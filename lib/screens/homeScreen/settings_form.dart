import 'package:flutter/material.dart';
import 'package:medo/models/the_user.dart';
import 'package:medo/services/database.dart';
import 'package:medo/shared/constants.dart';
import 'package:medo/shared/loading.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({Key? key}) : super(key: key);

  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  @override
  final _formKey = GlobalKey<FormState>();
  final List<String> genders = ['Male', 'Female', 'Unspecified'];

  String? _currentName;
  String? _currentGender;

  Widget build(BuildContext context) {
    final user = Provider.of<TheUser?>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user!.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data!;
            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text('Update your info settings',
                      style: TextStyle(fontSize: 18.0)),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    initialValue: userData.name,
                    decoration: textInputDecoration,
                    validator: (val) =>
                        val!.isEmpty ? 'Please enter a name' : null,
                    onChanged: (val) => setState(() => _currentName = val),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  // dropdown
                  DropdownButtonFormField(
                    decoration: textInputDecoration,
                    value: _currentGender ?? userData.gender,
                    items: genders.map((gender) {
                      return DropdownMenuItem(
                        value: gender,
                        child: Text(gender),
                      );
                    }).toList(),
                    onChanged: (val) =>
                        setState(() => _currentGender = val as String?),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.pink[500]),
                    child:
                        Text('Update', style: TextStyle(color: Colors.white)),
                    onPressed: () async {
                       if (_formKey.currentState!.validate()) {
                        await DatabaseService(uid: user.uid).updateUserData(
                            _currentName ?? userData.name,
                            _currentGender ?? userData.gender);
                        Navigator.pop(context);
                      }
                    },
                  )
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
