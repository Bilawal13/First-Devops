import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    required this.categoryName,
    required this.color1,

    required this.onTap,
    super.key,
  });

  final String categoryName;
  final Color color1;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Container(
          height: 250,
          width: 150,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 90),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color1.withValues(alpha: 0.7), color1],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            categoryName,
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.titleMedium!.copyWith(fontSize: 25),
          ),
        ),
      ),
    );
  }
}
