import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final String image;
  final bool isSelected;

  const CategoryItem({
    super.key,
    required this.name,
    required this.icon,
    required this.image,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(
              4,
            ), // Reduced padding to fit image better
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF2196F3) : Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                image,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 50,
                    height: 50,
                    alignment: Alignment.center,
                    child: Icon(
                      icon,
                      color: isSelected ? Colors.white : Colors.black54,
                      size: 30,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.black : Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
