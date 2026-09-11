import 'package:flutter/material.dart';

class PopularCourseCard extends StatelessWidget {
  final String imagePath;
  final String category;
  final String title;
  final String instructor;
  final double rating;
  final String studentsCount;
  final String price;
  final bool isFullWidth;
  final bool isFavorite;
  final VoidCallback? onTapDetails;
  final VoidCallback? onDelete;

  const PopularCourseCard({
    super.key,
    required this.imagePath,
    required this.category,
    required this.title,
    required this.instructor,
    required this.rating,
    required this.studentsCount,
    required this.price,
    this.isFullWidth = false,
    this.isFavorite = false,
    this.onTapDetails,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    Widget cardContent = Container(
      width: 240,
      margin: EdgeInsets.only(right: isFullWidth ? 0 : 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Image.asset(
                  imagePath,
                  height: 130,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 8,
                left: 8,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    category,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E1E1E),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : const Color(0xFF4A5568),
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E1E1E),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'By $instructor',
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 11,
                    color: Color(0xFF6C757D),
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.star, size: 14, color: Color(0xFFFFC107)),
                    SizedBox(width: 4),
                    Text(
                      '$rating',
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      '($studentsCount)',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 11,
                        color: Color(0xFF6C757D),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Divider(color: Color(0xFFE2E8F0), thickness: 1, height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$$price',
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1B61EB),
                      ),
                    ),
                    Row(
                      children: [
                        if (onDelete != null) ...[
                          GestureDetector(
                            onTap: onDelete,
                            child: const Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                              size: 18,
                            ),
                          ),
                          const SizedBox(width: 12),
                        ],
                        GestureDetector(
                          onTap: onTapDetails,
                          child: const Text(
                            'Details',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1B61EB),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );

    if (isFullWidth) {
      return Padding(
        padding: EdgeInsets.only(bottom: 16.0),
        child: SizedBox(
          width: double.infinity,
          child: FittedBox(
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
            child: cardContent,
          ),
        ),
      );
    }

    return cardContent;
  }
}
