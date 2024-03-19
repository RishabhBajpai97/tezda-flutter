import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezda/common/form_validators.dart';
import 'package:tezda/store/index.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidate = AutovalidateMode.disabled;
  String passwordMatchError = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8.w, vertical: 40.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  "Create Account",
                  style: TextStyle(
                      fontSize: 32.sp,
                      color: const Color(0xff667eea),
                      fontWeight: FontWeight.bold),
                ),
                 SizedBox(
                  height: 24.h,
                ),
                Form(
                  key: _formKey,
                  autovalidateMode: autoValidate,
                  child: Column(
                    children: [
                       SizedBox(
                        height: 20.h,
                      ),
                      TextFormField(
                        controller: _nameController,
                        validator: requiredValidator,
                        cursorColor: const Color(0xff667eea),
                        decoration: InputDecoration(
                          floatingLabelStyle:
                              const TextStyle(color: Color(0xff667eea)),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff667eea))),
                          prefixIcon: const Icon(Icons.person, size: 20),
                          prefixIconColor: MaterialStateColor.resolveWith(
                              (states) => states.contains(MaterialState.focused)
                                  ? const Color(0xff667eea)
                                  : Colors.black),
                          labelText: "Name",
                        ),
                      ),
                       SizedBox(
                        height: 20.h,
                      ),
                      TextFormField(
                        controller: _emailController,
                        validator: emailValidator,
                        cursorColor: const Color(0xff667eea),
                        decoration: InputDecoration(
                          floatingLabelStyle:
                              const TextStyle(color: Color(0xff667eea)),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff667eea))),
                          prefixIcon: const Icon(Icons.email, size: 20),
                          prefixIconColor: MaterialStateColor.resolveWith(
                              (states) => states.contains(MaterialState.focused)
                                  ? const Color(0xff667eea)
                                  : Colors.black),
                          labelText: "Email",
                        ),
                      ),
                       SizedBox(
                        height: 20.h,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        validator: passwordValidator,
                        cursorColor: const Color(0xff667eea),
                        obscureText: true,
                        decoration: InputDecoration(
                          floatingLabelStyle:
                              const TextStyle(color: Color(0xff667eea)),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff667eea))),
                          prefixIcon: const Icon(Icons.lock, size: 20),
                          prefixIconColor: MaterialStateColor.resolveWith(
                              (states) => states.contains(MaterialState.focused)
                                  ? const Color(0xff667eea)
                                  : Colors.black),
                          labelText: "Password",
                        ),
                      ),
                       SizedBox(
                        height: 20.h,
                      ),
                      TextFormField(
                        controller: _confirmPasswordController,
                        validator: passwordValidator,
                        cursorColor: const Color(0xff667eea),
                        obscureText: true,
                        decoration: InputDecoration(
                          floatingLabelStyle:
                              const TextStyle(color: Color(0xff667eea)),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff667eea))),
                          prefixIcon: const Icon(Icons.lock, size: 20),
                          prefixIconColor: MaterialStateColor.resolveWith(
                              (states) => states.contains(MaterialState.focused)
                                  ? const Color(0xff667eea)
                                  : Colors.black),
                          labelText: "Confirm password",
                        ),
                      ),
                        SizedBox(
                        height: 40.h,
                      ),
                      Text(
                        passwordMatchError,
                        style: const TextStyle(color: Colors.red),
                      ),
                       SizedBox(
                        height: 40.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              splashFactory: NoSplash.splashFactory,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(4),
                                ),
                              ),
                              backgroundColor: const Color(0xff667eea)),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              if (_passwordController.text ==
                                  _confirmPasswordController.text) {
                                authStore!.signup({
                                  "name": _nameController.text,
                                  "email": _emailController.text,
                                  "password": _passwordController.text
                                });
                                Navigator.of(context)
                                    .pushReplacementNamed("/home");
                              } else {
                                setState(() {
                                  passwordMatchError = "Passwords do not match";
                                });
                              }
                            } else {
                              setState(() {
                                autoValidate = AutovalidateMode.always;
                              });
                            }
                          },
                          child:  Padding(
                            padding: EdgeInsets.symmetric(vertical: 14.h),
                            child: const Text(
                              "Create account",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                       SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            splashFactory: NoSplash.splashFactory,
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(
                                  style: BorderStyle.solid, color: Colors.red),
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed("/login");
                          },
                          child:  Padding(
                            padding: EdgeInsets.symmetric(vertical: 14.h),
                            child: const Text(
                              "Sign in",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
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
    );
  }
}
