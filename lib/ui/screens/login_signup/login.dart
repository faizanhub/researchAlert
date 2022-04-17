import 'package:flutter/material.dart';
import 'package:research_alert/core/services/auth_service.dart';
import 'package:research_alert/core/services/database_services.dart';
import 'package:research_alert/ui/custom_widgets/button.dart';
import 'package:research_alert/ui/custom_widgets/text_field.dart';

import 'package:research_alert/ui/screens/home_screen.dart';
import 'package:research_alert/ui/screens/login_signup/forget_password.dart';
import 'package:research_alert/ui/screens/login_signup/signup.dart';

class LoginPage extends StatefulWidget {
  static const id = '/LoginPage';

  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthService _authService = AuthService();

  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  final formkey = GlobalKey<FormState>();
  bool formStateLoading = false;

  FocusNode? passwordfocus;

  bool ispassword = true;

  @override
  void dispose() {
    emailC.dispose();
    passwordC.dispose();
    super.dispose();
  }

  void ecoDialogue(String error) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(error),
            actions: [
              Buttonw(
                title: "CLOSE",
                onPress: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  submit() async {
    if (formkey.currentState!.validate()) {
      setState(() {
        formStateLoading = true;
      });

      String? accountstatus =
          await _authService.signInAccount(emailC.text, passwordC.text);
      if (accountstatus != null) {
        ecoDialogue(accountstatus);
        setState(() {
          formStateLoading = false;
        });
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const HomeScreen()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/register.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35, top: 120),
              child: const Text(
                'Welcome\nTo\nLogin Page',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(left: 35, right: 35),
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.43),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Form(
                      key: formkey,
                      // margin: const EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          TextFieldW(
                            inputAction: TextInputAction.next,
                            controller: emailC,
                            hintText: "Email",
                            icon: const Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            validate: (v) {
                              if (v!.isEmpty ||
                                  !v.contains("@") ||
                                  !v.contains(".com")) {
                                return "Email is badly formated";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 45,
                          ),
                          TextFieldW(
                            isPassword: ispassword,
                            controller: passwordC,
                            hintText: "Password",
                            icon: IconButton(
                              color: Colors.white,
                              onPressed: () {
                                setState(() {
                                  ispassword = !ispassword;
                                });
                              },
                              icon: ispassword
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off),
                            ),
                            validate: (v) {
                              if (v!.isEmpty) {
                                return "Password should not be empty";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 1, vertical: 10),
                                child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const ForgetPassword(),
                                          ));
                                    },
                                    child: const Text(
                                      "Forgot Password ?",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 247, 247, 248),
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    )),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Buttonw(
                            title: "LOGIN",
                            isLoading: formStateLoading,
                            onPress: () {
                              submit();
                            },
                          ),
                          const SizedBox(
                            height: 100,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Create New Account "),
                              const SizedBox(
                                width: 4,
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const MyRegister(),
                                        ));
                                  },
                                  child: const Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        color: Color(0xFF252c4a),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ))
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
