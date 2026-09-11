import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/favorite_provider.dart';
import '../providers/search_provider.dart';
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
    final searchProvider = context.watch<SearchProvider>();
    final searchedCourses = searchProvider.searchResults;
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF1E1E1E)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
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
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              controller: searchController,
              autofocus: true,
              onChanged: (value) {
                context.read<SearchProvider>().updateQuery(value);
              },
              decoration: InputDecoration(
                hintText: 'Search courses, skills ....',
                hintStyle: TextStyle(
                  fontFamily: 'Inter',
                  color: Color(0xFFA0AEC0),
                  fontSize: 14,
                ),
                prefixIcon: Icon(Icons.search, color: Color(0xFFA0AEC0)),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(vertical: 12),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0x4DC3C6D7)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0x4DC3C6D7)),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemCount: searchedCourses.length,
              itemBuilder: (context, index) {
                final course = searchedCourses[index];

                return PopularCourseCard(
                  isFullWidth: true,
                  imagePath: course.image,
                  category: course.category,
                  title: course.name,
                  instructor: course.instructorName,
                  rating: course.rating,
                  studentsCount: '${course.enrolledStudents} students',
                  price: course.price.toString(),
                  isFavorite: context
                      .watch<FavoriteProvider>()
                      .isCourseFavorite(course),
                  onToggleFavorite: () async {
                    await context.read<FavoriteProvider>().toggleFavorite(
                      course: course,
                    );
                  },
                  onTapDetails: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsView(course: course),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
