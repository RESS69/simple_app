import 'package:flutter/material.dart';
import 'package:resume/screen/HomeScreen.dart';
import 'package:resume/screen/form_screen.dart';
import 'package:provider/provider.dart';
import 'package:resume/provider/transaction_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return TransactionProvider();
        }),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          body: TabBarView(
            children: [Homescreen(), FormScreen()],
          ),
          bottomNavigationBar: const TabBar(
            tabs: [
              Tab(
                text: "รายการข้อมูล",
                icon: Icon(Icons.list),
              ),
              Tab(
                text: "เพิ่มข้อมูล",
              )
            ],
          ),
        ));
  }
}
