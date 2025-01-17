import 'dart:math';

import 'package:fintableapp/m/company_data.dart';
import 'package:fintableapp/v/company_detail.dart';
import 'package:flutter/material.dart';

class BalanceSheets extends StatefulWidget {
  const BalanceSheets({super.key});

  @override
  State<BalanceSheets> createState() => _BalanceSheetsState();
}

class _BalanceSheetsState extends State<BalanceSheets> {
  int _selectedTableIndex = 0;
  final List<CompanyData> _bilancoCompanies = [];
  final List<CompanyData> _halkaArzCompanies = [];

  @override
  void initState() {
    super.initState();
    _bilancoCompanies.addAll(_generateRandomCompanies(30));
    _halkaArzCompanies.addAll(_generateRandomCompanies(30));
  }

  List<CompanyData> _generateRandomCompanies(int count) {
    final random = Random();
    final companies = <CompanyData>[];

    for (int i = 0; i < count; i++) {
      final name = _randomName(random);
      final targetPrice = (random.nextDouble() * 500) + 1;
      final returnPotential = (random.nextDouble() * 110) - 10;

      final aciklanmaTarihi = '${random.nextInt(30) + 1}/${random.nextInt(12) + 1}/${random.nextInt(10) + 2020}';

      final aciklananDonem = '${random.nextInt(10) + 2015}/${random.nextInt(12) + 1}';

      companies.add(CompanyData(
        name: name,
        targetPrice: targetPrice,
        returnPotential: returnPotential,
        aciklanmaTarihi: aciklanmaTarihi,
        aciklananDonem: aciklananDonem,
      ));
    }

    return companies;
  }

  String _randomName(Random random) {
    const letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

    String result = '';
    for (int i = 0; i < 5; i++) {
      result += letters[random.nextInt(letters.length)];
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 10.0)),
                backgroundColor: WidgetStateProperty.all(Colors.grey[900]),
                foregroundColor: WidgetStateProperty.all(Colors.white),
                side: WidgetStateProperty.all(
                  BorderSide(color: _selectedTableIndex == 0 ? Colors.grey : Colors.transparent),
                ),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
              onPressed: () {
                setState(() {
                  _selectedTableIndex = 0;
                });
              },
              child: const Text('Son Bilançolar', style: TextStyle(fontSize: 12)),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              style: ButtonStyle(
                padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 10.0)),
                backgroundColor: WidgetStateProperty.all(Colors.grey[900]),
                foregroundColor: WidgetStateProperty.all(Colors.white),
                side: WidgetStateProperty.all(
                  BorderSide(color: _selectedTableIndex == 1 ? Colors.grey : Colors.transparent),
                ),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
              onPressed: () {
                setState(() {
                  _selectedTableIndex = 1;
                });
              },
              child: const Text('Son Halka Arzlar', style: TextStyle(fontSize: 12)),
            ),
          ],
        ),
        const SizedBox(height: 10),
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 300),
          firstChild: _buildBilancoContent(),
          secondChild: _buildHalkaArzContent(),
          crossFadeState: _selectedTableIndex == 0 ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        ),
      ],
    );
  }

  Widget _buildBilancoContent() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 8),
      itemCount: 7 + 2,
      itemBuilder: (context, index) {
        if (index == 0) {
          return const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Son Bilançolar', style: TextStyle(fontWeight: FontWeight.bold)),
              Spacer(),
              Text('Tümü', style: TextStyle(fontWeight: FontWeight.bold)),
              Icon(Icons.arrow_forward_ios),
            ],
          );
        }
        if (index == 1) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Şirket',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Açıklanma Tarihi',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Açıklanan Dönem',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        final company = _bilancoCompanies[index - 2];
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const CompanyDetail()));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
            child: Row(
              children: [
                Expanded(
                  flex: 77,
                  child: Row(
                    children: [
                      const CircleAvatar(backgroundColor: Colors.blue, radius: 12),
                      const SizedBox(width: 8),
                      Text(company.name),
                    ],
                  ),
                ),
                Expanded(
                  flex: 100,
                  child: Text(
                    '${company.aciklanmaTarihi}',
                    textAlign: TextAlign.end,
                  ),
                ),
                Expanded(
                  flex: 100,
                  child: Text(
                    '${company.aciklananDonem}',
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHalkaArzContent() {
    final random = Random();
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 8),
      itemCount: 7 + 2,
      itemBuilder: (context, index) {
        if (index == 0) {
          return const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Son Bilançolar', style: TextStyle(fontWeight: FontWeight.bold)),
              Spacer(),
              Text('Tümü', style: TextStyle(fontWeight: FontWeight.bold)),
              Icon(Icons.arrow_forward_ios),
            ],
          );
        }
        if (index == 1) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Şirket',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Talep Top. Tarihi',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Halka Arz Durumu',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        final company = _bilancoCompanies[index - 2];
        final bool isHalkaArz = random.nextBool();
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const CompanyDetail()));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
            child: Row(
              children: [
                Expanded(
                  flex: 77,
                  child: Row(
                    children: [
                      const CircleAvatar(backgroundColor: Colors.blue, radius: 12),
                      const SizedBox(width: 8),
                      Text(company.name),
                    ],
                  ),
                ),
                Expanded(
                  flex: 100,
                  child: Text(
                    '${company.aciklanmaTarihi}',
                    textAlign: TextAlign.end,
                  ),
                ),
                Expanded(
                  flex: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        isHalkaArz ? Icons.check : Icons.close,
                        color: isHalkaArz ? Colors.green : Colors.red,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
