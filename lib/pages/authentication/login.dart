import 'package:doan_ebook_1/main.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  final VoidCallback onClickedSignUp;
  const LoginWidget({
    Key? key,
    required this.onClickedSignUp,
  }) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose;
    passwordController.dispose;
    super.dispose;
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(height: 60),
          Image.asset("assets/images/ebook-logo-black-and-white.png",
              height: 250),
          const SizedBox(height: 40),
          TextFormField(
            controller: emailController,
            cursorColor: Colors.white,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(labelText: 'Email'),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (email) =>
                email != null && !EmailValidator.validate(email)
                    ? 'Enter a valid email!'
                    : null,
          ),
          const SizedBox(height: 4),
          TextFormField(
            controller: passwordController,
            textInputAction: TextInputAction.done,
            cursorColor: Colors.white,
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => value != null && value.length < 6
                ? "Enter min 6 characters"
                : null,
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: signIn,
            icon: const Icon(Icons.lock_open),
            label: const Text(
              'Sign in',
              style: TextStyle(fontSize: 24),
            ),
          ),
          const SizedBox(height: 24),
          RichText(
              text: TextSpan(
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                  text: 'No account?  ',
                  children: [
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = widget.onClickedSignUp,
                    text: 'Sign up',
                    style: const TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.lightBlue))
              ]))
        ]),
      ));

  Future signIn() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      // TODO
      // ignore: avoid_print
      print(e);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
