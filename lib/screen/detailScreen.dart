import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // ใช้สำหรับการจัดรูปแบบวันที่
import 'package:resume/models/transaction.dart';

class DetailScreen extends StatelessWidget {
  final Transactions transaction;

  const DetailScreen({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('รายละเอียดข้อมูล'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: const Icon(Icons.gamepad,
                      size: 40, color: Colors.deepPurple),
                  title: Text(
                    transaction.title,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(thickness: 1, height: 20),
                ListTile(
                  leading:
                      const Icon(Icons.star, color: Colors.amber, size: 30),
                  title: const Text('จุดเด่น : '),
                  subtitle: Text(
                    transaction.brand,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                const Divider(thickness: 1, height: 20),
                ListTile(
                  leading: const Icon(Icons.attach_money,
                      color: Colors.green, size: 30),
                  title: const Text('ราคาเปิดตัว : '),
                  subtitle: Text(
                    transaction.amount,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                const Divider(thickness: 1, height: 20),
                ListTile(
                  leading: const Icon(Icons.calendar_today,
                      color: Colors.blue, size: 30),
                  title: const Text('วันที่บันทึก'),
                  subtitle: Text(
                    DateFormat('dd MMM yyyy').format(transaction.date),
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
