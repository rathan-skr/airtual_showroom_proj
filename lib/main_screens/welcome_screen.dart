// ignore_for_file: use_build_context_synchronously

import 'package:airtual_showroom_proj/widgets/yellow_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool processing = false;

  CollectionReference anonymous =
      FirebaseFirestore.instance.collection('anonymous');


  late String _uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/inapp/bgimageb.png'),
                fit: BoxFit.cover)),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /*const Text(
                'WELCOME',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),*/
              const SizedBox(
                height: 120,
                width: 200,
                child: Image(image: AssetImage('images/inapp/logo2.png')),
              ),
              const Text(
                'Airtual Showroom',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.orangeAccent,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                bottomLeft: Radius.circular(50))),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            'Supplier',
                            style: TextStyle(
                                color: Colors.yellowAccent,
                                fontSize: 26,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      // supplier log
                      Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: const BoxDecoration(
                              color: Colors.orangeAccent,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  bottomLeft: Radius.circular(50))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Image(
                                  image: AssetImage('images/inapp/logo2.png')),
                              YellowButton(
                                  label: 'Log In',
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                        context, '/supplier_login');
                                  },
                                  width: 0.25),
                              Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: YellowButton(
                                    label: 'Sign Up',
                                    onPressed: () {
                                      Navigator.pushReplacementNamed(
                                          context, '/supplier_signup');
                                    },
                                    width: 0.25),
                              ),
                            ],
                          )),
                    ],
                  ),
                ],
              ),

              // user log
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: Color(0xFFFF9800),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(50),
                                bottomRight: Radius.circular(50))),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            'User',
                            style: TextStyle(
                                color: Colors.yellowAccent,
                                fontSize: 26,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: const BoxDecoration(
                              color: Color(0xFFFF9800),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(50),
                                  bottomRight: Radius.circular(50))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: YellowButton(
                                    label: 'Log In',
                                    onPressed: () {
                                      Navigator.pushReplacementNamed(
                                          context, '/customer_login');
                                    },
                                    width: 0.25),
                              ),
                              YellowButton(
                                  label: 'Sign Up',
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                        context, '/customer_signup');
                                  },
                                  width: 0.25),
                              const Image(
                                  image: AssetImage('images/inapp/logo2.png')),
                            ],
                          )),
                    ],
                  ),
                ],
              ),
              // Social media login
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Container(
                  height: 80,
                  decoration: const BoxDecoration(color: Color(0xFF1A237E)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GoogleFacebookLogin(
                        label: 'Google',
                        onPressed: () {},
                        child: const Image(
                            image: AssetImage('images/inapp/google.jpg')),
                      ),
                      GoogleFacebookLogin(
                        label: 'Facebook',
                        onPressed: () {},
                        child: const Image(
                            image: AssetImage('images/inapp/facebook.jpg')),
                      ),
                      processing == true
                          ? const CircularProgressIndicator()
                          : GoogleFacebookLogin(
                              label: 'Guest',
                              onPressed: () async {
                                setState(() {
                                  processing = true;
                                });

                                // guest data retrieve to profile
                                await FirebaseAuth.instance
                                    .signInAnonymously()
                                    .whenComplete(() async {
                                      _uid = FirebaseAuth.instance.currentUser!.uid;
                                  await anonymous.doc(_uid).set({
                                    'name': '',
                                    'email': '',
                                    'profileimage': '',
                                    'phone': '',
                                    'address': '',
                                    'cid': _uid,
                                  });
                                });

                                Navigator.pushReplacementNamed(
                                    context, '/customer_home');
                              },
                              child: const Icon(
                                Icons.person,
                                size: 55,
                                color: Colors.lightBlueAccent,
                              ),
                            ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class GoogleFacebookLogin extends StatelessWidget {
  final String label;
  final Function() onPressed;
  final Widget child;
  const GoogleFacebookLogin(
      {Key? key,
      required this.child,
      required this.label,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onPressed,
        child: Column(
          children: [
            SizedBox(height: 45, width: 50, child: child),
            Text(
              label,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
