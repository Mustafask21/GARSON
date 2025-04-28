import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import 'account_screen.dart';
import 'messages_screen.dart';
import '../widgets/footer_widget.dart';
import '../widgets/sidebar_widget.dart';

class WaiterHomeScreen extends StatefulWidget {
  const WaiterHomeScreen({Key? key}) : super(key: key);

  @override
  State<WaiterHomeScreen> createState() => _WaiterHomeScreenState();
}

class _WaiterHomeScreenState extends State<WaiterHomeScreen> {
  int _selectedIndex = 0;
  
  final List<Widget> _screens = [
    const WaiterDashboard(),
    const MessagesScreen(),
    const AccountScreen(),
  ];
  
  final List<String> _titles = [
    'Ana Sayfa',
    'Mesajlar',
    'Hesabım'
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xFF161A30), // Koyu lacivert arka plan
      drawer: const SidebarWidget(
        userName: "Garson Kullanıcı",
        userEmail: "garson@gmail.com",
        userAvatar: "https://randomuser.me/api/portraits/men/32.jpg",
        isBusinessAccount: false,
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xFF161A30),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: Row(
          children: [
            Image.network(
              'https://cdn-icons-png.flaticon.com/512/4813/4813075.png',
              height: 28,
              color: Colors.pink,
            ),
            const SizedBox(width: 8),
            const Text(
              'Garson',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Ana içerik alanı
          Expanded(
            child: _screens[_selectedIndex],
          ),
          
          // Alt navigasyon çubuğu (sabit, mor renkli)
          Container(
            height: 60,
            decoration: const BoxDecoration(
              color: Color(0xFFB356FF), // Mor renk
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem(0, Icons.email_outlined, "Mesajlar"),
                _buildCentralButton(),
                _buildNavItem(2, Icons.person_outline, "Hesap"),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildNavItem(int index, IconData icon, String label) {
    bool isSelected = _selectedIndex == index;
    
    return InkWell(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 24,
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildCentralButton() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFFB356FF),
        border: Border.all(color: Colors.white, width: 3),
      ),
      child: IconButton(
        icon: const Icon(
          Icons.wifi_calling_3_rounded,
          color: Colors.white,
          size: 30,
        ),
        onPressed: () {
          // Merkez butonu işlevi
        },
      ),
    );
  }
}

class WaiterDashboard extends StatefulWidget {
  const WaiterDashboard({Key? key}) : super(key: key);

  @override
  State<WaiterDashboard> createState() => _WaiterDashboardState();
}

class _WaiterDashboardState extends State<WaiterDashboard> {
  int _currentPage = 0;
  bool _isAvailable = false;

  final List<String> _imageUrls = [
    'https://img.freepik.com/free-photo/waitress-taking-order-from-customer-using-digital-tablet-cafe_637285-2441.jpg',
    'https://img.freepik.com/free-photo/waitress-taking-order-restaurant_23-2149167122.jpg',
    'https://img.freepik.com/free-photo/waiter-serving-food-group-cheerful-friends-sitting-cafe_637285-12504.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Görsel Carousel
          AspectRatio(
            aspectRatio: 16/9,
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  children: [
                    // Carousel
                    PageView.builder(
                      itemCount: _imageUrls.length,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Image.network(
                          _imageUrls[index],
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                    
                    // İndikatörler
                    Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          _imageUrls.length,
                          (index) => Container(
                            width: 8,
                            height: 8,
                            margin: const EdgeInsets.symmetric(horizontal: 2),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentPage == index
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.4),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // Durum ayarı kartı
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF1D2139),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white.withOpacity(0.1)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text(
                    'İş Tekliflerine Açık Olmak İçin\nButonu Aktif Hale Getirin',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Switch.adaptive(
                    value: _isAvailable,
                    onChanged: (value) {
                      setState(() {
                        _isAvailable = value;
                      });
                    },
                    activeColor: Colors.green,
                    activeTrackColor: Colors.green.withOpacity(0.5),
                    inactiveThumbColor: Colors.red,
                    inactiveTrackColor: Colors.red.withOpacity(0.5),
                  ),
                ],
              ),
            ),
          ),
          
          // İçerik yüksekliği için ek boşluk
          SizedBox(height: MediaQuery.of(context).size.height * 0.4),
          
          // Footer
          const FooterWidget(),
        ],
      ),
    );
  }
} 