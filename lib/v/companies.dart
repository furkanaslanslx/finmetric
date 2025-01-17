import 'package:flutter/material.dart';
import 'package:fintableapp/v/widgets/my_app_bar.dart';
import 'widgets/companies/all_companies.dart';

class Companies extends StatelessWidget {
  const Companies({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: const MyAppBar(),
        body: Column(
          children: [
            TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey[600],
              indicatorColor: Colors.white,
              tabs: const [
                Tab(text: 'Şirketler'),
                Tab(text: 'Favorilerim'),
                Tab(text: 'Top 5'),
                Tab(text: 'Alarmlarım'),
              ],
            ),
            const Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  AllCompanies(),
                  Placeholder(),
                  Placeholder(),
                  Placeholder(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
