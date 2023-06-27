//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:learningdart/constants/routes.dart';
import 'package:learningdart/services/auth/auth_exception.dart';
import 'package:learningdart/services/auth/auth_service.dart';
import '../utilities/show_error_dialog.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  @override
  void initState() {
    // TODO: implement initState
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login '),
      ),
      body: Column(
        children: [
          TextField(
            controller: _email,
            enableSuggestions: false,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: 'Enter you email here',
            ),
          ),
          TextField(
            controller: _password,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: const InputDecoration(
              hintText: 'Enter you password here',
            ),
          ),
          TextButton(
              onPressed: () async {
                final email = _email.text;
                final password = _password.text;
                try {
                 
                  await AuthService.firebase().logIn(
                    email: email,
                    password: password,
                  );
                  // ignore: use_build_context_synchronously
                  final user =AuthService.firebase().currentUser;
                  if (user?.isEmailVerifed ?? false) {
                    // ignore: use_build_context_synchronously
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      notesRoute,
                      (route) => false,
                    );
                  } else {
                    // ignore: use_build_context_synchronously
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      verifyEmailRoute,
                      (route) => false,
                    );
                  }
                }
                 on UserNotFoundAuthException{
                     await showErrorDialog(
                      context,
                      'User not found', );
                 }
                 on WrongpasswordAuthException{
                  await showErrorDialog(
                      context,
                      'Wrong Credentials',
                    );
                 }
                 on GenericAuthExpception{
                  await showErrorDialog(
                    context,
                    'Authentication error',
                  );
                 }
                      
              },
              child: const Text('Login')),
          TextButton(
            onPressed: () {
              //   Navigator.of(context)
              //  .pushAndRemoveUntil('/register/', (route) => false);
              Navigator.pushNamedAndRemoveUntil(
                  context, registerRoute, (route) => false);
            },
            child: const Text('Not registered yet? Register here! '),
          ),
        ],
      ),
    );
  }
}
