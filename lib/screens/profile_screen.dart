import 'package:flutter/material.dart';
import 'package:my_project_baws/screens/settings_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _name = 'Giorgio Calagiu';
  String _email = 'giorgio@example.com';
  String _address = '123 NEW STRASSE, VREDEN DEUTCHLAND';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(_name),
            SizedBox(height: 16.0),
            Text(
              'Email',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(_email),
            SizedBox(height: 16.0),
            Text(
              'Address',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(_address),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to the settings screen
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
              },
              child: Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
