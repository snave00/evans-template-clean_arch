import 'package:flutter/material.dart';

class SignIpPageWrapper extends StatelessWidget {
  const SignIpPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Sign In Page'),
      ),
    );
    // return BlocProvider(
    //   create: (ctx) => sl<SignUpCubit>(),
    //   child: SignUpPage(),
    // );
  }
}
