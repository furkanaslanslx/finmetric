import 'package:fintableapp/services/responsive_size.dart';
import 'package:fintableapp/v/login.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final List<String> themeModes = ['Açık Tema', 'Koyu Tema', 'Sistem Teması'];
  final ResponsiveSize _size = ResponsiveSize();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey[900],
      child: Padding(
        padding: EdgeInsets.only(top: _size.getHeight(context, 100), left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Ayarlar',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
                  },
                  child: const Row(
                    children: [
                      Text('Giriş Yap', style: TextStyle(fontSize: 16, color: Colors.orange)),
                      Icon(Icons.arrow_forward_ios, color: Colors.orange),
                    ],
                  ),
                ),
              ],
            ),
            Card(
              margin: const EdgeInsets.only(top: 16.0),
              color: Colors.grey[800],
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.workspace_premium, color: Colors.white),
                    SizedBox(width: 8),
                    Text('Premium Üye Ol', style: TextStyle(fontSize: 16, color: Colors.white)),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios, color: Colors.orange),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Genel Ayarlar', style: TextStyle(fontSize: 16, color: Colors.white)),
            Card(
              margin: const EdgeInsets.only(top: 16.0),
              color: Colors.grey[800],
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.color_lens, color: Colors.white),
                        SizedBox(width: 8),
                        Text('Görünüm', style: TextStyle(fontSize: 16, color: Colors.white)),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios, color: Colors.orange),
                      ],
                    ),
                    Divider(color: Colors.grey),
                    Row(
                      children: [
                        Icon(Icons.language, color: Colors.white),
                        SizedBox(width: 8),
                        Text('Bölge Dili', style: TextStyle(fontSize: 16, color: Colors.white)),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios, color: Colors.orange),
                      ],
                    ),
                    Divider(color: Colors.grey),
                    Row(
                      children: [
                        Icon(Icons.notifications, color: Colors.white),
                        SizedBox(width: 8),
                        Text('Bildirimler', style: TextStyle(fontSize: 16, color: Colors.white)),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios, color: Colors.orange),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Destek', style: TextStyle(fontSize: 16, color: Colors.white)),
            Card(
              margin: const EdgeInsets.only(top: 16.0),
              color: Colors.grey[800],
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.support_agent, color: Colors.white),
                        SizedBox(width: 8),
                        Text('Bize Ulaşın', style: TextStyle(fontSize: 16, color: Colors.white)),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios, color: Colors.orange),
                      ],
                    ),
                    Divider(color: Colors.grey),
                    Row(
                      children: [
                        Icon(Icons.live_help, color: Colors.white),
                        SizedBox(width: 8),
                        Text('Sık Sorulan Sorular', style: TextStyle(fontSize: 16, color: Colors.white)),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios, color: Colors.orange),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Diğer', style: TextStyle(fontSize: 16, color: Colors.white)),
            Card(
              margin: const EdgeInsets.only(top: 16.0),
              color: Colors.grey[800],
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.menu_book, color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          'FinTableApp Blog',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios, color: Colors.orange),
                      ],
                    ),
                    Divider(color: Colors.grey),
                    Row(
                      children: [
                        Icon(Icons.lock, color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          'Gizlilik Politikası',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios, color: Colors.orange),
                      ],
                    ),
                    Divider(color: Colors.grey),
                    Row(
                      children: [
                        Icon(Icons.description, color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          'Şartlar ve Koşullar',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios, color: Colors.orange),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
