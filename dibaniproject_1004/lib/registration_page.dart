import 'package:flutter/material.dart';
import 'widget/input_field.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() =>
      _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();


  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),
        backgroundColor: const Color.fromARGB(255, 109, 99, 249),
      ),
      body: Center(
        child: SizedBox(
          height: 480,
          width: 300,
          child: Card(
            color: const Color.fromARGB(255, 180, 184, 249),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Registration",
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
                          keyboardType: TextInputType.name,
                          labelText: "Name",
                          hintText: "Enter Name",
                          prefixIcon: Icon(Icons.person),

                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Field is Empty!!";
                            }
                            else if (!RegExp(
                              r'^[a-zA-Z ]+$'
                            ).hasMatch(value)) {
                              return "Enter a valid Name!!";
                            }

                            return null;
                          },
                        ),

                        SizedBox(height: 15),

                        InputField(
                          controller: controller2,
                          keyboardType: TextInputType.emailAddress,
                          labelText: "Email",
                          hintText: "Enter Email",
                          prefixIcon: Icon(Icons.email),

                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Field is Empty!!";
                            }
                            else if (!RegExp(
                              r'^[a-z0-9.]+@gmail\.com$'
                            ).hasMatch(value)) {
                              return "Enter a valid Email!!";
                            }

                            return null;
                          },
                        ),

                        SizedBox(height: 15),


                        InputField(
                          controller: controller3,
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

                        SizedBox(height: 15),


                        InputField(
                          controller: controller4,
                          keyboardType: TextInputType.text,
                          labelText: "Confirm Password",
                          hintText: "Confirm Password",
                          prefixIcon: Icon(Icons.lock_outline),

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
                            else if (value != controller3.text) {
                              return "Password does not match!!";
                            }

                            return null;
                          },
                        ),

                        SizedBox(height: 20),

                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {

                              String name = controller1.text;
                              String email = controller2.text;
                              String password = controller3.text;
                              String confirmPassword = controller4.text;

                              print("Email: $name");
                              print("Email: $email");
                              print("Password: $password");
                              print("Confirm Password: $confirmPassword");

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Registration Successful!!"),
                                ),);
                            }
                          },
                          child: Text("Register"),
                        ),

                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Already have an account? Login"
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