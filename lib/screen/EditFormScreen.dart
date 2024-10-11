import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume/models/transaction.dart';
import 'package:resume/provider/transaction_provider.dart';

class EditFormScreen extends StatefulWidget {
  final Transactions transaction;

  const EditFormScreen({super.key, required this.transaction});

  @override
  _EditFormScreenState createState() => _EditFormScreenState();
}

class _EditFormScreenState extends State<EditFormScreen> {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final brandController = TextEditingController();
  final amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize the form fields with the transaction data
    titleController.text = widget.transaction.title;
    brandController.text = widget.transaction.brand;
    amountController.text = widget.transaction.amount;
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
                labelText: 'เครื่องเล่นเกม',
              ),
              controller: titleController,
              validator: (String? str) {
                if (str!.isEmpty) {
                  return 'กรุณากรอกข้อมูล';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'จุดเด่น',
              ),
              controller: brandController,
              validator: (String? str) {
                if (str!.isEmpty) {
                  return 'กรุณากรอกข้อมูล';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'ราคาเปิดตัว',
              ),
              controller: amountController,
              validator: (String? str) {
                if (str!.isEmpty) {
                  return 'กรุณากรอกข้อมูล';
                }
                return null;
              },
            ),
            TextButton(
              child: const Text('บันทึก'),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  var updatedTransaction = Transactions(
                    keyID: widget.transaction.keyID,
                    title: titleController.text,
                    brand: brandController.text,
                    amount: amountController.text,
                    date: widget.transaction.date,
                  );

                  var provider =
                      Provider.of<TransactionProvider>(context, listen: false);
                  provider.updateTransaction(updatedTransaction);

                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
