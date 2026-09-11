import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';
import '../providers/course_provider.dart';
import '../widgets/section_header.dart';
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
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserProvider>().getProfile();
      context.read<CourseProvider>().getCourses();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F9FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
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
                          'Hello, ${context.watch<UserProvider>().user?.firstName ?? ''}! 👋',
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
                      backgroundImage:
                          context.watch<UserProvider>().user != null
                          ? NetworkImage(
                              context.watch<UserProvider>().user!.profileImage,
                            )
                          : const AssetImage('assets/images/user.png')
                                as ImageProvider,
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
              SectionHeader(title: 'Continue Learning'),
              SizedBox(height: 12),
              SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 20),
                  itemCount: context.watch<CourseProvider>().courses.length,
                  itemBuilder: (context, index) {
                    final course = context
                        .watch<CourseProvider>()
                        .courses[index];

                    return CourseProgressCard(
                      imagePath: course.image,
                      title: course.name,
                      lessonText: 'Continue Learning',
                      progress: 0.0,
                    );
                  },
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
                  itemCount: context.watch<CourseProvider>().categories.length,
                  itemBuilder: (context, index) {
                    final categories = context
                        .watch<CourseProvider>()
                        .categories;

                    return Container(
                      margin: EdgeInsets.only(right: 10),
                      padding: EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFE2E8F0),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xFFE2E8F0)),
                      ),
                      child: Text(
                        categories[index],
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1E1E1E),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 24),

              SectionHeader(title: 'Popular Courses'),

              SizedBox(height: 12),

              SizedBox(
                height: 290,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 20),
                  itemCount: context.watch<CourseProvider>().courses.length,
                  itemBuilder: (context, index) {
                    final course = context
                        .watch<CourseProvider>()
                        .courses[index];

                    return PopularCourseCard(
                      imagePath: course.image,
                      category: course.category,
                      title: course.name,
                      instructor: course.instructorName,
                      rating: course.rating,
                      studentsCount: '${course.enrolledStudents} students',
                      price: course.price.toString(),
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
              SizedBox(height: 12),
              SizedBox(
                height: 230,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 20),
                  itemCount: context.watch<CourseProvider>().courses.length,
                  itemBuilder: (context, index) {
                    final course = context
                        .watch<CourseProvider>()
                        .courses[index];

                    return RecommendedCourseCard(
                      imagePath: course.image,
                      title: course.name,
                      rating: course.rating,
                      reviewsCount: '${course.reviewsCount}',
                      price: course.price.toString(),
                    );
                  },
                ),
              ),
              SizedBox(height: 24),
              Padding(
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
              SizedBox(height: 12),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 20),
                  itemCount: context.watch<CourseProvider>().courses.length,
                  itemBuilder: (context, index) {
                    final course = context
                        .watch<CourseProvider>()
                        .courses[index];

                    return TopInstructorCard(
                      imagePath: 'assets/images/instructors.png',
                      name: course.instructorName,
                      field: course.category,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
