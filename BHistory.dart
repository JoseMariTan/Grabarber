import 'package:flutter/material.dart';
import 'BReview.dart';

class BHistory extends StatefulWidget {
  @override
  _BHistoryState createState() => _BHistoryState();
}

class _BHistoryState extends State<BHistory> {
  bool feedbackSubmitted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE0E0E0),
      body: Container(
        margin: EdgeInsets.only(
          left: 10.0,
          right: 10.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 10.0),
            Container(
              width: 410,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              padding: EdgeInsets.all(10.0),
              child: Column(
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
                  SizedBox(height: 10.0),
                  Text(
                    'Kurt Cobain',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  ElevatedButton(
                    onPressed: () {
                      if (!feedbackSubmitted) {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    BReview(
                              onFeedbackSubmitted: (bool submitted) {
                                setState(() {
                                  feedbackSubmitted = submitted;
                                });
                              },
                            ),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              const begin = Offset(1.0, 0.0);
                              const end = Offset.zero;
                              const curve = Curves.easeInOut;

                              var tween = Tween(begin: begin, end: end)
                                  .chain(CurveTween(curve: curve));

                              var offsetAnimation = animation.drive(tween);

                              return SlideTransition(
                                position: offsetAnimation,
                                child: child,
                              );
                            },
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFFFD700),
                      onPrimary: Color(0xFF212121),
                    ),
                    child: Text(
                      feedbackSubmitted ? 'Reviewed' : 'Pending Review',
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
          ],
        ),
      ),
    );
  }
}
