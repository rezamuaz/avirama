import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AuthWrapperView extends StatelessWidget {
  const AuthWrapperView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AutoRouter(),
    );
  }
}
