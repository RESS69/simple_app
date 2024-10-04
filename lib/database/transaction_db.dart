import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:resume/models/transaction.dart';

class TransactionDB {
  String dbName;

  TransactionDB({required this.dbName});

  Future<Database> openDatabase() async {
    Directory appDirectory = await getApplicationDocumentsDirectory();
    String dbLocation = join(appDirectory.path, dbName);

    DatabaseFactory dbFactory = databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbLocation);
    return db;
  }

  Future<int> insertDatabase(Transactions statement) async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store('expense');

    var keyID = store.add(db, {
      "title": statement.title,
      "brand": statement.brand,
      "amount": statement.amount,
      "date": statement.date.toIso8601String()
    });
    db.close();
    return keyID;
  }

  Future<List<Transactions>> loadAllData() async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store('expense');
    var snapshot = await store.find(db,
        finder: Finder(sortOrders: [SortOrder(Field.key, false)]));
    List<Transactions> transactions = [];
    for (var record in snapshot) {
      transactions.add(Transactions(
          keyID: record.key,
          title: record['title'].toString(),
          amount: record['amount'].toString(),
          date: DateTime.parse(record['date'].toString()),
          brand: record['brand'].toString()));
    }
    return transactions;
  }

  deleteDatabase(int? index) async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store('expense');
    await store.delete(db,
        finder: Finder(filter: Filter.equals(Field.key, index)));
  }

  Future<void> updateDatabase(Transactions statement) async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store('expense');

    await store.record(statement.keyID!).update(db, {
      "title": statement.title,
      "brand": statement.brand,
      "amount": statement.amount,
      "date": statement.date.toIso8601String()
    });
  }
}
