import 'package:flutter/material.dart';
import 'package:research_alert/ui/custom_widgets/button.dart';
import 'package:research_alert/ui/custom_widgets/text_field.dart';
import 'package:research_alert/ui/screens/login_signup/login.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController emailC = TextEditingController();

  TextEditingController passwordC = TextEditingController();
  FocusNode? passwordfocus;

  bool ispassword = true;

  @override
  void dispose() {
    emailC.dispose();
    passwordC.dispose();
    super.dispose();
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
                'Reset Password ',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.43),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 35, right: 35),
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
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Buttonw(
                            title: "Send Email",
                          ),
                          const SizedBox(
                            height: 150,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("After Send Link Login?"),
                              const SizedBox(
                                width: 4,
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()));
                                  },
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Color(0xFF252c4a),
                                        fontSize: 20,
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
