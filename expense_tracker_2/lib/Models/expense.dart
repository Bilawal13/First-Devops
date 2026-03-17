enum Category { work, travel }

class Expense {
  Expense({
    required this.amount,
    required this.title,
    required this.date,
    required this.category,
  });

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
}
