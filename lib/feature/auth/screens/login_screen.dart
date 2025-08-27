import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/feature/auth/provider/login_provider.dart';
import 'package:task/feature/auth/widgets/log_widget.dart';
import 'package:task/feature/products/screens/home.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

final TextEditingController emailController = TextEditingController();
final TextEditingController passController = TextEditingController();

class _MyLoginPageState extends State<MyLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 115, 134, 255),
              Color.fromARGB(255, 21, 71, 255),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Welcome Back ",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Login",
                        style: TextStyle(fontSize: 26, color: Colors.black54),
                      ),
                      const SizedBox(height: 30),

                      textFieldLog(
                        controler: emailController,
                        label: "Email",
                        icon: Icon(Icons.email),
                      ),
                      const SizedBox(height: 20),
                      textFieldLog(
                        controler: passController,
                        label: "Password",
                        icon: Icon(Icons.lock),
                        obscure: true,
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: Consumer<LoginProvider>(
                          builder: (context, value, child) {
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  18,
                                  59,
                                  118,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: () async {
                                await value.logiProvider(
                                  emailController.text.trim(),
                                  passController.text.trim(),
                                );

                                if (value.user != null) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MyHome(),
                                    ),
                                  );
                                  ScaffoldMessenger.of( context).showSnackBar(
                                    SnackBar(content: Text('Login Successful')),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Login Failed')),
                                  );
                                }
                              },

                              child: const Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 15),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
