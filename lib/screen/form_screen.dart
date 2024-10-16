import 'package:resume/main.dart';
import 'package:resume/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume/provider/transaction_provider.dart';
import 'package:resume/screen/HomeScreen.dart';

class FormScreen extends StatelessWidget {
  FormScreen({super.key});

  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final brandController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('แบบฟอร์มข้อมูล'),
        ),
        body: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'เครื่องเล่นเกม',
                  ),
                  autofocus: true,
                  controller: titleController,
                  validator: (String? str) {
                    if (str!.isEmpty) {
                      return 'กรุณากรอกข้อมูล';
                    }
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'จุดเด่น',
                  ),
                  autofocus: true,
                  controller: brandController,
                  validator: (String? str) {
                    if (str!.isEmpty) {
                      return 'กรุณากรอกข้อมูล';
                    }
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'ราคาเปิดตัว',
                  ),
                  autofocus: true,
                  controller: amountController,
                  validator: (String? str) {
                    if (str!.isEmpty) {
                      return 'กรุณากรอกข้อมูล';
                    }
                  },
                ),
                TextButton(
                    child: const Text('บันทึก'),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        var statement = Transactions(
                            keyID: null,
                            title: titleController.text,
                            brand: brandController.text,
                            amount: amountController.text,
                            date: DateTime.now());

                        var provider = Provider.of<TransactionProvider>(context,
                            listen: false);

                        provider.addTransaction(statement);

                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return MyHomePage();
                        }));
                      }
                    })
              ],
            )));
  }
}
