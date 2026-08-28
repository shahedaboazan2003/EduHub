import 'package:flutter/material.dart';

import 'search_view.dart';
import 'details_view.dart';
import '../widgets/course_progress_card.dart';
import '../widgets/popular_course_card.dart';
import '../widgets/recommended_course_card.dart';
import '../widgets/top_instructor_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedCategoryIndex = 0;

  final List<String> categories = [
    'Development',
    'Business',
    'Design',
    'Marketing',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F9FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good morning,',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            color: Color(0xff434655),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Hello, Emma! 👋',
                          style: TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF191C1D),
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 22,
                      backgroundImage: AssetImage('assets/images/user.png'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SearchView()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Color(0x4DC3C6D7)),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Color(0xFF737686)),
                        SizedBox(width: 18),
                        Text(
                          'Search for courses...',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Color(0xFF737686),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),
              buildSectionHeader('Continue Learning'),
              SizedBox(height: 12),
              SizedBox(
                height: 220,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 20),
                  children: const [
                    CourseProgressCard(
                      imagePath: 'assets/images/continue.png',
                      title: 'Advanced UI Design Principles',
                      lessonText: 'Lesson 12 of 20 • Visual Hierarchy',
                      progress: 0.65,
                    ),
                    CourseProgressCard(
                      imagePath: 'assets/images/continue.png',
                      title: 'React for Beginners',
                      lessonText: 'Lesson 4 of 15 • Components',
                      progress: 0.30,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Categories',
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E1E1E),
                  ),
                ),
              ),
              SizedBox(height: 12),
              SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 20),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    bool isSelected = selectedCategoryIndex == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategoryIndex = index;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        padding: EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFF1B61EB)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: isSelected
                                ? Colors.transparent
                                : const Color(0xFFE2E8F0),
                          ),
                        ),
                        child: Text(
                          categories[index],
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: isSelected
                                ? Colors.white
                                : const Color(0xFF1E1E1E),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 24),
              buildSectionHeader('Popular Courses'),
              SizedBox(height: 12),
              SizedBox(
                height: 290,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 20),
                  children: [
                    PopularCourseCard(
                      imagePath: 'assets/images/popular.png',
                      category: 'Development',
                      title: 'Full-stack Web Dev BootCamp 2024',
                      instructor: 'Dr. Angela Yu',
                      rating: 4.8,
                      studentsCount: '12k students',
                      price: '89.99',
                      onTapDetails: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsView(),
                          ),
                        );
                      },
                    ),
                    PopularCourseCard(
                      imagePath: 'assets/images/popular.png',
                      category: 'Marketing',
                      title: 'Complete Digital Marketing Course',
                      instructor: 'Sarah Lee',
                      rating: 4.9,
                      studentsCount: '8k students',
                      price: '64.99',
                      onTapDetails: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsView(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Recommended for You',
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E1E1E),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 230,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 20),
                  children: [
                    RecommendedCourseCard(
                      imagePath: 'assets/images/recommended.png',
                      title: 'UI/UX Masterclass: From Beginner to Pro',
                      rating: 4.9,
                      reviewsCount: '4k',
                      price: '59.99',
                    ),
                    RecommendedCourseCard(
                      imagePath: 'assets/images/recommended.png',
                      title: 'Python for Data Science & Machine Learning',
                      rating: 4.8,
                      reviewsCount: '22k',
                      price: '99.99',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // 7. قسم Top Instructors
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Top Instructors',
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E1E1E),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 20),
                  children: [
                    TopInstructorCard(
                      imagePath: 'assets/images/instructors.png',
                      name: 'Dr. Angela Yu',
                      field: 'Development',
                    ),
                    TopInstructorCard(
                      imagePath: 'assets/images/instructors.png',
                      name: 'Sarah J.',
                      field: 'Marketing',
                    ),
                    TopInstructorCard(
                      imagePath: 'assets/images/instructors.png',
                      name: 'David Chen',
                      field: 'Business',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E1E1E),
            ),
          ),
          const Text(
            'See all',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1B61EB),
            ),
          ),
        ],
      ),
    );
  }
}
