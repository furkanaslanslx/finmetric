import 'package:fintableapp/services/responsive_size.dart';
import 'package:fintableapp/v/investment_page.dart';
import 'package:fintableapp/v/widgets/company_detail/company_detail_header.dart';
import 'package:fintableapp/v/widgets/company_detail/company_graph.dart';
import 'package:fintableapp/v/widgets/company_detail/detailed_data.dart';
import 'package:fintableapp/v/widgets/company_detail/multipliers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompanyDetail extends StatefulWidget {
  const CompanyDetail({super.key});

  @override
  State<CompanyDetail> createState() => _CompanyDetailState();
}

class _CompanyDetailState extends State<CompanyDetail> {
  final ResponsiveSize _size = ResponsiveSize();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        backgroundColor: Colors.grey[900],
        leading: CupertinoNavigationBarBackButton(
          color: Colors.white,
          previousPageTitle: 'Geri Git',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.alarm, color: Colors.white, size: 24),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.star, color: Colors.white, size: 24),
            ),
          ],
        ),
      ),
      body: Center(
        child: SizedBox(
          width: _size.getWidth(context, 690),
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: const [
              SizedBox(height: 20.0),
              CompanyDetailHeader(),
              CompanyGraph(),
              DetailedData(),
              Multipliers(),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const InvestmentPage()));
        },
        backgroundColor: Colors.grey[900],
        icon: const Icon(CupertinoIcons.plus_circle, color: Colors.white),
        label: const Text('Yatırım Yap', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
