import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenseslist/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.removeExp,
  });

  final List<Expense> expenses;
  final void Function(Expense exp) removeExp;

  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder:
          (context, index) => Dismissible(
            key: ValueKey(expenses[index]),

            onDismissed: (direction) {
              removeExp(expenses[index]);
            },
            background: Container(
              color: Theme.of(context).colorScheme.error,
              margin: EdgeInsets.symmetric(
                horizontal: Theme.of(context).cardTheme.margin!.horizontal,
              ),
            ),

            child: ExpensesItem(expenses[index]),
          ),
    );
  }
}
