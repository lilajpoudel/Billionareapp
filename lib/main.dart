import 'package:billionaireapp/add_money.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'viewbalance.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double balance = 0;
  void addmoney() async {
    setState(() {
      balance = balance + 500;
      print(balance);
    });
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('balance', balance);
  }

  @override
  void initState() {
    loadbalance();
    super.initState();
  }

  void loadbalance() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      balance = prefs.getDouble('balance') ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          //backgroundColor: Colors.red,
          centerTitle: true,
          title: const Text('Billionaireapp'),
        ),
        body: Container(
          color: Colors.blueGrey[700],
          padding: const EdgeInsets.all(20),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ViewBalanceAvailable(
                balance2: balance,
              ),
              AddMoneyButton(
                addmoneyfunction: addmoney,
              )
            ],
          ),
        ),
      ),
    );
  }
}
