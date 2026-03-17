import 'dart:io';

import 'package:chat_app/widgets/user_image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth
    .instance; // to access the firebase auth instance and use its methods to create a new user and sign in an existing user

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  // final void Function(File pic) onImageSelected;

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  var _enteredEmail = '';
  var _enteredPassword = '';
  File? _selectedImage;
  var _isAuthenticating = false;
  var _isLogin = true;
  var _enteredUsername = '';

  void _submit() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid || !_isLogin && _selectedImage == null) {
      return;
      // print('Email: $_enteredEmail');
      // print('Password: $_enteredPassword');
    }

    _formKey.currentState!.save();
    try {
      setState(() {
        _isAuthenticating = true;
      });
      if (_isLogin) {
        final userCredentials = await _auth.signInWithEmailAndPassword(
          email: _enteredEmail,
          password: _enteredPassword,
        );
      } else {
        final userCredentials = await _auth.createUserWithEmailAndPassword(
          email: _enteredEmail,
          password: _enteredPassword,
        );

        // to create a new user with email and password and to sign in an existing user with email and password
        final storageRef = FirebaseStorage.instance
            .ref()
            .child('user_images')
            .child('${userCredentials.user!.uid}.jpg');
        await storageRef.putFile(_selectedImage!);
        final imageUrl = await storageRef.getDownloadURL();
        FirebaseFirestore.instance
            .collection('users')
            .doc(userCredentials.user!.uid)
            .set({
              'username': _enteredUsername,
              'email': _enteredEmail,
              'image_url': imageUrl,
            });
        // to upload the selected image to firebase storage and save it in a folder called user_images and name the image with the user id of the user and save it as a jpg file
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == 'email-already-in-use') {
        print('The email address is already in use by another account.');
      }

      ScaffoldMessenger.of(context).clearSnackBars();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error.message ?? 'An error occurred. Please try again.',
          ),
        ),
      );

      setState(() {
        _isAuthenticating = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                  bottom: 20,
                  top: 30,
                  left: 20,
                  right: 20,
                ),
                width: 200,
                child: Image.asset('assets/images/chat.png', fit: BoxFit.cover),
              ),
              Card(
                margin: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (!_isLogin)
                            UserImagePicker(
                              onImageSelected: (pic) => _selectedImage = pic,
                            ),
                          // to pick an image from the camera and show it in the circle avatar and we will use this image to set the profile picture of the user and we will upload this image to firebase storage and get the download url of the image and save it in the firestore database along with the user data}
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Email Address',
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) =>
                                (value == null ||
                                    !value.contains('@') ||
                                    value.trim().isEmpty)
                                ? 'Please enter a valid email address.'
                                : null,
                            onSaved: (value) => _enteredEmail = value!,
                          ),
                          if (!_isLogin)
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Username',
                              ),
                              enableSuggestions: false,
                              validator: (value) =>
                                  (value == null ||
                                      value.isEmpty ||
                                      value.trim().length < 4)
                                  ? 'Username must be at least 4 characters long.'
                                  : null,
                              onSaved: (value) => _enteredUsername = value!,
                            ),
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Password'),
                            obscureText: true,
                            validator: (value) =>
                                (value == null || value.trim().length < 6)
                                ? 'Password must be at least 6 characters long.'
                                : null,
                            onSaved: (newValue) => _enteredPassword = newValue!,
                          ), //obscureText is used to hide the password when the user types it in
                          const SizedBox(height: 12),
                          if (_isAuthenticating) CircularProgressIndicator(),

                          if (!_isAuthenticating)
                            ElevatedButton(
                              onPressed: _submit,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(
                                  context,
                                ).colorScheme.primaryContainer,
                                foregroundColor: Theme.of(
                                  context,
                                ).colorScheme.onPrimaryContainer,
                              ),
                              child: Text(_isLogin ? 'Login' : 'Sign up'),
                            ),

                          if (!_isAuthenticating)
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  _isLogin = !_isLogin;
                                });
                              },
                              child: Text(
                                _isLogin
                                    ? 'Create new account'
                                    : 'I already have an account',
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
