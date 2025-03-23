import 'package:fintableapp/v/widgets/trading_view_detail.dart';
import 'package:fintableapp/v/widgets/trading_view_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InvestmentPage extends StatefulWidget {
  const InvestmentPage({super.key});

  @override
  State<InvestmentPage> createState() => _InvestmentPageState();
}

class _InvestmentPageState extends State<InvestmentPage> {
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
        // trailing: Row(
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     IconButton(
        //       onPressed: () {},
        //       icon: const Icon(CupertinoIcons.alarm, color: Colors.white, size: 24),
        //     ),
        //     IconButton(
        //       onPressed: () {},
        //       icon: const Icon(CupertinoIcons.star, color: Colors.white, size: 24),
        //     ),
        //   ],
        // ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 400,
            child: TradingViewWidget(symbol: 'BIST:TTKOM'),
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                const TradingViewDetail(symbol: 'BIST:TTKOM'),
                Container(
                  width: double.infinity,
                  height: 33,
                  color: Colors.grey[900],
                ),
              ],
            ),
          ),
          const SizedBox(height: 100),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              minimumSize: const Size(150, 30),
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
            ),
            child: const Text('AL'),
          ),
          const SizedBox(width: 20),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              minimumSize: const Size(150, 30),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('SAT'),
          ),
        ],
      ),
    );
  }
}
