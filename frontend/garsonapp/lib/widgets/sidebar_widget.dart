import 'package:flutter/material.dart';
import '../screens/login_screen.dart';

class SidebarWidget extends StatelessWidget {
  final String userName;
  final String userEmail;
  final String userAvatar;
  final bool isBusinessAccount;

  const SidebarWidget({
    Key? key,
    required this.userName,
    required this.userEmail,
    required this.userAvatar,
    this.isBusinessAccount = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFF161A30),
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFF1D2139),
              ),
              accountName: Text(
                userName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(userEmail),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(userAvatar),
              ),
            ),
            
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  // Profil Menü Öğesi
                  ListTile(
                    leading: const Icon(Icons.person, color: Colors.white),
                    title: const Text(
                      'Profilim',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      // Profil sayfasına yönlendirme yapılabilir
                    },
                  ),
                  
                  // Ayarlar Menü Öğesi
                  ListTile(
                    leading: const Icon(Icons.settings, color: Colors.white),
                    title: const Text(
                      'Ayarlar',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      // Ayarlar sayfasına yönlendirme yapılabilir
                    },
                  ),
                  
                  // İşletme hesabı özel öğeler
                  if (isBusinessAccount) ...[
                    const Divider(color: Colors.white24),
                    ListTile(
                      leading: const Icon(Icons.business, color: Colors.white),
                      title: const Text(
                        'İşletme Paneli',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        // İşletme paneline yönlendirme yapılabilir
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.analytics, color: Colors.white),
                      title: const Text(
                        'İstatistikler',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        // İstatistikler sayfasına yönlendirme yapılabilir
                      },
                    ),
                  ],
                  
                  // Garson hesabı özel öğeler
                  if (!isBusinessAccount) ...[
                    const Divider(color: Colors.white24),
                    ListTile(
                      leading: const Icon(Icons.work, color: Colors.white),
                      title: const Text(
                        'İş Geçmişim',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        // İş geçmişi sayfasına yönlendirme yapılabilir
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.star, color: Colors.white),
                      title: const Text(
                        'Değerlendirmelerim',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        // Değerlendirmeler sayfasına yönlendirme yapılabilir
                      },
                    ),
                  ],
                ],
              ),
            ),
            
            // Çıkış Yap Butonu (en altta)
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Divider(color: Colors.white24),
                ListTile(
                  leading: const Icon(Icons.exit_to_app, color: Colors.red),
                  title: const Text(
                    'Çıkış Yap',
                    style: TextStyle(color: Colors.red),
                  ),
                  onTap: () {
                    // Çıkış işlemi ve login sayfasına yönlendirme
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                      (Route<dynamic> route) => false,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
} 