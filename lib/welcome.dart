import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  late TooltipBehavior _tooltipBehavior;
  @override
  void initState(){
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  final List<ChartData> assetData = <ChartData>[
  ChartData('Jan', 150000, Colors.green),
  ChartData('Feb', 200000, Colors.red),
  ChartData('Mar', 180000, Colors.green),
  ChartData('Apr', 400000, Colors.red),
  ChartData('May', 350000, Colors.red)
  ];

  final List<ChartData> liabilityData = <ChartData>[
    ChartData('Jan', 600000, Colors.green),
    ChartData('Feb', 500000, Colors.green),
    ChartData('Mar', 400000, Colors.green),
    ChartData('Apr', 200000, Colors.green),
    ChartData('May', 200000, Colors.green)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        title: const Text('Finance App'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
          child: Container(
              child: SfCartesianChart(

                  primaryXAxis: CategoryAxis(),
                  // Chart title
                  title: ChartTitle(text: 'Asset & Liability Analysis'),
                  // Enable legend
                  legend: Legend(
                      isVisible: true,
                      // Border color and border width of legend
                      borderColor: Colors.black,
                      borderWidth: 2
                  ),
                  // Enable tooltip
                  tooltipBehavior: _tooltipBehavior,

                  series: <CartesianSeries>[
                    LineSeries<ChartData, String>(
                        name:'Asset',
                        dataSource:  assetData,
                        pointColorMapper:(ChartData asset, _) => asset.segmentColor,
                        xValueMapper: (ChartData asset, _) => asset.year,
                        yValueMapper: (ChartData asset, _) => asset.amount,
                        // Enable data label
                        dataLabelSettings: DataLabelSettings(isVisible: true)
                    ),
                    LineSeries<ChartData, String>(
                        name:'Liability',
                        dataSource:  liabilityData,
                        pointColorMapper:(ChartData asset, _) => asset.segmentColor,
                        xValueMapper: (ChartData asset, _) => asset.year,
                        yValueMapper: (ChartData asset, _) => asset.amount,
                        // Enable data label
                        dataLabelSettings: DataLabelSettings(isVisible: true)
                    )
                  ]
              )
          )
      ),
    );
  }
}

class ChartData {
  ChartData(this.year, this.amount, this.segmentColor);
  final String year;
  final double amount;
  final Color segmentColor;
}
