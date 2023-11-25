import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserProfile(),
    );
  }
}

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Set initial values for existing information
    firstNameController.text = '';
    lastNameController.text = '';
    mobileNumberController.text = '';
    addressController.text = '';
    streetController.text = '';
    cityController.text = '';
    zipCodeController.text = '';
    countryController.text = '';
    // Fetch and set user data
    getUserData();
  }

  // Function to fetch the current user's data
  Future<void> getUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        // Update text controllers with user data
        firstNameController.text = user.displayName?.split(' ')[0] ?? '';
        lastNameController.text = user.displayName?.split(' ')[1] ?? '';
      });
    }
  }

  // Function to save user data using SharedPreferences
  Future<void> saveUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('firstName', firstNameController.text);
    prefs.setString('lastName', lastNameController.text);
    prefs.setString('address', addressController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color(0xFF212121),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EditableInfoContainer(
                label: 'Name',
                firstNameController: firstNameController,
                lastNameController: lastNameController,
                showPrefix: false,
                saveUserData: saveUserData,
              ),
              SizedBox(height: 10.0),
              NonEditableInfoContainer(
                label: 'Email',
              ),
              SizedBox(height: 10.0),
              EditableInfoContainer(
                label: 'Mobile Number',
                controller: mobileNumberController,
                showPrefix: true,
                saveUserData: saveUserData,
              ),
              SizedBox(height: 10.0),
              EditableInfoContainer(
                label: 'Address',
                controller: addressController,
                streetController: streetController,
                cityController: cityController,
                zipCodeController: zipCodeController,
                countryController: countryController,
                saveUserData: saveUserData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NonEditableInfoContainer extends StatelessWidget {
  final String label;

  NonEditableInfoContainer({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(Icons.lock),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          FutureBuilder<User?>(
            future: getUser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error fetching user data');
              } else if (snapshot.hasData) {
                return Text(
                  snapshot.data!.email ?? 'No email available',
                  style: TextStyle(fontSize: 16.0),
                );
              } else {
                return Text('No user signed in');
              }
            },
          ),
        ],
      ),
    );
  }

  Future<User?> getUser() async {
    return FirebaseAuth.instance.currentUser;
  }
}

class EditableInfoContainer extends StatefulWidget {
  final String label;
  final TextEditingController? controller;
  final TextEditingController? firstNameController;
  final TextEditingController? lastNameController;
  final TextEditingController? streetController;
  final TextEditingController? cityController;
  final TextEditingController? zipCodeController;
  final TextEditingController? countryController;
  final bool showPrefix;
  final VoidCallback saveUserData;

  EditableInfoContainer({
    required this.label,
    this.controller,
    this.firstNameController,
    this.lastNameController,
    this.streetController,
    this.cityController,
    this.zipCodeController,
    this.countryController,
    this.showPrefix = false,
    required this.saveUserData,
  });

  @override
  _EditableInfoContainerState createState() => _EditableInfoContainerState();
}

class _EditableInfoContainerState extends State<EditableInfoContainer> {
  bool isEditing = false;
  String? nameError;
  String? addressError;

  bool isAlpha(String? input) {
    if (input == null || input.isEmpty) {
      return false;
    }
    return RegExp(r'^[a-zA-Z]+$').hasMatch(input);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.label,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(isEditing ? Icons.save : Icons.edit),
                onPressed: () {
                  setState(() {
                    isEditing = !isEditing;
                    if (!isEditing) {
                      if (widget.label == 'Name') {
                        if (isAlpha(widget.firstNameController?.text) &&
                            isAlpha(widget.lastNameController?.text)) {
                          widget.saveUserData(); // Save user data
                          nameError = null;
                        } else {
                          nameError = 'Invalid input in name fields';
                        }
                      } else if (widget.label == 'Address') {
                        if ((widget.streetController?.text?.isNotEmpty ??
                                false) &&
                            (widget.cityController?.text?.isNotEmpty ??
                                false) &&
                            (widget.zipCodeController?.text?.isNotEmpty ??
                                false) &&
                            (widget.countryController?.text?.isNotEmpty ??
                                false)) {
                          widget.saveUserData(); // Save user data
                          addressError = null;
                        } else {
                          addressError = 'Invalid input in address fields';
                        }
                      } else if (widget.label == 'Mobile Number') {
                        if ((widget.controller?.text?.length ?? 0) == 10) {
                          widget.saveUserData(); // Save user data
                        } else {
                          print('Invalid input in ${widget.label} field');
                          // Display error message
                          nameError = 'Invalid input in mobile number field';
                        }
                      } else {
                        if ((widget.controller?.text?.isNotEmpty ?? false)) {
                          widget.saveUserData(); // Save user data
                        } else {
                          print('Invalid input in ${widget.label} field');
                        }
                      }
                    }
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 8.0),
          if (widget.label == 'Name' && isEditing)
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: widget.firstNameController,
                    style: TextStyle(fontSize: 16.0),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z]")),
                    ],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'First Name',
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: TextField(
                    controller: widget.lastNameController,
                    style: TextStyle(fontSize: 16.0),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z]")),
                    ],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Last Name',
                    ),
                  ),
                ),
              ],
            )
          else if (widget.label == 'Address' && isEditing)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: widget.streetController,
                  style: TextStyle(fontSize: 16.0),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Street',
                  ),
                ),
                SizedBox(height: 8.0),
                TextField(
                  controller: widget.cityController,
                  style: TextStyle(fontSize: 16.0),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'City',
                  ),
                ),
                SizedBox(height: 8.0),
                TextField(
                  controller: widget.zipCodeController,
                  style: TextStyle(fontSize: 16.0),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(5),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Zip Code',
                  ),
                ),
                SizedBox(height: 8.0),
                TextField(
                  controller: widget.countryController,
                  style: TextStyle(fontSize: 16.0),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Country',
                  ),
                ),
              ],
            )
          else
            Row(
              children: [
                if (widget.showPrefix)
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      '+63',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                Expanded(
                  child: isEditing
                      ? TextField(
                          controller: widget.controller,
                          style: TextStyle(fontSize: 16.0),
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'XXXXXXXXXX',
                          ),
                        )
                      : Text(
                          widget.label == 'Name'
                              ? '${widget.firstNameController?.text ?? ''} ${widget.lastNameController?.text ?? ''}'
                              : widget.controller?.text ?? '',
                          style: TextStyle(fontSize: 16.0),
                        ),
                ),
              ],
            ),
          if (nameError != null)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                nameError!,
                style: TextStyle(color: Colors.red),
              ),
            ),
          if (addressError != null)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                addressError!,
                style: TextStyle(color: Colors.red),
              ),
            ),
        ],
      ),
    );
  }
}
