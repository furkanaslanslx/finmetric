import 'package:flutter/material.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

class DailyBulletins extends StatefulWidget {
  const DailyBulletins({super.key});

  @override
  State<DailyBulletins> createState() => _DailyBulletinsState();
}

class _DailyBulletinsState extends State<DailyBulletins> {
  int _selectedTableIndex = 0;
  final List<Map<String, String>> _capNews = [];
  final List<Map<String, String>> _dailyBulletins = [];

  @override
  void initState() {
    super.initState();
    // Dummy data for _capNews
    _capNews.addAll(List.generate(
      10,
      (index) => {
        'name': loremIpsum(words: 4),
        'date': '2024-12-${10 + index}',
      },
    ));

    // Dummy data for _dailyBulletins
    _dailyBulletins.addAll(List.generate(
      10,
      (index) => {
        'name': loremIpsum(words: 4),
        'date': '2024-11-${15 + index}',
      },
    ));
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
              child: const Text('Kap Haberleri', style: TextStyle(fontSize: 12)),
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
              child: const Text('Günlük Bültenler', style: TextStyle(fontSize: 12)),
            ),
          ],
        ),
        const SizedBox(height: 10),
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 300),
          firstChild: _buildCapNewsContent(),
          secondChild: _buildDailyBulletinsContent(),
          crossFadeState: _selectedTableIndex == 0 ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        ),
      ],
    );
  }

  Widget _buildCapNewsContent() {
    return Column(
      children: [
        const Row(
          children: [
            Text('Kap Haberleri'),
            Spacer(),
            Text('Tümü', style: TextStyle(fontWeight: FontWeight.bold)),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
        const SizedBox(height: 10),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(0),
          itemCount: 7,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return ListTile(
              minVerticalPadding: 0,
              dense: true,
              visualDensity: const VisualDensity(vertical: -4),
              contentPadding: const EdgeInsets.all(0),
              leading: const CircleAvatar(backgroundColor: Colors.blue),
              title: Text(_capNews[index]['name']!),
              subtitle: Text(_capNews[index]['date']!),
            );
          },
        ),
      ],
    );
  }

  Widget _buildDailyBulletinsContent() {
    return Column(
      children: [
        const Row(
          children: [
            Text('Günlük Bültenler'),
            Spacer(),
            Text('Tümü', style: TextStyle(fontWeight: FontWeight.bold)),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
        const SizedBox(height: 10),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(0),
          itemCount: 7,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return ListTile(
              minVerticalPadding: 0,
              dense: true,
              visualDensity: const VisualDensity(vertical: -4),
              contentPadding: const EdgeInsets.all(0),
              leading: const CircleAvatar(backgroundColor: Colors.blue),
              title: Text(_dailyBulletins[index]['name']!),
              subtitle: Text(_dailyBulletins[index]['date']!),
            );
          },
        ),
      ],
    );
  }
}
