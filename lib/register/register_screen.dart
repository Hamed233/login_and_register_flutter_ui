import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:login_and_register_ui_1/components/default_form_field.dart';
import 'package:login_and_register_ui_1/home/home_screen.dart';
import 'package:login_and_register_ui_1/login/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  // Controllers
  var emailController = TextEditingController();
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  // Form Key
  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/app_logo-removebg.png',
                    width: 100,
                    height: 100,
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Text(
                  "register".toUpperCase(),
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                        fontSize: 30.0,
                        letterSpacing: 3.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  "Register & Get more features!",
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                DefaultFormField(
                  type: TextInputType.text,
                  controller: usernameController,
                  label: "username",
                  focusedColorBorder: HexColor("#ced4da"),
                  labelColor: Colors.grey,
                  borderWidth: 50.0,
                  prefixColorIcon: Colors.grey,
                  prefix: Icons.person,
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username!';
                    }
                    return null;
                  },
                  borderColor: HexColor("#ced4da"),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                DefaultFormField(
                  type: TextInputType.emailAddress,
                  controller: emailController,
                  label: "Email",
                  focusedColorBorder: HexColor("#ced4da"),
                  labelColor: Colors.grey,
                  borderWidth: 50.0,
                  prefixColorIcon: Colors.grey,
                  prefix: Icons.alternate_email,
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email!';
                    }
                    return null;
                  },
                  borderColor: HexColor("#ced4da"),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                DefaultFormField(
                  type: TextInputType.visiblePassword,
                  controller: passwordController,
                  label: "password",
                  focusedColorBorder: HexColor("#ced4da"),
                  labelColor: Colors.grey,
                  borderWidth: 50.0,
                  prefixColorIcon: Colors.grey,
                  prefix: Icons.person,
                  isPassword: true,
                  suffix: Icons.visibility_off_outlined,
                  isSuffix: true,
                  maxLines: 1,
                  suffixPressed: () {},
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password!';
                    }
                    return null;
                  },
                  borderColor: HexColor("#ced4da"),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Container(
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: HexColor('#6200EE'),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(
                              username: usernameController.text,
                            ),
                          ),
                        );
                      }
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "You Have an Account?",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(0),
                      width: 55,
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: HexColor('#6200EE'),
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
