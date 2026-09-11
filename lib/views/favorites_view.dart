import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/favorite_provider.dart';
import '../widgets/popular_course_card.dart';
import 'details_view.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = context.watch<FavoriteProvider>();

    final favoriteCourses = favoriteProvider.favoriteCourses;

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

              SizedBox(height: 16),

              Text(
                'Saved Courses',
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E1E1E),
                ),
              ),

              SizedBox(height: 16),

              if (favoriteCourses.isEmpty)
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Text(
                      'No saved courses yet',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        color: Color(0xFF6C757D),
                      ),
                    ),
                  ),
                )
              else
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: favoriteCourses.length,
                  itemBuilder: (context, index) {
                    final course = favoriteCourses[index];

                    return PopularCourseCard(
                      isFullWidth: true,
                      imagePath: course.image,
                      category: course.category,
                      title: course.name,
                      instructor: course.instructorName,
                      rating: course.rating,
                      studentsCount: '${course.enrolledStudents} students',
                      price: course.price.toString(),

                      isFavorite: true,

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
            ],
          ),
        ),
      ),
    );
  }
}
