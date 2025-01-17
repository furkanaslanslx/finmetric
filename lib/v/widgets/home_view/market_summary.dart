import 'package:fintableapp/services/responsive_size.dart';
import 'package:flutter/material.dart';

class MarketItem {
  final String name;
  final String value;
  final String change;

  MarketItem({required this.name, required this.value, required this.change});
}

class MarketSummary extends StatefulWidget {
  const MarketSummary({super.key});

  @override
  State<MarketSummary> createState() => _MarketSummaryState();
}

class _MarketSummaryState extends State<MarketSummary> {
  final ResponsiveSize _size = ResponsiveSize();

  // Piyasa verilerini depolamak için liste
  final List<MarketItem> marketItems = [
    MarketItem(name: 'XU100', value: '9.873,44', change: '2,02%'),
    MarketItem(name: 'EUR/TRY', value: '36,59', change: '0,26%'),
    MarketItem(name: 'XU50', value: '10.899,46', change: '2,41%'),
    MarketItem(name: 'USD/TRY', value: '34,75', change: '0,08%'),
    MarketItem(name: 'XU30', value: '8.737,85', change: '2,16%'),
    MarketItem(name: 'ALTIN/ONS', value: '2.646,91', change: '0,36%'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Market Özet', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text('Detaylı Görünüm'),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: _size.getWidth(context, 600),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: marketItems.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(bottom: _size.getHeight(context, 20)),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              mainAxisExtent: 51,
            ),
            itemBuilder: (context, index) {
              final item = marketItems[index];
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    item.value,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Text(
                    item.change,
                    style: TextStyle(
                      fontSize: 12,
                      color: item.change.contains('-') ? Colors.red : Colors.green,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
