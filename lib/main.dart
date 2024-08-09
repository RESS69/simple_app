import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: const Text(
          'App Bar Hello World',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Center(
              child: Text(
                'Resume',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Image.asset(
                'assets/image/profile.jpg', // Ensure this matches your file structure
                width: 200,
                height: 200,
              ),
            ),
            const Text('DETAIL:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const Text('First Name: Pantamit', style: TextStyle(fontSize: 16)),
            const Text('Last Name: Muangnan', style: TextStyle(fontSize: 16)),
            const Text('Hobby: Sleep', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            const Text('Education:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const Text(' Primary: Khun fang School  GPA: 3.55',
                style: TextStyle(fontSize: 16)),
            const Text(' Secondary: T.U.N.U School  GPA: 3.68',
                style: TextStyle(fontSize: 16)),
            const Text(' UnderGrad: Naresuan University  GPA: Null',
                style: TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            const Text('ผลงานพัฒนาระบบฯ ที่เคยทำ:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const Text(
              "-ไม่มี",
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
