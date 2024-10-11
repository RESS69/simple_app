import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:resume/provider/transaction_provider.dart';
import 'package:resume/screen/EditFormScreen.dart';
import 'package:resume/screen/detailScreen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<Homescreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<TransactionProvider>(context, listen: false).innitData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: const Text("เครื่องเล่นเกม"),
          actions: [
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                SystemNavigator.pop();
              },
            ),
          ],
        ),
        body: Consumer(
          builder: (context, TransactionProvider provider, Widget? child) {
            if (provider.transactions.isEmpty) {
              return const Center(
                child: Text('ไม่มีรายการ'),
              );
            } else {
              return ListView.builder(
                itemCount: provider.transactions.length,
                itemBuilder: (context, index) {
                  var statement = provider.transactions[index];
                  return Card(
                    elevation: 5,
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                    child: ListTile(
                      title: Text(statement.title),
                      subtitle: Text(DateFormat('dd MMM yyyy hh:mm:ss')
                          .format(statement.date)),
                      leading: const CircleAvatar(
                        radius: 30,
                        child: FittedBox(
                          child: Icon(
                            Icons.gamepad,
                            size: 24,
                          ),
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      EditFormScreen(transaction: statement),
                                ),
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              provider.deleteTransaction(statement.keyID);
                            },
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailScreen(transaction: statement)));
                      },
                    ),
                  );
                },
              );
            }
          },
        ));
  }
}
