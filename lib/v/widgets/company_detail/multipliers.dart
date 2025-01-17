import 'package:flutter/material.dart';

class Multipliers extends StatelessWidget {
  const Multipliers({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Günlük Çarpanlar', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(width: 10),
            Icon(Icons.info_outline, color: Colors.grey),
            Spacer(),
            Text('15.12.2024', style: TextStyle(fontWeight: FontWeight.normal)),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              flex: 100,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text('F/K Oranı', style: TextStyle(fontSize: 12, color: Colors.grey[500])),
                      const Spacer(),
                      const Text('6.40', style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text('PD/DD Oranı', style: TextStyle(fontSize: 12, color: Colors.grey[500])),
                      const Spacer(),
                      const Text('1.22', style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 10,
              child: Center(
                child: Container(
                  width: 2,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 100,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text('FD/FAVÖK Oranı', style: TextStyle(fontSize: 12, color: Colors.grey[500])),
                      const Spacer(),
                      const Text('4.10', style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text('PEG', style: TextStyle(fontSize: 12, color: Colors.grey[500])),
                      const Spacer(),
                      const Text('0.01', style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Çeyreklik Çarpanlar', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(width: 10),
            Icon(Icons.info_outline, color: Colors.grey),
            Spacer(),
            Text('09/2024', style: TextStyle(fontWeight: FontWeight.normal)),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              flex: 100,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text('F/K Oranı', style: TextStyle(fontSize: 12, color: Colors.grey[500])),
                      const Spacer(),
                      const Text('6.79', style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text('PD/DD Oranı', style: TextStyle(fontSize: 12, color: Colors.grey[500])),
                      const Spacer(),
                      const Text('1.29', style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 10,
              child: Center(
                child: Container(
                  width: 2,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 100,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text('FD/FAVÖK Oranı', style: TextStyle(fontSize: 12, color: Colors.grey[500])),
                      const Spacer(),
                      const Text('4.28', style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text('PEG', style: TextStyle(fontSize: 12, color: Colors.grey[500])),
                      const Spacer(),
                      const Text('0.01', style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Özet Gelir Tablosu', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(width: 10),
            Icon(Icons.info_outline, color: Colors.grey),
            Spacer(),
            Text('09/2024', style: TextStyle(fontWeight: FontWeight.normal)),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              flex: 100,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text('Satışlar', style: TextStyle(fontSize: 12, color: Colors.grey[500])),
                      const Spacer(),
                      const Text('109,23 Mr', style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text('Brüt Kar', style: TextStyle(fontSize: 12, color: Colors.grey[500])),
                      const Spacer(),
                      const Text('34,31 Mr', style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 10,
              child: Center(
                child: Container(
                  width: 2,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 100,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text('FAVÖK', style: TextStyle(fontSize: 12, color: Colors.grey[500])),
                      const Spacer(),
                      const Text('41,51 Mr', style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text('Esas Faaliyet Karı', style: TextStyle(fontSize: 12, color: Colors.grey[500])),
                      const Spacer(),
                      const Text('8,39 Mr', style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              flex: 100,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text('Dönen Varlıklar', style: TextStyle(fontSize: 12, color: Colors.grey[500])),
                      const Spacer(),
                      const Text('54,63 Mr', style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text('Duran Varlıklar', style: TextStyle(fontSize: 12, color: Colors.grey[500])),
                      const Spacer(),
                      const Text('188,64 Mr', style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 10,
              child: Center(
                child: Container(
                  width: 2,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 100,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text('Finansal Borçlar', style: TextStyle(fontSize: 12, color: Colors.grey[500])),
                      const Spacer(),
                      const Text('71,66 Mr', style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text('Net Borç', style: TextStyle(fontSize: 12, color: Colors.grey[500])),
                      const Spacer(),
                      const Text('53,86 Mr', style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 100,
              child: Row(
                children: [
                  Text('Net Dönem Karı', style: TextStyle(fontSize: 12, color: Colors.grey[500])),
                  const Spacer(),
                  const Text('3,92 Mr', style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Expanded(
              flex: 10,
              child: Center(
                child: Container(
                  width: 2,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 100,
              child: Row(
                children: [
                  Text('Özkaynaklar', style: TextStyle(fontSize: 12, color: Colors.grey[500])),
                  const Spacer(),
                  const Text('135,06 Mr', style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
