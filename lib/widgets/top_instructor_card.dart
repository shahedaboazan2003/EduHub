import 'package:flutter/material.dart';

class TopInstructorCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String field;

  const TopInstructorCard({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.field,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      child: Column(
        children: [
          CircleAvatar(radius: 36, backgroundImage: AssetImage(imagePath)),
          SizedBox(height: 8),
          Text(
            name,
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E1E1E),
            ),
          ),
          SizedBox(height: 2),
          Text(
            field,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 11,
              color: Color(0xFF6C757D),
            ),
          ),
        ],
      ),
    );
  }
}
