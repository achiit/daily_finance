

import 'package:app8/add.dart';
import 'package:app8/profile.dart';
import 'package:app8/settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

class Transaction {
  final double amount;
  final String category;
  final String note;
  final DateTime date;

  Transaction({
    required this.amount,
    required this.category,
    required this.note,
    required this.date,
  });
}

class HomeScreen extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        amount: 1500.0,
        category: 'Salary',
        note: 'Monthly income',
        date: DateTime.now()),
    Transaction(
        amount: -200.0,
        category: 'Grocery',
        note: 'Weekly groceries',
        date: DateTime.now().subtract(Duration(days: 2))),
    Transaction(
        amount: -50.0,
        category: 'Food',
        note: 'Lunch with friends',
        date: DateTime.now().subtract(Duration(days: 3))),
    Transaction(
        amount: -100.0,
        category: 'Shopping',
        note: 'Clothes shopping',
        date: DateTime.now().subtract(Duration(days: 5))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Home'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // TODO: Handle show all transactions
                  },
                  child: Text('All'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // Set the button color to green
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Handle show daily transactions
                  },
                  child: Text('Daily'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // Set the button color to green
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Handle show weekly transactions
                  },
                  child: Text('Weekly'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // Set the button color to green
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Handle show monthly transactions
                  },
                  child: Text('Monthly'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // Set the button color to green
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('Income: ₹${calculateIncome().toStringAsFixed(2)}',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
            SizedBox(height: 10),
            Text('Expenses: ₹${calculateExpenses().toStringAsFixed(2)}',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
            SizedBox(height: 20),
            Text('Recent Transactions', style: TextStyle(fontSize: 22)),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(transactions[index].category),
                    subtitle: Text(
                        '₹${transactions[index].amount.toStringAsFixed(2)}'),
                    trailing: Text(
                        '${transactions[index].date.toLocal()}'.split(' ')[0]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => profile()));
              },
              icon: Icon(Icons.person),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => settings()));
                            },
              icon: Icon(Icons.settings),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddTransaction()));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  double calculateIncome() {
    return transactions
        .where((transaction) => transaction.amount > 0)
        .fold(0, (sum, transaction) => sum + transaction.amount);
  }

  double calculateExpenses() {
    return transactions
        .where((transaction) => transaction.amount < 0)
        .fold(0, (sum, transaction) => sum + transaction.amount);
  }
}




