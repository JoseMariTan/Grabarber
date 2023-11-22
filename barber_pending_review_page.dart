import 'package:flutter/material.dart';
import 'review_page.dart';

class BarberPendingReviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grabarber'),
        backgroundColor: Color(0xFF212121),
        // Use the leading property to place the menu icon on the top-left corner
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Handle menu button tap
            // You can show a drawer or navigate to a menu page
          },
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(
            top: 10.0, left: 30.0, right: 10.0), // Set margin at the top
        child: Column(
          children: [
            Container(
              width: 300, // Set the width of the container
              decoration: BoxDecoration(
                color: Color(0xFF212121), // Set the background color to blue
                borderRadius:
                    BorderRadius.circular(20.0), // Set the border radius
              ),
              padding: EdgeInsets.all(10.0), // Add padding for better spacing
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(75),
                    child: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT09K5SeZzDHyVBMJvl_SUYVLIdoej609EkqoP6TyT6j2CC4WTSRImm3d_afsHpQibk3uY&usqp=CAU',
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Kurt Cobain',
                    style: TextStyle(
                      color: Color(0xFFE0E0E0),
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  // Styled button to navigate to ReviewPage
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ReviewPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFFFD700), // Background color
                      onPrimary: Color(0xFF212121), // Text color
                    ),
                    child: Text(
                      'Pending Review',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF212121),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Add other widgets or containers below if needed
          ],
        ),
      ),
    );
  }
}
