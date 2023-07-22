//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learningdart/constants/routes.dart';
import 'package:learningdart/services/auth/auth_exception.dart';
import '../services/auth/bloc/auth_bloc.dart';
import '../services/auth/bloc/auth_event.dart';
import '../services/auth/bloc/auth_state.dart';
import '../utilities/dialogs/error_dialog.dart';

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
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) async {
              if (state is AuthStateLoggedOut) {
                if (state.exception is UserNotFoundAuthException) {
                  await showErrorDialog(context, 'User not found');
                } else if (state.exception is WrongpasswordAuthException) {
                  await showErrorDialog(context, 'Wrong credentials');
                } else if (state.exception is GenericAuthExpception) {
                  await showErrorDialog(context, 'Authentication error');
                }
              }
            },
            child: TextButton(
              onPressed: () async {
                final email = _email.text;
                final password = _password.text;
                context.read<AuthBloc>().add(
                      AuthEventLogIn(
                        email,
                        password,
                      ),
                    );
              },
              child: const Text('Login'),
            ),
          ),
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
