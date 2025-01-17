import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mrx_charts/mrx_charts.dart';
import 'package:intl/intl.dart';

class CompanyGraph extends StatefulWidget {
  const CompanyGraph({super.key});

  @override
  State<CompanyGraph> createState() => _CompanyGraphState();
}

class _CompanyGraphState extends State<CompanyGraph> {
  int _selectedIndex = 0;
  List labels = ['1G', '1H', '1A', '3A', '6A', '1Y'];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          children: [
            ...List.generate(
              labels.length,
              (index) {
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          color: _selectedIndex == index ? Colors.blue : Colors.transparent,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(labels[index]),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 200.0,
          child: Chart(
            layers: layers(),
            padding: const EdgeInsets.symmetric(horizontal: 20.0).copyWith(
              bottom: 0.0,
            ),
          ),
        ),
      ],
    );
  }

  List<ChartLayer> layers() {
    final from = DateTime(2021, 4);
    final to = DateTime(2022, 4);
    final frequency = (to.millisecondsSinceEpoch - from.millisecondsSinceEpoch) / 13.0;
    return [
      ChartHighlightLayer(
        shape: () => ChartHighlightLineShape<ChartLineDataItem>(
          backgroundColor: Colors.blueAccent.withOpacity(0.3),
          currentPos: (item) => item.currentValuePos,
          radius: const BorderRadius.all(Radius.circular(8.0)),
          width: 30.0,
        ),
      ),
      ChartAxisLayer(
        settings: ChartAxisSettings(
          x: ChartAxisSettingsAxis(
            frequency: frequency,
            max: to.millisecondsSinceEpoch.toDouble(),
            min: from.millisecondsSinceEpoch.toDouble(),
            textStyle: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 10.0,
            ),
          ),
          y: ChartAxisSettingsAxis(
            frequency: 10.0,
            max: 70.0,
            min: 0.0,
            textStyle: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 10.0,
            ),
          ),
        ),
        labelX: (value) => DateFormat('MMM').format(DateTime.fromMillisecondsSinceEpoch(value.toInt())),
        labelY: (value) => '${value.toInt().toString()} TL',
      ),
      ChartLineLayer(
        items: List.generate(
          15,
          (index) => ChartLineDataItem(
            x: (index * frequency) + from.millisecondsSinceEpoch,
            value: Random().nextInt(30) + 20,
          ),
        ),
        settings: const ChartLineSettings(
          color: Colors.blue,
          thickness: 2.0,
        ),
      ),
      ChartTooltipLayer(
        shape: () => ChartTooltipLineShape<ChartLineDataItem>(
          backgroundColor: Colors.white,
          circleBackgroundColor: Colors.white,
          circleBorderColor: Colors.blueAccent,
          circleSize: 4.0,
          circleBorderThickness: 2.0,
          currentPos: (item) => item.currentValuePos,
          onTextValue: (item) => '${item.value.toString()} TL',
          marginBottom: 6.0,
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 8.0,
          ),
          radius: 6.0,
          textStyle: const TextStyle(
            color: Colors.blueAccent,
            letterSpacing: 0.2,
            fontSize: 14.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ];
  }
}
