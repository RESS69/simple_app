import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume/models/transaction.dart';
import 'package:resume/provider/transaction_provider.dart';

class EditFormScreen extends StatelessWidget {
  final Transactions transaction;

  EditFormScreen({super.key, required this.transaction});

  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final brandController = TextEditingController();
  final aboutController = TextEditingController();

  void initState() {
    titleController.text = transaction.title;
    brandController.text = transaction.brand;
    aboutController.text = transaction.about;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('แก้ไขข้อมูล'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'อุปกรณ์ที่ใช้ในการเล่นเกม',
              ),
              controller: titleController,
              validator: (String? str) {
                if (str!.isEmpty) {
                  return 'กรุณากรอกข้อมูล';
                }
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'ยี่ห้อ',
              ),
              controller: brandController,
              validator: (String? str) {
                if (str!.isEmpty) {
                  return 'กรุณากรอกข้อมูล';
                }
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'อุปกรณ์ที่ใช้ในการเล่นเกม',
              ),
              autofocus: true,
              controller: aboutController,
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
                  var updatedTransaction = Transactions(
                    keyID: transaction.keyID,
                    title: titleController.text,
                    brand: brandController.text,
                    about: aboutController.text,
                    date: transaction.date, // Keep the same date
                  );

                  // Update the transaction data in the provider
                  var provider =
                      Provider.of<TransactionProvider>(context, listen: false);
                  provider.updateTransaction(updatedTransaction);

                  Navigator.pop(context); // Go back to the previous screen
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
