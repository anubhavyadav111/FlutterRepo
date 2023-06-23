import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:learningdart/views/Register_view.dart';
import 'package:learningdart/views/login_view.dart';
import 'package:learningdart/views/verify_email.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Flutter Demo', //anubhav is the best
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        '/login/': (context) => const LoginView(),
        '/register/': (context) => const RegisterView(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = FirebaseAuth.instance.currentUser;
            if (user != null) {
              if (user.emailVerified) {
                print('Email is verified');
              } else {
                //print('You need to verify your email first');
                return const VerifyEmailView();
              }
            } 
            else {
              return const LoginView();
            }
            return const Text('done');
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
            // if (user?.emailVerified ?? false) {
            //   return const Text('done');
            //   //print('You are a verified user');
            // } else {
            //   //print('You need to verify your email first ');
            //   // Navigator.of(context).push(MaterialPageRoute(
            //   //   builder: (context) => const VerifyEmailView(),
            //   return const VerifyEmailView();

            // }
            

//           default:
//             return const Text('Loading ....');
//         }
//       },
//     );
//   }
// }
