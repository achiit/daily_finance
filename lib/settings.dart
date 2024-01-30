import 'package:flutter/material.dart';

class settings extends StatefulWidget {
  const settings({super.key});

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Settings'),
      ),
      body: SafeArea(child: Center(
        child: Column(
          children: [
            Container(
                  child: Row(
                    children: [

                      Text(
                        'Help',
                        style: TextStyle(fontSize: 15,),
                      ),
                    ],
                  ),
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(10),color: Colors.green,
                  ),
                  height: 40,
                  width: 550,
                ),
                SizedBox(
                  height: 30,
                  width: 20,
                ),
          ],
        ),
      )),
    );
  }
}