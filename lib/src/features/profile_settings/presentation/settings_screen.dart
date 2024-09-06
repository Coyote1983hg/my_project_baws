import 'package:flutter/material.dart';
import 'package:my_project_baws/src/features/settings/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = true;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Notifications'),
            _buildNotificationSwitch(),
            const SizedBox(height: 16.0),
            _buildSectionTitle('Appearance'),
            _buildDarkModeSwitch(themeProvider),
            const SizedBox(height: 16.0),
            _buildSaveButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16.0,
      ),
    );
  }

  Widget _buildNotificationSwitch() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Receive notifications'),
        Switch(
          value: _notifications,
          onChanged: (value) {
            setState(() {
              _notifications = value;
            });
          },
        ),
      ],
    );
  }

  Widget _buildDarkModeSwitch(ThemeProvider themeProvider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Dark mode'),
        Switch(
          value: themeProvider.isDarkMode,
          onChanged: (value) {
            context.read<ThemeProvider>().toggleTheme();
          },
        ),
      ],
    );
  }

  Widget _buildSaveButton() {
    return ElevatedButton(
      onPressed: () {
        // Save the settings and navigate back
        if (mounted) {
          Navigator.pop(context);
        }
      },
      child: const Text('Save Settings'),
    );
  }
}
