import 'package:expense_tracker/widgets/expense_item.dart';
import 'package:flutter/material.dart';

import '../models/expense.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  const ExpensesList(
      {required this.expenses, super.key, required this.onRemoveExpense});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Dismissible(
        background: Container(color: Theme.of(context).colorScheme.error.withOpacity(0.75),margin: EdgeInsets.symmetric(horizontal: Theme.of(context).cardTheme.margin!.horizontal) ,),
          onDismissed: (direction) {
            onRemoveExpense(expenses[index]);
          },
          key: ValueKey(expenses[index]),
          child: ExpenseItem(expenses[index])),
      itemCount: expenses.length,
    );
  }
}
