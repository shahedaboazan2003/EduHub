import 'package:flutter/material.dart';
import '../widgets/popular_course_card.dart';
import 'details_view.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      // الشريط العلوي يحتوي على زر العودة والعنوان
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1E1E1E)),
          onPressed: () => Navigator.pop(context), // زر العودة للهوم
        ),
        title: const Text(
          'EduHub',
          style: TextStyle(
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.bold,
            color: Color(0xFF1B61EB),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // 1. حقل البحث الشغال داخل صفحة البحث
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: searchController,
              autofocus: true, // يفتح الكيبورد تلقائياً عند دخول الصفحة
              decoration: InputDecoration(
                hintText: 'Search courses, skills ....',
                hintStyle: const TextStyle(
                  fontFamily: 'Inter',
                  color: Color(0xFFA0AEC0),
                  fontSize: 14,
                ),
                prefixIcon: const Icon(Icons.search, color: Color(0xFFA0AEC0)),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0x4DC3C6D7)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFF1B61EB)),
                ),
              ),
            ),
          ),

          // 2. قائمة الكورسات العمودية باستعمال نفس ودجيت PopularCourseCard
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                buildVerticalCard(
                  imagePath: 'assets/images/popular.png',
                  category: 'Bestseller',
                  title: 'Data Science Bootcamp: From Zero to Hero',
                  instructor: 'Dr. Emily Chen, Lead Data Scientist',
                  rating: 4.9,
                  studentsCount: '8.5k reviews',
                  price: '120.00',
                  onTapDetails: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsView(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                buildVerticalCard(
                  imagePath: 'assets/images/popular.png',
                  category: 'UI/UX',
                  title: 'Advanced UI/UX Design Patterns',
                  instructor: 'Marcus Reed, Product Design Director',
                  rating: 4.8,
                  studentsCount: '3.2k reviews',
                  price: '85.00',
                  onTapDetails: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsView(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                buildVerticalCard(
                  imagePath: 'assets/images/popular.png',
                  category: 'New',
                  title: 'Executive Leadership & Strategy',
                  instructor: 'Sarah Jenkins, MBA',
                  rating: 4.7,
                  studentsCount: '950 reviews',
                  price: '150.00',
                  onTapDetails: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  DetailsView(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ودجيت بسيطة لضمان عرض PopularCourseCard بعرض الصفحة كاملاً
  Widget buildVerticalCard({
    required String imagePath,
    required String category,
    required String title,
    required String instructor,
    required double rating,
    required String studentsCount,
    required String price,
    required VoidCallback onTapDetails,
  }) {
    return SizedBox(
      width: double.infinity,
      child: PopularCourseCard(
        imagePath: imagePath,
        category: category,
        title: title,
        instructor: instructor,
        rating: rating,
        studentsCount: studentsCount,
        price: price,
        onTapDetails: onTapDetails,
      ),
    );
  }
}