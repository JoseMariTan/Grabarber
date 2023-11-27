import 'package:flutter/material.dart';
import 'main.dart';
import 'BBooking.dart';

class BProfile extends StatefulWidget {
  @override
  _BProfile createState() => _BProfile();
}

class _BProfile extends State<BProfile> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Color(0xFFE0E0E0),
            appBar: AppBar(
              backgroundColor: Color(0xFF212121),
              title: const Text("Barber's Profile"),
              leading: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                child: IconButton(
                  onPressed: () {
                    // Navigate to the previous page when the button is pressed
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ),
            body: SafeArea(
                top: true,
                child: SingleChildScrollView(
                    child: Column(mainAxisSize: MainAxisSize.max, children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 8.0), // Adjust the top padding as needed
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(360),
                        child: Image.network(
                          'https://hips.hearstapps.com/hmg-prod/images/index-hartmod-1544461814.jpg?crop=1.00xw:1.00xh;0,0&resize=1200:*',
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 5),
                    child: Text(
                      'Kevin Durant',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24, // Adjust the font size as needed
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
                    child: Column(
                      children: [
                        // Barber Information Box
                        Container(
                          width: 370,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.00, -1.00),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 0, 0),
                                  child: Text(
                                    'Services Offered:',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: Text(
                                      'Men\'s Haircut, Styling, Hair Bleaching',
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-1.00, -1.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 5, 0, 0),
                                      child: Text(
                                        'Working Hours:',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: Text(
                                      'Monday - Friday, 8:00 AM - 5:00 PM',
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment
                                    .start, // Align contents to the top
                                children: [
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-1.00, -1.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 5, 0, 0),
                                      child: Text(
                                        'Rating:',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 6, 0, 0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start, // Align contents to the top
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  2, 3, 0, 0),
                                          child: Row(
                                            children: List.generate(
                                              4,
                                              (index) => Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 2.0),
                                                child: Icon(
                                                  Icons.star,
                                                  size: 16,
                                                  color: Colors.orange,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  2, 1, 0, 0),
                                          child: Text(
                                            '(35)',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-1.00, -1.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 5, 0, 0),
                                      child: Text(
                                        'Contact Info:',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5, 7, 0, 0),
                                    child: Text(
                                      '09234758371',
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-1.00, -1.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 5, 0, 0),
                                      child: Text(
                                        'Pricing:',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5, 7, 0, 0),
                                    child: Text(
                                      '₱200.00 - ₱500.00',
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                  height:
                                      20), // Add some space between the boxes
                            ],
                          ),
                        ),

                        // Customer Reviews Box
                        Container(
                          width: 370,
                          margin: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 2), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              // Customer Reviews
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Text(
                                  'Customer Reviews',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    // First review
                                    ListTile(
                                      title: Text('John Doe'),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: List.generate(
                                              5,
                                              (index) => Icon(
                                                Icons.star,
                                                size: 16,
                                                color: Colors.orange,
                                              ),
                                            ),
                                          ),
                                          Text(
                                              'Great service! Highly recommended.'),
                                        ],
                                      ),
                                    ),

                                    // Second review
                                    ListTile(
                                      title: Text('Jane Smith'),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 2.0),
                                            child: Row(
                                              children: [
                                                Row(
                                                  children: List.generate(
                                                    4,
                                                    (index) => Icon(
                                                      Icons.star,
                                                      size: 16,
                                                      color: Colors.orange,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                              'Nice haircut and friendly barber.'),
                                          SizedBox(height: 10),
                                        ],
                                      ),
                                    ),

                                    // Add more reviews as needed
                                  ],
                                ),
                              ),

                              SizedBox(
                                height: 20,
                              ), // Add some space between the reviews and the button
                            ],
                          ),
                        ),

                        // Book Appointment Button
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: 10), // Added padding below the button
                          child: ElevatedButton(
                            onPressed: () {
                              // Navigate to the next page with a custom page transition
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      BBooking(),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    const begin = Offset(1.0,
                                        0.0); // Start the animation from the right
                                    const end = Offset
                                        .zero; // End the animation at the center
                                    const curve = Curves.easeInOut;

                                    var tween = Tween(begin: begin, end: end)
                                        .chain(CurveTween(curve: curve));

                                    var offsetAnimation =
                                        animation.drive(tween);

                                    return SlideTransition(
                                      position: offsetAnimation,
                                      child: child,
                                    );
                                  },
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFFFFD700),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Container(
                              width: 200,
                              child: Center(
                                child: Text(
                                  'Book an Appointment',
                                  style: TextStyle(
                                    color: Colors.black, // Updated font
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ])))));
  }
}
