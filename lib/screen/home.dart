import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                print("test button Pressed");
              },
              child: const Text(
                "Text",
                style: TextStyle(color: Colors.amber, fontSize: 20),
              ),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.brown,
              ),
              onPressed: () {
                print("FilledButton Pressed");
              },
              child: const Text(
                "Filled",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  shadowColor: Colors.black,
                  overlayColor: Colors.red),
              onPressed: () {
                print("ElevateBotton Pressed");
              },
              child: const Text(
                "Elevate",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                side: BorderSide(
                  color: Colors.green,
                  width: 2,
                ),
              ),
              onPressed: () {
                print("OutlineBotton Pressed");
              },
              child: const Text(
                "Outline",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
