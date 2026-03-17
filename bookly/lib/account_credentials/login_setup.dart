import 'dart:io';
import 'package:bookly/widgets/user_image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginSetup extends StatefulWidget {
  const LoginSetup({super.key});

  @override
  State<LoginSetup> createState() => _LoginSetupState();
}

class _LoginSetupState extends State<LoginSetup> {
  final _formKey = GlobalKey<FormState>();

  var _enteredName = '';

  var _enteredPass = '';

  var _enteredEmail = '';

  File? _selectedImage;

  bool isLogin = true;
  bool isAuthenticating = false;

  void onSubmit() async {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    }

    _formKey.currentState!.save();

    try {
      setState(() {
        isAuthenticating = true;
      });
      if (isLogin) {
        final userCredentials = await _auth.signInWithEmailAndPassword(
          email: _enteredEmail,
          password: _enteredPass,
        );
      } else {
        final userCredentials = await _auth.createUserWithEmailAndPassword(
          email: _enteredEmail,
          password: _enteredPass,
        );
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
              'username': _enteredName,
              'email': _enteredEmail,
              'image': imageUrl,
            });
      }
      if (isLogin) {
        final userCredentials = await _auth.signInWithEmailAndPassword(
          email: _enteredEmail,
          password: _enteredPass,
        );
      } else {
        final userCredentials = await _auth.createUserWithEmailAndPassword(
          email: _enteredEmail,
          password: _enteredPass,
        );
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
              'username': _enteredName,
              'email': _enteredEmail,
              'image': imageUrl,
            });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('The email address is already in use by another account.');
      }

      ScaffoldMessenger.of(context).clearSnackBars();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? 'An error occurred. Please try again.'),
        ),
      );

      setState(() {
        isAuthenticating = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'BOOKLY',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 50,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Icon(
                    Icons.book,
                    color: Theme.of(context).colorScheme.primary,
                    size: 50,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              // Container(
              //   width: 100,
              //   height: 100,
              //   decoration: BoxDecoration(
              //     color: Colors.amber,
              //     borderRadius: BorderRadius.circular(100),
              //   ),
              // ),
              if (!isLogin)
                UserImagePicker(onImageSelected: (pic) => _selectedImage = pic),
              Card(
                margin: const EdgeInsets.all(20),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            style: Theme.of(context).textTheme.bodySmall!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                            decoration: InputDecoration(
                              labelText: 'Email Address',
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) =>
                                (!value!.contains('@') || value.trim().isEmpty)
                                ? 'Enter a valid email address'
                                : null,
                            onSaved: (newValue) => _enteredEmail = newValue!,
                          ),
                          const SizedBox(height: 10),
                          if (!isLogin)
                            TextFormField(
                              style: Theme.of(context).textTheme.bodySmall!
                                  .copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                  ),
                              decoration: InputDecoration(
                                labelText: 'User Name',
                              ),
                              keyboardType: TextInputType.name,
                              validator: (value) =>
                                  (value!.length < 5 || value.trim().isEmpty)
                                  ? 'Enter a valid User Name'
                                  : null,
                              onSaved: (newValue) => _enteredName = newValue!,
                            ),
                          const SizedBox(height: 10),
                          TextFormField(
                            style: Theme.of(context).textTheme.bodySmall!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                            decoration: InputDecoration(labelText: 'Password'),
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) =>
                                (value!.length < 5 || value.trim().isEmpty)
                                ? 'Enter a valid password'
                                : null,
                            onSaved: (newValue) => _enteredPass = newValue!,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              if (!isAuthenticating)
                ElevatedButton.icon(
                  onPressed: onSubmit,
                  icon: Icon(Icons.login),
                  label: Text(isLogin ? 'Login In' : 'Sign Up'),
                ),

              if (!isAuthenticating)
                TextButton(
                  onPressed: () {
                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
                  child: Text(
                    isLogin
                        ? 'Create new account!'
                        : 'Already have an account? Sign in.',
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
