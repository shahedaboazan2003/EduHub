import 'package:flutter/material.dart';

import '../widgets/popular_course_card.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'EduHub',
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1B61EB),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Saved Courses',
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E1E1E),
                ),
              ),
              SizedBox(height: 16),
              ListView(
                shrinkWrap: true,
                children: [
                  PopularCourseCard(
                    isFullWidth: true,
                    imagePath: 'assets/images/popular.png',
                    category: 'AI & Data',
                    title: 'Advanced Machine Learning Algorithms',
                    instructor: 'Dr. Emily Chen',
                    rating: 4.9,
                    studentsCount: '1.2k',
                    price: '149',
                  ),
                  PopularCourseCard(
                    isFullWidth: true,
                    imagePath: 'assets/images/popular.png',
                    category: 'UI/UX Design',
                    title:
                        'UI/UX Design Masterclass: From Wireframe to Prototype',
                    instructor: 'Sarah Jenkins',
                    rating: 4.8,
                    studentsCount: '850',
                    price: '129',
                  ),
                  PopularCourseCard(
                    isFullWidth: true,
                    imagePath: 'assets/images/popular.png',
                    category: 'Business',
                    title: 'Strategic Leadership for the Modern Enterprise',
                    instructor: 'Prof. Michael Chang',
                    rating: 4.7,
                    studentsCount: '2.1k',
                    price: '199',
                  ),
                  PopularCourseCard(
                    isFullWidth: true,
                    imagePath: 'assets/images/popular.png',
                    category: 'Development',
                    title: 'Full-Stack Web Development BootCamp',
                    instructor: 'Alex Rodriguez',
                    rating: 4.9,
                    studentsCount: '3.4k',
                    price: '89',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
