// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool statuspass = true;
  bool _rememberPass = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding:
            const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
        child: ListView(
          children: [
            const Text(
              "Sign In",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.20,
            ),
            const Text(
              "E-mail",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                filled: true,
                hintStyle: TextStyle(fontSize: 13),
                hintText: "Enter your email",
                fillColor: Color.fromRGBO(235, 233, 233, 0.612),
                border: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "password",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: passwordController,
              obscureText: statuspass,
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      statuspass = !statuspass;
                    });
                  },
                  child: Icon(
                    statuspass ? Icons.visibility : Icons.visibility_off,
                    color: Colors.blueAccent,
                  ),
                ),
                filled: true,
                hintText: "Enter your pssword ",
                hintStyle: const TextStyle(fontSize: 13),
                fillColor: const Color.fromRGBO(235, 233, 233, 0.612),
                border: const UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 1),
                  child: Checkbox(
                      value: _rememberPass,
                      activeColor: Colors.blueAccent,
                      onChanged: (value) {
                        setState(() {
                          _rememberPass = value!;
                        });
                      }),
                ),
                const Text(
                  " Remember Password",
                  style: TextStyle(fontSize: 13),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.blueAccent,
                          ),
                        )),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                  foregroundColor: Colors.white,
                ),
                onPressed: () async {
                  try {
                    await auth.signInWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text);

                    Navigator.pushNamed(context, "listTaches");
                  } on FirebaseAuthException catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("${e.message}"),
                      backgroundColor: Colors.red,
                    ));
                  }
                },
                child: const Text("Sign in"))
          ],
        ),
      ),
    );
  }
}
