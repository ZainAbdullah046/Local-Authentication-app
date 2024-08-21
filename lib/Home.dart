import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Home> {
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
      body: _UIBuild(),
    );
  }

  Widget _UIBuild() {
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
