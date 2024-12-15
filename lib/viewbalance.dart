import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ViewBalanceAvailable extends StatelessWidget {
  double balance2;
  ViewBalanceAvailable({super.key, required this.balance2});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Balance'),
          const SizedBox(
            height: 20,
          ),
          Text(
            '\$ ${NumberFormat.simpleCurrency(name: '').format(balance2)}',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
