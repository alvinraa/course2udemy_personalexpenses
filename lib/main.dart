import 'package:flutter/material.dart';

import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './models/transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //remove debugbanner
      debugShowCheckedModeBanner: false,
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransaction = [
    Transaction(
      id: 't1',
      title: 'Makanan',
      amount: 15,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Transport',
      amount: 10,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'Sewa Kos',
      amount: 15,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'Kebutuhan Harian',
      amount: 20,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't5',
      title: 'Hiburan',
      amount: 25,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(
    String newTransactionTittle,
    double newTransactionAmount,
  ) {
    final newTransaction = Transaction(
      //id harus unique jadi kita ambil berdasarkan date
      id: DateTime.now().toString(),
      title: newTransactionTittle,
      amount: newTransactionAmount,
      date: DateTime.now(),
    );

    setState(() {
      _userTransaction.add(newTransaction);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(addTransaction: _addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Expenses'),
        actions: <Widget>[
          IconButton(
              onPressed: () => _startAddNewTransaction(context),
              icon: Icon(
                Icons.add,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: 150,
              height: 150,
              child: const Card(
                child: Center(child: Text('Chart')),
              ),
            ),
            TransactionList(transactions: _userTransaction),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
