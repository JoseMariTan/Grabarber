import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _notificationsEnabled = true; // State variable for notification toggle

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Color(0xFF212121), // App Bar Background Color
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'General Settings',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              title: Text('Notifications'),
              subtitle: Text('Enable or disable notifications'),
              trailing: Switch(
                value: _notificationsEnabled,
                onChanged: (value) {
                  setState(() {
                    _notificationsEnabled = value;
                  });
                  // Handle switch change
                },
              ),
            ),
            ListTile(
              title: Text('Dark Mode'),
              subtitle: Text('Enable or disable dark mode'),
              trailing: Switch(
                value: false, // Replace with your logic for handling dark mode
                onChanged: (value) {
                  // Handle switch change
                },
              ),
            ),
            Divider(),
            Text(
              'Account Settings',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                // Handle logout logic
                Navigator.pop(context); // Close the settings page
              },
            ),
          ],
        ),
      ),
    );
  }
}
