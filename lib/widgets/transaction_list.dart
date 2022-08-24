import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransactions;

  TransactionList({
    required this.transactions,
    required this.deleteTransactions,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('No transaction added yet',
                  style: Theme.of(context).textTheme.headline6),
              SizedBox(height: 24),
              Container(
                height: 300,
                child: Image.asset(
                  'assets/images/empty.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          )
        : ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: transactions.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                margin: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 10,
                ),
                elevation: 2,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FittedBox(
                          child: Text('\$ ${transactions[index].amount}')),
                    ),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    DateFormat('EEEE, d MMM y', 'id')
                        .format(transactions[index].date),
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  trailing: IconButton(
                    onPressed: () => deleteTransactions(transactions[index].id),
                    icon: const Icon(Icons.delete),
                    color: Theme.of(context).errorColor,
                  ),
                ),
              );
            },
          );
  }
}
