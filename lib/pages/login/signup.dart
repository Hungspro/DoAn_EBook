import 'package:doan_ebook_1/main.dart';
import 'package:doan_ebook_1/pages/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

class SignUpWidget extends StatefulWidget {
  final VoidCallback onClickedSignUp;
  const SignUpWidget({
    Key? key,
    required this.onClickedSignUp,

  }) :super(key: key);

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
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
        padding: EdgeInsets.all(16),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(height: 40),
          TextField(
            controller: emailController,
            cursorColor: Colors.white,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          SizedBox(height: 4),
          TextField(
            controller: passwordController,
            cursorColor: Colors.white,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(labelText: 'Password'),
          ),
          SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: signIn,
            icon: Icon(Icons.lock_open),
            label: Text(
              'Sign in',
              style: TextStyle(fontSize: 24),
            ),
          ),
          SizedBox(height: 24),
          RichText(
              text: TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 20),
                  text: 'Have account?  ',
                  children: [
                TextSpan(
                  recognizer: TapGestureRecognizer()
                  ..onTap = widget.onClickedSignUp,
                    text: 'Log in',
                    style: TextStyle(decoration: TextDecoration.underline, color: Colors.lightBlue))
              ]))
        ]),
      );

  Future signIn() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      // TODO
      print(e);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
