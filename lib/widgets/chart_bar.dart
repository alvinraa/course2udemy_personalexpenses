import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPercentOfTotal;

  const ChartBar({
    required this.label,
    required this.spendingAmount,
    required this.spendingPercentOfTotal,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //LayoutBuilder untuk mengambil height/width suatu widget parent,
    //digunakan dengan cocnstraints.
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: <Widget>[
            //FittedBox, membuat childnya tidak melebar kemana-mana.
            Container(
              height: constraints.maxHeight * 0.12,
              child: FittedBox(
                child: Text('\$ ${spendingAmount.toStringAsFixed(0)}'),
              ),
            ),
            SizedBox(height: constraints.maxHeight * 0.08),
            Container(
              height: constraints.maxHeight * 0.6,
              width: 15,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      color: const Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  //fractionallysizedbox mengambil tinggi dan width dari parentnya, kemudian bisa diberikan persen
                  FractionallySizedBox(
                    heightFactor: spendingPercentOfTotal,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: constraints.maxHeight * 0.08),
            Container(
              height: constraints.maxHeight * 0.12,
              child: FittedBox(
                child: Text(label),
              ),
            ),
          ],
        );
      },
    );
  }
}
