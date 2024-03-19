import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezda/common/form_validators.dart';
import 'package:tezda/store/index.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  _autoAuthenticate() {
    authStore!.autoAuthenticate().then((value) => {
          if (authStore!.user != null)
            {Navigator.of(context).pushReplacementNamed("/home")}
        });
  }

  @override
  void initState() {
    _autoAuthenticate();
    super.initState();
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidate = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 40.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 32.sp,
                      color: const Color(0xff667eea),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Form(
                  autovalidateMode: autovalidate,
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        validator: emailValidator,
                        cursorColor: const Color(0xff667eea),
                        decoration: InputDecoration(
                            floatingLabelStyle:
                                const TextStyle(color: Color(0xff667eea)),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff667eea))),
                            prefixIconColor: MaterialStateColor.resolveWith(
                                (states) =>
                                    states.contains(MaterialState.focused)
                                        ? const Color(0xff667eea)
                                        : Colors.black),
                            prefixIcon: const Icon(
                              Icons.email,
                              size: 20,
                            ),
                            labelText: "Email"),
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
                              authStore!.login({
                                "email": _emailController.text,
                                "password": _passwordController.text,
                              });
                              Navigator.of(context)
                                  .pushReplacementNamed("/home");
                            } else {
                              setState(() {
                                autovalidate = AutovalidateMode.always;
                              });
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 14.h),
                            child: const Text(
                              "Sign In",
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
                            Navigator.of(context).pushNamed("/signup");
                          },
                          child:  Padding(
                            padding: EdgeInsets.symmetric(vertical: 14.h),
                            child: const Text(
                              "Sign Up",
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
