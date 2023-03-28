// Packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipes/src/presentation/global/functions.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';

  final formKeyLogin = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: SizedBox(
          width: size.width * 0.7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: const AssetImage('./assets/recipes.png'),
                width: size.width * 0.5,
              ),
              const SizedBox(height: 50),
              Form(
                key: formKeyLogin,
                child: Column(
                  children: [
                    TextFormField(
                      autofocus: true,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        setState(() {
                          email = value.trim();
                        });
                      },
                      decoration: const InputDecoration(hintText: 'Email'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Type an email address';
                        }
                        if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                          return 'You must an email address';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      obscureText: true,
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      decoration: const InputDecoration(hintText: 'Password'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Type a password';
                        }
                        if (value.length <= 8) {
                          return 'You must enter a longer password';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: size.width * 0.7,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (formKeyLogin.currentState!.validate()) {
                            try {
                              await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                email: email,
                                password: password,
                              );
                              // ignore: use_build_context_synchronously
                              Navigator.pushNamed(context, '/home');
                            } catch (e) {
                              showCustomDialog(
                                context: context,
                                text: 'Error: User not found',
                              );
                            }
                          }
                        },
                        child: const Text('Sign in'),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
