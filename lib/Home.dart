import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Home> {
  final LocalAuthentication auth = LocalAuthentication();
  bool Authenticated = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 140, 191, 232),
        title: const Center(
          child: Text("Local Authentication",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
        ),
      ),
      body: _uiBuild(),
      floatingActionButton: _authButton(),
    );
  }

  Widget _authButton() {
    return FloatingActionButton(
      onPressed: () async {
        if (!Authenticated) {
          final bool canAuthenticateWithBiometric =
              await auth.canCheckBiometrics;
          print(canAuthenticateWithBiometric);
        } else {
          setState(() {
            Authenticated = false;
          });
        }
      },
      child: Icon(Authenticated ? Icons.lock : Icons.lock_open),
    );
  }

  Widget _uiBuild() {
    return SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Account Balance",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            if (Authenticated)
              const Text(
                "\$25,000",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            if (!Authenticated)
              const Text(
                "******",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
          ],
        ));
  }
}
