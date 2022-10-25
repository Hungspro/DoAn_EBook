import 'package:doan_ebook_1/pages/authentication/login.dart';
import 'package:flutter/material.dart';
import 'signup.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) => isLogin 
    ? LoginWidget(onClickedSignUp: toggle) 
    : SignUpWidget(onClickedSignUp: toggle);
  
  void toggle() => setState(() => isLogin = !isLogin);
}