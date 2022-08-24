import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import '../widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  const Chart({
    required this.recentTransactions,
    Key? key,
  }) : super(key: key);

  List<Map<String, Object>> get groupTransactionValues {
    return List.generate(7, (index) {
      //weekday = hari ini, kemudian duration nya diambil berdasarkan hari, dan harinya dimulai berdasarkan nilai index nya.
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalAmount = 0;

      //perulangan lama.
      for (int i = 0; i < recentTransactions.length; i++) {
        //kondisi untuk menyamakan hari, bulan, dan tahun
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalAmount += recentTransactions[i].amount;
        }
      }

      //jenis perulangan baru
      // for (var recentTrasaction in recentTransactions) {
      //   //kondisi untuk menyamakan hari, bulan, dan tahun
      //   if (recentTransactions[index].date.day == weekDay.day &&
      //       recentTransactions[index].date.month == weekDay.month &&
      //       recentTransactions[index].date.year == weekDay.year) {
      //     totalAmount += recentTransactions[index].amount;
      //   } else {}
      // }

      //DateFormat.E mengambil hari, dimana hari nya itu didapat dari variable weekDay
      return {
        'day': DateFormat.E('id').format(weekDay),
        'amount': totalAmount,
      };
      //reverse.toList berguna untuk memutar urutan list
    }).reversed.toList();
  }

  double get totalSpending {
    //fold merubah list menjadi jenis object lainnya
    return groupTransactionValues.fold(0.0, (previousValue, element) {
      return previousValue + (element['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(groupTransactionValues);
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupTransactionValues.map((data) {
              //Flexible hampir mirip dengan Expaned. flexingle berguna untuk positioning contennya
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                  label: data['day'] as String,
                  spendingAmount: data['amount'] as double,
                  spendingPercentOfTotal: totalSpending == 0.0
                      ? 0.0
                      : (data['amount'] as double) / totalSpending,
                ),
              );
            }).toList()),
      ),
    );
  }
}
