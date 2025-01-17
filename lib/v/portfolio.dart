import 'dart:math';

import 'package:fintableapp/v/login.dart';
import 'package:fintableapp/v/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:mrx_charts/mrx_charts.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({super.key});

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20.0),
              SizedBox(
                width: 300.0,
                height: 300.0,
                child: Chart(
                  layers: [
                    ChartGroupPieLayer(
                      items: List.generate(
                        3,
                        (index) => List.generate(
                          Random().nextInt(4) + 2,
                          (index) => ChartGroupPieDataItem(
                            amount: Random().nextInt(300) * Random().nextDouble(),
                            color: [
                              Colors.orangeAccent,
                              Colors.pinkAccent,
                              Colors.redAccent,
                              Colors.blueAccent,
                              Colors.cyanAccent,
                              Colors.tealAccent,
                            ][Random().nextInt(6)],
                            label: [
                              'Life',
                              'Work',
                              'Medicine',
                              'Bills',
                              'Hobby',
                              'Holiday',
                            ][Random().nextInt(6)],
                          ),
                        ),
                      ),
                      settings: const ChartGroupPieSettings(),
                    ),
                    ChartTooltipLayer(
                      shape: () => ChartTooltipPieShape<ChartGroupPieDataItem>(
                        onTextName: (item) => item.label,
                        onTextValue: (item) => '€${item.amount.toString()}',
                        radius: 10.0,
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.all(12.0),
                        nameTextStyle: const TextStyle(
                          color: Color(0xFF8043F9),
                          fontWeight: FontWeight.w700,
                          height: 1.47,
                          fontSize: 12.0,
                        ),
                        valueTextStyle: const TextStyle(
                          color: Color(0xFF1B0E41),
                          fontWeight: FontWeight.w700,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40.0),
              const Text(
                'Giriş Yapın\nPortföyünüzü Görüntüleyin',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Giriş Yap', style: TextStyle(fontSize: 16, color: Colors.orange)),
                    Icon(Icons.arrow_forward_ios, color: Colors.orange),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
