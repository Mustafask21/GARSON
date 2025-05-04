import 'package:flutter/material.dart';
import 'notifications_screen.dart';
import '../widgets/footer_widget.dart';
import '../widgets/app_drawer.dart';

class BusinessDashboard extends StatefulWidget {
  const BusinessDashboard({Key? key}) : super(key: key);

  @override
  State<BusinessDashboard> createState() => _BusinessDashboardState();
}

class _BusinessDashboardState extends State<BusinessDashboard> {
  final List<Applicant> _applicants = [
    Applicant(
      name: 'Mustafa Ergün',
      experience: 5,
      hasReferences: true,
      avatar: 'https://randomuser.me/api/portraits/men/32.jpg',
    ),
    Applicant(
      name: 'Hamza Topçu',
      experience: 5,
      hasReferences: false,
      avatar: 'https://randomuser.me/api/portraits/men/45.jpg',
    ),
    Applicant(
      name: 'Mert İşler',
      experience: 5,
      hasReferences: true,
      avatar: 'https://randomuser.me/api/portraits/men/67.jpg',
    ),
  ];

  int _currentPage = 0;
  final List<String> _imageUrls = [
    'https://img.freepik.com/free-photo/waitress-taking-order-from-customer-using-digital-tablet-cafe_637285-2441.jpg',
    'https://img.freepik.com/free-photo/waitress-taking-order-restaurant_23-2149167122.jpg',
    'https://img.freepik.com/free-photo/waiter-serving-food-group-cheerful-friends-sitting-cafe_637285-12504.jpg',
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xFF161A30),
      drawer: const AppDrawer(),
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotificationsScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Ana içerik
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  
                  // Bugün müsait garson sayısı
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1D2139),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white.withOpacity(0.1)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Bugün İş İçin Müsait\nGARSON SAYISI',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                Colors.green,
                                Colors.green.shade700,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              '67',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // Arananlar Geçmişi başlığı
                  const Padding(
                    padding: EdgeInsets.only(left: 16, top: 20, bottom: 10),
                    child: Text(
                      'Arananlar Geçmişi',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  
                  // Arananlar listesi
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _applicants.length,
                    itemBuilder: (context, index) {
                      return _buildApplicantItem(_applicants[index]);
                    },
                  ),
                  
                  // İçerik yüksekliği için ek boşluk
                  SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                  
                  // Footer
                  const FooterWidget(),
                ],
              ),
            ),
          ),
          
          // Alt navigasyon çubuğu
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
                _buildNavItem(Icons.email_outlined),
                _buildCentralButton(),
                _buildNavItem(Icons.business),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildNavItem(IconData icon) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 24,
        ),
      ],
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
  
  Widget _buildApplicantItem(Applicant applicant) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(applicant.avatar),
        ),
        title: Text(
          applicant.name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          'Tecrübe: ${applicant.experience} Yıl\nYer: ${applicant.hasReferences ? 'Boşta' : 'Dolu'}',
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 12,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white54,
          size: 16,
        ),
        onTap: () {
          // Adayın detaylarına git
        },
      ),
    );
  }
}

class Applicant {
  final String name;
  final int experience;
  final bool hasReferences;
  final String avatar;

  Applicant({
    required this.name,
    required this.experience,
    required this.hasReferences,
    required this.avatar,
  });
} 