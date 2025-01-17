import 'dart:math';

import 'package:fintableapp/m/company_data.dart';
import 'package:fintableapp/v/company_detail.dart';
import 'package:flutter/material.dart';

class AllCompanies extends StatefulWidget {
  const AllCompanies({super.key});

  @override
  State<AllCompanies> createState() => _AllCompaniesState();
}

class _AllCompaniesState extends State<AllCompanies> {
  final List<CompanyData> _companies = [];
  @override
  void initState() {
    super.initState();
    _companies.addAll(_generateRandomCompanies(30));
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
    return ListView.builder(
      itemCount: _companies.length,
      itemBuilder: (context, index) {
        final company = _companies[index];
        return ListTile(
          title: Text(company.name),
          subtitle: Text('Target Price: ${company.targetPrice.toStringAsFixed(2)}'),
          trailing: Text('Return Potential: ${company.returnPotential.toStringAsFixed(2)}%'),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const CompanyDetail()));
          },
        );
      },
    );
  }
}
