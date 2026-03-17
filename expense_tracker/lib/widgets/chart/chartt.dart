import 'package:flutter/material.dart';

import 'package:expense_tracker/models/expense.dart';

import 'package:expense_tracker/widgets/chart/chart_bar.dart';

class Chartt extends StatelessWidget {
  const Chartt({super.key, required this.expenses});

  final List<Expense> expenses;

  List<ExpenseBucket> get buckets {
    return [
      ExpenseBucket.forCategory(expenses, Category.food),
      ExpenseBucket.forCategory(expenses, Category.leisure),
      ExpenseBucket.forCategory(expenses, Category.work),
      ExpenseBucket.forCategory(expenses, Category.travel),
    ];
  }

  double get maxTotalAmount {
    double maxTotalAmount = 0;

    for (final bucket in buckets) {
      if (bucket.getTotal() > maxTotalAmount) {
        maxTotalAmount = bucket.getTotal();
      }
    }

    return maxTotalAmount;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
            Theme.of(context).colorScheme.primary.withValues(alpha: 0.8),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final bucket in buckets)
                  ChartBarr(
                    fill:
                        bucket.getTotal() == 0
                            ? 0
                            : bucket.getTotal() / maxTotalAmount,
                  ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              for (final bucket in buckets)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Icon(
                      categoryIcons[bucket.category],
                      color:
                          isDarkMode
                              ? Theme.of(
                                context,
                              ).colorScheme.secondary.withValues(alpha: 0.3)
                              : Theme.of(
                                context,
                              ).colorScheme.primary.withValues(alpha: 0.3),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
