import 'package:flutter/material.dart';

class DetailedData extends StatefulWidget {
  const DetailedData({super.key});

  @override
  State<DetailedData> createState() => _DetailedDataState();
}

class _DetailedDataState extends State<DetailedData> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Detaylı Bilgiler', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(width: 10),
            Icon(Icons.info_outline, color: Colors.grey),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Text('Piyasa Değeri', style: TextStyle(fontSize: 14, color: Colors.grey[300])),
            const Spacer(),
            const Text('164,29 Mr', style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Text('Volatilite', style: TextStyle(fontSize: 14, color: Colors.grey[300])),
            const Spacer(),
            const Text('3.75', style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Text('Devre Kesici Sayısı', style: TextStyle(fontSize: 14, color: Colors.grey[300])),
            const Spacer(),
            const Text('32', style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Text('Tarih', style: TextStyle(fontSize: 14, color: Colors.grey[300])),
            const Spacer(),
            const Text('15.12.2024', style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }
}
