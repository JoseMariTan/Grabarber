import 'package:flutter/material.dart';
import 'package:helloworld/signin.dart';
import 'Homepage.dart';
import 'auth_service.dart';
import 'package:flutter/gestures.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final AuthService _authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController(); // Step 1

  String _errorMessage = ""; // Added to store error message

  void _handleSignUp() async {
    try {
      if (_passwordController.text != _confirmPasswordController.text) {
        // Check if passwords match
        // You can display an error message or throw an exception
        setState(() {
          _errorMessage = "Passwords do not match";
        });
        return;
      }

      await _authService.signUp(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // Navigate to the Homepage with fade animation
      Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return Homepage();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = 0.0; // Starting opacity
            const end = 1.0; // Ending opacity
            const curve = Curves.easeInOut; // Animation curve

            var opacityTween = Tween<double>(begin: begin, end: end)
                .chain(CurveTween(curve: curve));

            var opacityAnimation = animation.drive(opacityTween);

            return FadeTransition(
              opacity: opacityAnimation,
              child: child,
            );
          },
        ),
      );
    } catch (e) {
      // Handle the signup error (display an error message, etc.)
      setState(() {
        _errorMessage = "Invalid Email or Password";
      });
      print("Error during signup: $e");
    }
  }

  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF212121),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/GRABARBERWHITE.png',
            width: 300,
          ),
          const SizedBox(height: 24.0),
          Container(
            width: 300,
            child: TextFormField(
              controller: _emailController,
              style: const TextStyle(
                color: Color(0xffffffff),
              ),
              decoration: const InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: Color(0xffffffff),
                  fontSize: 14.0,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffffffff),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffe3c5ad),
                  ),
                ),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 4.0),
                  child: Icon(
                    Icons.person,
                    color: Color(0xffffffff),
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
          const SizedBox(height: 16.0),
          Container(
            width: 300,
            child: TextFormField(
              controller: _confirmPasswordController,
              obscureText: !_isPasswordVisible,
              style: const TextStyle(
                color: Color(0xffffffff),
                fontSize: 14.0,
              ),
              decoration: InputDecoration(
                labelText: 'Confirm Password',
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
          const SizedBox(height: 5.0),
          // Display error message in red font
          Text(
            _errorMessage,
            style: TextStyle(color: Colors.red),
          ),
          const SizedBox(height: 5.0),
          ElevatedButton(
            onPressed: _handleSignUp,
            child: const Text('Sign Up',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                )),
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
              text: "Already have an account? ",
              style: const TextStyle(
                fontSize: 14.0,
                color: Color(0xffffffff),
              ),
              children: [
                TextSpan(
                  text: "Sign In",
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
                            // The new screen that fades in
                            return SignInScreen(); // Replace SignInScreen with your actual destination page
                          },
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            const begin = 0.0; // Starting opacity
                            const end = 1.0; // Ending opacity
                            const curve = Curves.easeInOut; // Animation curve

                            var tween = Tween<double>(begin: begin, end: end)
                                .chain(CurveTween(curve: curve));

                            var opacityAnimation = animation.drive(tween);

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
