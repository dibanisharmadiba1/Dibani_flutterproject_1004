import 'package:flutter/material.dart';
import 'widget/input_field.dart';
import 'registration_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() =>
      _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    controller1.dispose();
    controller2.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: const Color.fromARGB(255, 109, 99, 249),
      ),
      body: Center(
        child: SizedBox(
          height: 400,
          width: 300,
          child: Card(
            color: const Color.fromARGB(255, 180, 184, 249),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        InputField(
                          controller: controller1,
                          keyboardType: TextInputType.emailAddress,
                          labelText: "Email",
                          hintText: "Enter Email",
                          prefixIcon: Icon(Icons.email),

                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Field is Empty!!";
                            }
                            else if (!RegExp(
                              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
                            ).hasMatch(value)) {
                              return "Enter a valid Email!!";
                            }

                            return null;
                          },
                        ),

                        SizedBox(height: 20),

                        InputField(
                          controller: controller2,
                          keyboardType: TextInputType.text,
                          labelText: "Password",
                          hintText: "Enter Password",
                          prefixIcon: Icon(Icons.lock),


                          obscureText: true,

                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Field is Empty!!";
                            }
                            else if (!RegExp(
                              r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$'
                            ).hasMatch(value)) {
                              return "Enter a valid Password!!";
                            }

                            return null;
                          },
                        ),

                        SizedBox(height: 20),

 
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {

                              String email = controller1.text;
                              String password = controller2.text;

                              print("Email: $email");
                              print("Password: $password");
                            }
                          },
                          child: Text("Login"),
                        ),

                        SizedBox(height: 10),

                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    RegistrationPage(),
                              ),
                            );
                          },
                          child: Text(
                            "Don't have an account? Register"
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}