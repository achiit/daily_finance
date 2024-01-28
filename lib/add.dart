import 'package:flutter/material.dart';

class Transaction {
  final double amount;
  final String category;
  final String note;
  final DateTime date;

  Transaction(
      {required this.amount,
      required this.category,
      required this.note,
      required this.date});
}

class AddTransaction extends StatefulWidget {
  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  String _selectedCategory = 'Rent';
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Add Transaction',
          style: TextStyle(fontSize: 28),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Amount in Rupees:', style: TextStyle(fontSize: 25)),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            Text('Category:', style: TextStyle(fontSize: 25)),
            DropdownButton<String>(
              value: _selectedCategory,
              onChanged: (String? value) {
                setState(() {
                  _selectedCategory = value!;
                });
              },
              items: [
                'Rent',
                'Electricity Bill',
                'Mobile Recharge',
                'Grocery',
                'Wifi Recharge',
                'Food',
                'Stationary',
                'Transport',
                'Healthcare',
                'Shopping',
                'Entertainment',
                'Others',
              ]
                  .map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: 16),
            Text('Date:', style: TextStyle(fontSize: 25)),
            Row(
              children: [
                Text('${_selectedDate.toLocal()}'.split(' ')[0]),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: Text('Select Date', style: TextStyle(fontSize: 20)),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // Set the button color to green
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text('Note:', style: TextStyle(fontSize: 25)),
            TextField(
              controller: _noteController,
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // TODO: Handle Cancel logic
                    Navigator.pop(context);
                  },
                  child: Text('Cancel', style: TextStyle(fontSize: 25)),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // Set the button color to green
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Handle Add Transaction logic
                    double amount =
                        double.tryParse(_amountController.text) ?? 0.0;
                    String note = _noteController.text;

                    Transaction newTransaction = Transaction(
                      amount: amount,
                      category: _selectedCategory,
                      note: note,
                      date: _selectedDate,
                    );

                    // For now, we'll just print the transaction details
                    print('New Transaction: $newTransaction');

                    Navigator.pop(context);
                  },
                  child:
                      Text('Add Transaction', style: TextStyle(fontSize: 25)),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // Set the button color to green
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
