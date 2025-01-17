import 'package:fintableapp/v/companies.dart';
import 'package:fintableapp/v/home_view.dart';
import 'package:fintableapp/v/portfolio.dart';
import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  late List<Widget> _widgetOptions;
  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      const HomeView(),
      const Companies(),
      const Portfolio(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          // const HomeView(),
          IndexedStack(
            index: _selectedIndex,
            children: _widgetOptions,
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                height: 70,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = 0;
                          });
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.home, color: _selectedIndex == 0 ? Colors.white : Colors.grey),
                            Text(
                              'Anasayfa',
                              style: TextStyle(
                                color: _selectedIndex == 0 ? Colors.white : Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              height: 3,
                              width: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2.0),
                                color: _selectedIndex == 0 ? Colors.white : Colors.transparent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = 1;
                          });
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.corporate_fare, color: _selectedIndex == 1 ? Colors.white : Colors.grey),
                            Text(
                              'Şirketler',
                              style: TextStyle(
                                color: _selectedIndex == 1 ? Colors.white : Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              height: 3,
                              width: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: _selectedIndex == 1 ? Colors.white : Colors.transparent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = 2;
                          });
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.account_balance_wallet, color: _selectedIndex == 2 ? Colors.white : Colors.grey),
                            Text(
                              'Portföy',
                              style: TextStyle(
                                color: _selectedIndex == 2 ? Colors.white : Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              height: 3,
                              width: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: _selectedIndex == 2 ? Colors.white : Colors.transparent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
