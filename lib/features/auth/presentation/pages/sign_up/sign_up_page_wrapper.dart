import 'package:flutter/material.dart';

class SignUpPageWrapper extends StatelessWidget {
  const SignUpPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Sign Up Page'),
      ),
    );
    // return BlocProvider(
    //   create: (ctx) => sl<SignUpCubit>(),
    //   child: SignUpPage(),
    // );
  }
}
