import 'package:flutter/material.dart';

import '../widgets/profile_widgets.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  void _showLogoutBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFFCBD5E0),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Logout',
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E1E1E),
                ),
              ),
              SizedBox(height: 12),
              Text(
                'Are you sure you want to logout? You will need to enter your credentials again to access your account.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 13,
                  color: Color(0xFF6C757D),
                  height: 1.4,
                ),
              ),
              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0056D2),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFFE2E8F0)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4A5568),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Color(0xFFF8F9FA),
        elevation: 0,
        title: Text(
          'EduHub',
          style: TextStyle(
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Color(0xFF004AC6),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFFF0F5FF),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(
                            'assets/images/instructors.png',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Color(0xFF1B61EB),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.edit, color: Colors.white, size: 14),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Emma Jenkins',
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF191C1D),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Emma.j@example.com',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      color: Color(0xFF434655),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF1B61EB),
                            elevation: 0,
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Edit Profile',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffEEEFFF),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: BorderSide(color: Color(0xFF1B61EB)),
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Share Profile',
                            maxLines: 1,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2563EB),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ProfileSectionContainer(
              title: 'My Learning',
              children: [
                ProfileMenuItem(
                  icon: Icons.school_outlined,
                  title: 'My Courses',
                ),
                Divider(height: 1, color: Color(0xFFF0F0F0)),
                ProfileMenuItem(
                  icon: Icons.workspace_premium_outlined,
                  title: 'Certificates',
                ),
              ],
            ),
            SizedBox(height: 16),
            ProfileSectionContainer(
              title: 'Account',
              children: [
                ProfileMenuItem(
                  icon: Icons.notifications_none_outlined,
                  title: 'Notifications',
                  trailingText: '3 New',
                ),
                Divider(height: 1, color: Color(0xFFF0F0F0)),
                ProfileMenuItem(
                  icon: Icons.language_outlined,
                  title: 'Language',
                  trailingText: 'English',
                ),
                Divider(height: 1, color: Color(0xFFF0F0F0)),
                ProfileMenuItem(
                  icon: Icons.pie_chart_outline,
                  title: 'Theme',
                  trailingText: 'Light',
                ),
              ],
            ),
            SizedBox(height: 16),
            ProfileSectionContainer(
              title: 'System',
              children: [
                ProfileMenuItem(
                  icon: Icons.shield_outlined,
                  title: 'Privacy Policy',
                ),
                Divider(height: 1, color: Color(0xFFF0F0F0)),
                ProfileMenuItem(
                  icon: Icons.help_outline,
                  title: 'Help & Support',
                ),
                Divider(height: 1, color: Color(0xFFF0F0F0)),
                ProfileMenuItem(
                  icon: Icons.info_outline,
                  title: 'About EduHub',
                ),
              ],
            ),
            SizedBox(height: 16),
            ProfileSectionContainer(
              title: 'Learning Stats',
              children: [
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Expanded(
                        child: ProfileStatBox(
                          number: '12',
                          label: 'Courses\nCompleted',
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: ProfileStatBox(
                          number: '4',
                          label: 'Certificates\nEarned',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton.icon(
                onPressed: () => _showLogoutBottomSheet(context),
                icon: Icon(Icons.logout, color: Colors.red, size: 18),
                label: Text(
                  'Logout',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFF5F5),
                  side: BorderSide(color: Color(0xFFFFC1C1)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
