import 'package:helloworld/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'Homepage.dart';
import 'auth_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignInScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SignInScreen extends StatefulWidget {
  @override
  SignInScreenState createState() => SignInScreenState();
}

class SignInScreenState extends State<SignInScreen> {
  final AuthService _authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //AuthService _authService = AuthService();
  //TextEditingController _emailController = TextEditingController();
  //TextEditingController _passwordController = TextEditingController();

  void _handleSignIn() async {
    try {
      String email = _emailController.text;
      String password = _passwordController.text;

      if (email.isNotEmpty && password.isNotEmpty) {
        // Call the signIn method from AuthService
        await _authService.signIn(email: email, password: password);

        // Check if the user is logged in successfully
        if (_authService.getCurrentUser() != null) {
          print("User logged in successfully: $email");

          // Navigate to the NextScreen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Homepage()),
          );
        } else {
          // Handle the case where getCurrentUser returns null
          print("User is null after login");
        }
      } else {
        // Handle the case where email or password is empty
        print("Email or password is empty");
      }
    } catch (e) {
      // Handle login error
      print("Error during login: $e");
    }
  }

  bool _isPasswordVisible = false;
  // Declare the _isPasswordVisible variable here
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFF212121), // Change the background color here
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/GRABARBERWHITE.png',
            width: 300, // Adjust the width as needed
          ),
          const SizedBox(height: 24.0),
          Container(
            width: 300,
            child: TextFormField(
              controller: _emailController,
              style: const TextStyle(
                color: Color(0xffffffff), // Change the text color here
              ),
              decoration: const InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: Color(0xffffffff),
                  fontSize:
                      14.0, // Change the label (floating hint) text color here
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(
                        0xffffffff), // Change the border color when the field is not focused
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(
                        0xffe3c5ad), // Change the border color when the field is focused
                  ),
                ),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 4.0),
                  child: Icon(
                    Icons.person,
                    color: Color(0xffffffff), // Change the icon color here
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Container(
            width: 300,
            child: TextFormField(
              controller: _passwordController,
              obscureText: !_isPasswordVisible,
              style: const TextStyle(
                color: Color(0xffffffff),
                fontSize: 14.0,
              ),
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: const TextStyle(
                  color: Color(0xffffffff),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffffffff),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffe3c5ad),
                  ),
                ),
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(left: 4.0),
                  child: Icon(
                    Icons.lock,
                    color: Color(0xffffffff),
                  ),
                ),
                suffixIcon: IconButton(
                  padding: const EdgeInsets.only(right: 4.0),
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: const Color(0xffffffff),
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 24.0),
          ElevatedButton(
            onPressed: _handleSignIn,
            /*onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Homepage(),
                ),
              );
            },*/
            child: const Text(
              'Login',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xFFFFD700)),
              fixedSize: MaterialStateProperty.all(const Size(300, 40)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              foregroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xff331b1b)),
            ),
          ),
          const SizedBox(height: 8.0),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
            ],
          ),
          RichText(
            text: TextSpan(
              text: "Don't have an account? ",
              style: const TextStyle(
                fontSize: 14.0,
                color: Color(0xffffffff),
              ),
              children: [
                TextSpan(
                  text: "Sign Up",
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Color(0xFFFFD700),
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return SignUpPage(); // Replace SignUpPage with your actual destination page
                          },
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            const begin = 0.0; // Starting opacity
                            const end = 1.0; // Ending opacity
                            const curve = Curves.easeInOut; // Animation curve

                            var opacityTween =
                                Tween<double>(begin: begin, end: end)
                                    .chain(CurveTween(curve: curve));

                            var opacityAnimation =
                                animation.drive(opacityTween);

                            return FadeTransition(
                              opacity: opacityAnimation,
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
