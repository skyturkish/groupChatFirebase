import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:group_chat_app_firebase/core/constants/navigation/navigation_constants.dart';
import 'package:group_chat_app_firebase/core/extension/context_extension.dart';
import 'package:group_chat_app_firebase/product/widget/textFormField/auth_textformfield.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => RegisterViewState();
}

class RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _passwordController;
  late final TextEditingController _emailController;
  late final TextEditingController _fullNameController;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    _emailController = TextEditingController();
    _fullNameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: context.paddingMediumHorizontal + context.paddingSmallVertical,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Group Chat',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Text(
                    'Create your accoent ',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  Padding(
                    padding: context.paddingOnlyTopSmall,
                    child: CustomTextFormField(
                      labelText: "fullName",
                      controller: _fullNameController,
                      validator: (value) {
                        return value!.isEmpty ? "Name cannot be empty" : " ";
                      },
                    ),
                  ),
                  Padding(
                    padding: context.paddingOnlyTopSmall,
                    child: CustomTextFormField(
                      labelText: "email",
                      controller: _emailController,
                      validator: (value) {
                        return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value!)
                            ? null
                            : "Please enter a valid email";
                      },
                    ),
                  ),
                  Padding(
                    padding: context.paddingOnlyTopSmall,
                    child: CustomTextFormField(
                        controller: _passwordController,
                        labelText: "password",
                        isPassword: true,
                        validator: (val) {
                          val!.length < 6 ? "Password must be at least 6 charachter" : null;
                          return null;
                        }),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).primaryColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                      child: const Text(
                        "Register",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      onPressed: () {
                        register();
                      },
                    ),
                  ),
                  Text.rich(TextSpan(
                    text: "Alre3ady have an account? ",
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Login here",
                        style: const TextStyle(color: Colors.black, decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.pushNamedAndRemoveUntil(
                                context,
                                NavigationConstants.LOGIN,
                                (route) => false,
                              ),
                      ),
                    ],
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  register() {}
}
