import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:login_and_register_ui_1/components/default_form_field.dart';
import 'package:login_and_register_ui_1/components/resources.dart';
import 'package:login_and_register_ui_1/home/home_screen.dart';
import 'package:login_and_register_ui_1/register/register_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  // Controllers
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
                  "login".toUpperCase(),
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
                  "Login Now & Enjoy!",
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                DefaultFormField(
                  type: TextInputType.name,
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
                  type: TextInputType.visiblePassword,
                  controller: passwordController,
                  label: "Password",
                  isPassword: true,
                  focusedColorBorder: HexColor("#ced4da"),
                  labelColor: Colors.grey,
                  borderWidth: 50.0,
                  prefixColorIcon: Colors.grey,
                  prefix: Icons.password,
                  suffix: Icons.visibility_off_outlined,
                  maxLines: 1,
                  isSuffix: true,
                  suffixPressed: () {},
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password!';
                    }
                    return null;
                  },
                  borderColor: HexColor("#ced4da"),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    child: Text(
                      "Forget Password?",
                    ),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(
                  height: 5.0,
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
                      "Login",
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
                  children: [
                    Expanded(
                        child: Divider(
                      color: Color.fromARGB(255, 213, 212, 212),
                      thickness: 1,
                    )),
                    Text(
                      "Or login with:",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Expanded(
                        child: Divider(
                      color: Color.fromARGB(255, 213, 212, 212),
                      thickness: 1,
                    )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    socialBuilder(context, Resources.facebook),
                    SizedBox(
                      width: 5,
                    ),
                    socialBuilder(context, Resources.google),
                    SizedBox(
                      width: 5,
                    ),
                    socialBuilder(context, Resources.twitter),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don\'t have an account?",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(0),
                      width: 70,
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Register",
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

  Widget socialBuilder(context, websiteSvg) {
    return Expanded(
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(10),
            border: Border.all(
              color: const Color.fromARGB(255, 216, 216, 216),
            ),
          ),
          child: Padding(
              padding: const EdgeInsetsDirectional.only(
                top: 10.0,
                bottom: 10.0,
              ),
              child: SvgPicture.asset(
                websiteSvg,
                width: 30,
                height: 30,
              )),
        ),
      ),
    );
  }
}
