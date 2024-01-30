import 'package:flutter/material.dart';

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

  Future<void> _selectCategory(BuildContext context) async {
    // Show the modal bottom sheet to select a category
    final String? selectedCategory = await showModalBottomSheet<String>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Select a Category',
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(height: 16.0),
              Wrap(
                spacing: 8.0, // Adjust spacing as needed
                runSpacing: 8.0,
                children: [
                  CategoryButton(category: 'Food'),
                  CategoryButton(category: 'Transport'),
                  CategoryButton(category: 'Mobile Recharge'),
                  CategoryButton(category: 'WiFi Bill'),
                  CategoryButton(category: 'Healthcare'),
                  CategoryButton(category: 'Grocery'),
                  CategoryButton(category: 'Hotel'),
                  CategoryButton(category: 'Shopping'),
                ],
              ),
            ],
          ),
        );
      },
    );

    if (selectedCategory != null) {
      setState(() {
        _selectedCategory = selectedCategory;
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Amount in Rupees:', style: TextStyle(fontSize: 25)),
              TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(
                        8.0), // Optional: add rounded corners
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text('Category:', style: TextStyle(fontSize: 25)),
              ElevatedButton(
                onPressed: () => _selectCategory(context),
                child: Text(_selectedCategory),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green, // Set the button color to green
                ),
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
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(
                        8.0), // Optional: add rounded corners
                  ),
                ),
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
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String category;

  CategoryButton({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green, // Set the background color to green
        borderRadius:
            BorderRadius.circular(8.0), // Optional: add rounded corners
      ),
      child: ElevatedButton(
        onPressed: () {
          // Close the bottom sheet and pass the selected category
          Navigator.pop(context, category);
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.green, // Set the button color to transparent
        ),
        child: Text(
          category,
          style: TextStyle(color: Colors.white), // Set text color to white
        ),
      ),
    );
  }
}
