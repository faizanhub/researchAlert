import 'package:flutter/material.dart';
import 'package:research_alert/core/services/auth_service.dart';
import 'package:research_alert/ui/custom_widgets/button.dart';
import 'package:research_alert/ui/custom_widgets/text_field.dart';
import 'package:research_alert/ui/screens/login_signup/login.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  AuthService _authService = AuthService();

  TextEditingController emailC = TextEditingController();

  TextEditingController passwordC = TextEditingController();

  TextEditingController confirmpasswordC = TextEditingController();
  FocusNode? passwordfocus;
  FocusNode? confirmpasswordfocus;
  final formkey = GlobalKey<FormState>();

  bool ispassword = true;
  bool isconfirmpassword = true;
  bool formStateLoading = false;

  @override
  void dispose() {
    emailC.dispose();
    passwordC.dispose();
    confirmpasswordC.dispose();
    super.dispose();
  }

  Future<void> ecoDialogue(String error) async {
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
      if (passwordC.text == confirmpasswordC.text) {
        String? accountstatus =
            await _authService.createAccount(emailC.text, passwordC.text);
        if (accountstatus != null) {
          ecoDialogue(accountstatus);
          setState(() {
            formStateLoading = false;
          });
        } else {
          Navigator.pop(context);
        }
        Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35, top: 15),
              child: const Text(
                'Create\nAccount',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(left: 35, right: 35),
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Form(
                      key: formkey,
                      // margin: const EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          TextFieldW(
                            check: true,
                            validate: (v) {
                              if (v!.isEmpty ||
                                  !v.contains("@") ||
                                  !v.contains(".com")) {
                                return "Email is badly formated";
                              }
                              return null;
                            },
                            inputAction: TextInputAction.next,
                            controller: emailC,
                            hintText: "Email",
                            icon: const Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          TextFieldW(
                            validate: (v) {
                              if (v!.isEmpty) {
                                return "Password should not be empty";
                              }
                              return null;
                            },
                            focusNode: passwordfocus,
                            inputAction: TextInputAction.next,
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
                            height: 25,
                          ),
                          TextFieldW(
                            isPassword: isconfirmpassword,
                            controller: confirmpasswordC,
                            validate: (v) {
                              if (v!.isEmpty) {
                                return "Password should not be empty";
                              }
                              return null;
                            },
                            hintText: "ConfirmPassword",
                            icon: IconButton(
                              color: Colors.white,
                              onPressed: () {
                                setState(() {
                                  isconfirmpassword = !isconfirmpassword;
                                });
                              },
                              icon: ispassword
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Buttonw(
                            title: "Sign Up",
                            isLoginButton: true,
                            onPress: () {
                              submit();
                            },
                            isLoading: formStateLoading,
                          ),
                          const SizedBox(
                            height: 110,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Already Have an Account ?"),
                              const SizedBox(
                                width: 4,
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginPage(),
                                        ));
                                  },
                                  child: const Text(
                                    "Login",
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
