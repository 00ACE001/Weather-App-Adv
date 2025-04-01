import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wether_app_v1/helper/snake_bar.dart';
import 'package:wether_app_v1/views/home_view.dart';
import 'package:wether_app_v1/views/login_page.dart';
import 'package:wether_app_v1/widgets/Custom_button.dart';
import 'package:wether_app_v1/widgets/custom_text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegesterPage extends StatefulWidget {
  RegesterPage({super.key});
  static String id = "RegesterPage";

  @override
  State<RegesterPage> createState() => _RegesterPageState();
}

class _RegesterPageState extends State<RegesterPage> {
  String? email;

  String? password;

  bool isloading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: RichText(
            text: TextSpan(
                text: 'Weather',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: 'App',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 246, 223, 20),
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
          ),
        ),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.blue[800]!,
              Colors.blue[500]!,
              Colors.blue[200]!,
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  SizedBox(
                    height: 100.h,
                  ),
                  Text(
                    "REGISTER",
                    style:
                        TextStyle(fontSize: 35.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 17.h,
                  ),
                  CustomFormTextField(
                    onChanged: (data) {
                      email = data;
                    },
                    hintText: 'Enter your email',
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomFormTextField(
                    onChanged: (data) {
                      password = data;
                    },
                    hintText: 'Enter your password',
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomButton(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        isloading = true;
                        setState(() {});

                        print('mmmmmmmmmmmmmmmmmmmmmmmmm');
                        try {
                          await registerUSER();
                          snackBar(context, message: "success");
                          Navigator.pushNamed(context, HomeView.id);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            snackBar(context, message: 'weak-password');
                          } else if (e.code == 'email-already-in-use') {
                            snackBar(context, message: 'email-already-in-use');
                          }
                        }
                        isloading = false;
                        setState(() {});
                      } else {}

                      //  print(user.user!.displayName);
                    },
                    buttonText: 'REGISTER',
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "have an account?",
                        style: TextStyle(color: Colors.black, fontSize: 14.sp),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "  LOGIN",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                              color: Colors.black),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // void snackBar(BuildContext context, {required String message}) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(message),
  //     ),
  //   );
  // }

  Future<void> registerUSER() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
