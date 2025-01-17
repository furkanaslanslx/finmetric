import 'package:fintableapp/services/responsive_size.dart';
import 'package:fintableapp/v/widgets/home_view/daily_bulletins.dart';
import 'package:fintableapp/v/widgets/home_view/market_summary.dart';
import 'package:fintableapp/v/widgets/home_view/balance_sheets.dart';
import 'package:fintableapp/v/widgets/my_app_bar.dart';
import 'package:fintableapp/v/widgets/home_view/predictions.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ResponsiveSize _size = ResponsiveSize();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            width: _size.getWidth(context, 670),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: _size.getHeight(context, 20)),
                const MarketSummary(),
                const Predictions(),
                const BalanceSheets(),
                const DailyBulletins(),
                SizedBox(height: _size.getHeight(context, 200)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
