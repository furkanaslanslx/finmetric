import 'dart:math';
import 'package:fintableapp/m/company_data.dart';
import 'package:fintableapp/v/company_detail.dart';
import 'package:flutter/material.dart';

class Predictions extends StatefulWidget {
  const Predictions({super.key});

  @override
  State<Predictions> createState() => _PredictionsState();
}

class _PredictionsState extends State<Predictions> {
  int _selectedTableIndex = 0;

  String? _analistSortColumn;
  bool _analistSortAscending = false;

  String? _temettuSortColumn;
  bool _temettuSortAscending = false;

  final List<CompanyData> _analistCompanies = [];
  final List<CompanyData> _temettuCompanies = [];

  @override
  void initState() {
    super.initState();
    _analistCompanies.addAll(_generateRandomCompanies(30));
    _temettuCompanies.addAll(_generateRandomCompanies(30));
  }

  List<CompanyData> _generateRandomCompanies(int count) {
    final random = Random();
    final companies = <CompanyData>[];
    for (int i = 0; i < count; i++) {
      final name = _randomName(random);
      final targetPrice = (random.nextDouble() * 500) + 1;
      final returnPotential = (random.nextDouble() * 110) - 10;

      companies.add(CompanyData(
        name: name,
        targetPrice: targetPrice,
        returnPotential: returnPotential,
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
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
                child: const Text('Analist Tahminleri', style: TextStyle(fontSize: 12)),
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
                child: const Text('Temettü Tahminleri', style: TextStyle(fontSize: 12)),
              ),
            ],
          ),
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            firstChild: _buildAnalistContent(),
            secondChild: _buildTemettuContent(),
            crossFadeState: _selectedTableIndex == 0 ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          ),
        ],
      ),
    );
  }

  Widget _buildAnalistContent() {
    final list = List<CompanyData>.from(_analistCompanies);

    if (_analistSortColumn != null) {
      list.sort((a, b) {
        if (_analistSortColumn == 'price') {
          return _analistSortAscending ? a.targetPrice.compareTo(b.targetPrice) : b.targetPrice.compareTo(a.targetPrice);
        } else if (_analistSortColumn == 'potential') {
          return _analistSortAscending ? a.returnPotential.compareTo(b.returnPotential) : b.returnPotential.compareTo(a.returnPotential);
        }
        return 0;
      });
    } else {
      list.sort((a, b) => b.returnPotential.compareTo(a.returnPotential));
    }

    final displayedList = list.take(5).toList();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Analist Tahminleri', style: TextStyle(fontWeight: FontWeight.bold)),
            Spacer(),
            Text('Tümü', style: TextStyle(fontWeight: FontWeight.bold)),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              const Expanded(
                flex: 1,
                child: Text(
                  'Şirket',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                ),
              ),
              Expanded(
                flex: 2,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      if (_analistSortColumn == 'price') {
                        _analistSortAscending = !_analistSortAscending;
                      } else {
                        _analistSortColumn = 'price';
                        _analistSortAscending = true;
                      }
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text('Hedef Fiyat', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
                      Icon(
                        _analistSortColumn == 'price' ? (_analistSortAscending ? Icons.arrow_drop_up : Icons.arrow_drop_down) : Icons.import_export,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      if (_analistSortColumn == 'potential') {
                        _analistSortAscending = !_analistSortAscending;
                      } else {
                        _analistSortColumn = 'potential';

                        _analistSortAscending = false;
                      }
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text('Getiri Potansiyeli', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
                      Icon(
                        _analistSortColumn == 'potential' ? (_analistSortAscending ? Icons.arrow_drop_up : Icons.arrow_drop_down) : Icons.import_export,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: displayedList.length,
          padding: const EdgeInsets.only(bottom: 8),
          itemBuilder: (context, index) {
            final company = displayedList[index];
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
                        '${company.targetPrice.toStringAsFixed(2)} TL',
                        textAlign: TextAlign.end,
                      ),
                    ),
                    Expanded(
                      flex: 100,
                      child: Text(
                        '${company.returnPotential.toStringAsFixed(2)}%',
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildTemettuContent() {
    final list = List<CompanyData>.from(_temettuCompanies);

    if (_temettuSortColumn != null) {
      list.sort((a, b) {
        if (_temettuSortColumn == 'price') {
          return _temettuSortAscending ? a.targetPrice.compareTo(b.targetPrice) : b.targetPrice.compareTo(a.targetPrice);
        } else if (_temettuSortColumn == 'potential') {
          return _temettuSortAscending ? a.returnPotential.compareTo(b.returnPotential) : b.returnPotential.compareTo(a.returnPotential);
        }
        return 0;
      });
    } else {
      list.sort((a, b) => b.returnPotential.compareTo(a.returnPotential));
    }

    final displayedList = list.take(5).toList();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Temettü Tahminleri', style: TextStyle(fontWeight: FontWeight.bold)),
            Spacer(),
            Text('Tümü', style: TextStyle(fontWeight: FontWeight.bold)),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              const Expanded(
                flex: 1,
                child: Text(
                  'Şirket',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                ),
              ),
              Expanded(
                flex: 2,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      if (_temettuSortColumn == 'price') {
                        _temettuSortAscending = !_temettuSortAscending;
                      } else {
                        _temettuSortColumn = 'price';
                        _temettuSortAscending = true;
                      }
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text('Hedef Fiyat', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
                      Icon(
                        _temettuSortColumn == 'price' ? (_temettuSortAscending ? Icons.arrow_drop_up : Icons.arrow_drop_down) : Icons.import_export,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      if (_temettuSortColumn == 'potential') {
                        _temettuSortAscending = !_temettuSortAscending;
                      } else {
                        _temettuSortColumn = 'potential';
                        _temettuSortAscending = false;
                      }
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text('Getiri Potansiyeli', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
                      Icon(
                        _temettuSortColumn == 'potential' ? (_temettuSortAscending ? Icons.arrow_drop_up : Icons.arrow_drop_down) : Icons.import_export,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: displayedList.length,
          padding: const EdgeInsets.only(bottom: 8),
          itemBuilder: (context, index) {
            final company = displayedList[index];
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
                        '${company.targetPrice.toStringAsFixed(2)} TL',
                        textAlign: TextAlign.end,
                      ),
                    ),
                    Expanded(
                      flex: 100,
                      child: Text(
                        '${company.returnPotential.toStringAsFixed(2)}%',
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
