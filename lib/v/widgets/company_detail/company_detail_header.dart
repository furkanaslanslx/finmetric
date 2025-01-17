import 'package:flutter/material.dart';

class CompanyDetailHeader extends StatefulWidget {
  const CompanyDetailHeader({super.key});

  @override
  State<CompanyDetailHeader> createState() => _CompanyDetailHeaderState();
}

class _CompanyDetailHeaderState extends State<CompanyDetailHeader> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.blue,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '46,94',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  'TTKOM',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text('TÜRK TELEKOMÜNİKASYON A.Ş.', style: TextStyle(fontSize: 10, color: Colors.grey)),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '%2,35',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.green),
                ),
                Text('05:46:05', style: TextStyle(fontSize: 10, color: Colors.grey)),
              ],
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Text('Açılış', style: TextStyle(fontSize: 12, color: Colors.white)),
                  Text('45,80', style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Text('Yüksek', style: TextStyle(fontSize: 12, color: Colors.white)),
                  Text('46,94', style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Text('Düşük', style: TextStyle(fontSize: 12, color: Colors.white)),
                  Text('45,22', style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Text('Top. Hac.', style: TextStyle(fontSize: 12, color: Colors.white)),
                  Text('1,16 Mr', style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Text('Önc. Kap.', style: TextStyle(fontSize: 12, color: Colors.white)),
                  Text('45.88', style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
