import 'package:flutter/material.dart';

class CourseTag extends StatelessWidget {
  final String text;

  const CourseTag({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFE8EEFF),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'Inter',
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: Color(0xFF1B61EB),
        ),
      ),
    );
  }
}

class DetailsTabItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const DetailsTabItem({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 13,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              color: isSelected
                  ? const Color(0xFF1B61EB)
                  : const Color(0xFF6C757D),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 2,
            width: 40,
            color: isSelected ? const Color(0xFF1B61EB) : Colors.transparent,
          ),
        ],
      ),
    );
  }
}

class LearnPointItem extends StatelessWidget {
  final String text;

  const LearnPointItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.check_circle_outline,
            color: Color(0xFF1B61EB),
            size: 18,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 12,
                color: Color(0xFF6C757D),
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
