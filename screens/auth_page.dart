import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) =>
  isLogin ? login(onClickedSignUp: toggle,) :
  signup(onClickedSignIn: toggle);
  void toggle() => setState(() {
    isLogin = !isLogin;
  }
  );
}
