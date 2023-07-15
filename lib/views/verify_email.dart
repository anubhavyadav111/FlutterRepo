import 'package:flutter/material.dart';
import 'package:learningdart/constants/routes.dart';
import 'package:learningdart/services/auth/auth_service.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Email'),
      ),
      body: Column(
        children: [
          const Text(
              "We've sent you an email Verification. Please open it to verify your account."),
          const Text(
              "If you haven't received a verfication email yet, press button below"),
          TextButton(
            onPressed: () async {
              await AuthService.firebase().sendEmailVerification();
            },
            child: const Text('Send your Verification'),
          ),
          TextButton(
            onPressed: () async {
              await AuthService.firebase().logOut();

              Navigator.pushNamedAndRemoveUntil(
                  context, registerRoute, (route) => false);
            },
            child: const Text('Restart'),
          )
        ],
      ),
    );
  }
}
