//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:learningdart/constants/routes.dart';
import 'package:learningdart/services/auth/auth_exception.dart';
import 'package:learningdart/services/auth/auth_service.dart';

import '../utilities/dialogs/error_dialog.dart';
//import '../firebase_options.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
        title: const Text('Register'),
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
                  await AuthService.firebase().createUser(
                    email: email,
                    password: password,
                  );
                  // devtools.log(userCredentail.toString());
                  AuthService.firebase().sendEmailVerification();
                  Navigator.of(context).pushNamed(verifyEmailRoute);
                  Navigator.of(context).pushNamed(verifyEmailRoute);
                } on WeakPasswordAuthExpception {
                  await showErrorDialog(context, 'Weak Password');
                } on EmailAlreadyInUseAuthExpception {
                  await showErrorDialog(context, 'email-already-in-use');
                } on InvalidEmailAuthExpception {
                  await showErrorDialog(context, 'Invalid-email');
                } on GenericAuthExpception {
                  await showErrorDialog(
                    context,
                    'Failed to register',
                  );
                }
              },
              child: const Text('Register')),
          TextButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, loginRoute, (route) => false);
            },
            child: const Text('Already registered ? Click here '),
          ),
        ],
      ),
    );
  }
}
