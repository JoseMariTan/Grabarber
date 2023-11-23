import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
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
                value:
                    true, // Replace with your logic for handling notifications
                onChanged: (value) {
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
