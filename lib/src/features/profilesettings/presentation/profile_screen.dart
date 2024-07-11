import 'package:flutter/material.dart';
import 'package:my_project_baws/src/data/auth_repository.dart';
import 'package:my_project_baws/src/data/user_repository.dart';
import 'package:my_project_baws/src/features/profilesettings/presentation/settings_screen.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final userRepository = context.read<UserRepository>();
    final authRepository = context.read<AuthRepository>();
    String name = userRepository.user?.name ?? "";
    String email = authRepository.getCurrentUser()?.email ?? "";
    String address = '123 NEW STRASSE, VREDEN DEUTCHLAND';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Name',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(name),
            const SizedBox(height: 16.0),
            const Text(
              'Email',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 8.0),
           Text(email),
            const SizedBox(height: 16.0),
            const Text(
              'Address',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 8.0),
            //const Text(address),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to the settings screen
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsScreen()));
              },
              child: const Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
