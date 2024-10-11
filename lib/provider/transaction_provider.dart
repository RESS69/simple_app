import 'package:resume/database/transaction_db.dart';
import 'package:flutter/foundation.dart';
import 'package:resume/models/transaction.dart';

class TransactionProvider with ChangeNotifier {
  List<Transactions> transactions = [];

  List<Transactions> getTransaction() {
    return transactions;
  }

  void innitData() async {
    var db = await TransactionDB(dbName: 'transactions.db');
    this.transactions = await db.loadAllData();
    notifyListeners();
  }

  void addTransaction(Transactions transaction) async {
    var db = await TransactionDB(dbName: 'transactions.db');
    var keyID = await db.insertDatabase(transaction);
    this.transactions = await db.loadAllData();
    notifyListeners();
  }

  void deleteTransaction(int? index) async {
    print('delete index: $index');
    var db = await TransactionDB(dbName: 'transactions.db');
    await db.deleteDatabase(index);
    this.transactions = await db.loadAllData();
    notifyListeners();
  }

  void updateTransaction(Transactions transaction) async {
    var db = await TransactionDB(dbName: 'transactions.db');
    await db.updateDatabase(transaction);
    this.transactions = await db.loadAllData();
    notifyListeners();
  }
}
