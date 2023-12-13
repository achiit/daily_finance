import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';




class DashboardScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Collection Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Daily Collection: \$500', // Replace with your actual daily collection data
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Total Collection: \$5000', // Replace with your actual total collection data
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Borrowers Count: 20', // Replace with your actual borrowers count data
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Collection Percentage:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            PieChart(
              PieChartData(
                sections: [
                  PieChartSectionData(
                    color: Colors.blue,
                    value: 30, // Replace with your actual data
                    title: '30%',
                  ),
                  PieChartSectionData(
                    color: Colors.green,
                    value: 40, // Replace with your actual data
                    title: '40%',
                  ),
                  PieChartSectionData(
                    color: Colors.orange,
                    value: 30, // Replace with your actual data
                    title: '30%',
                  ),
                ],
                borderData: FlBorderData(show: false),
                centerSpaceRadius: 40,
                sectionsSpace: 0,
                pieTouchData: PieTouchData(touchCallback: (FlTouchEvent event, touchController) {}),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
