import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:income_tracker_app/data/dummy_data/expense_categories.dart';
import 'package:income_tracker_app/features/expenses/expense_controller.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AddExpenseSheet extends StatelessWidget {
  const AddExpenseSheet({super.key, required this.expenseController});

  final ExpenseController expenseController;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // 📋 Form Content
        Flexible(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 📌 Title Section
                Container(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.destructive.withValues(
                            alpha: 0.1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.money_off,
                          color: theme.colorScheme.destructive,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Add Expense', style: theme.textTheme.h4),
                          Text(
                            'Track your expenses',
                            style: theme.textTheme.muted.copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // 💰 Amount Field Section
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.card,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: theme.colorScheme.border.withValues(alpha: 0.5),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.payments_outlined,
                            size: 16,
                            color: theme.colorScheme.muted,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Amount',
                            style: theme.textTheme.small.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '*',
                            style: TextStyle(
                              color: theme.colorScheme.destructive,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      ShadInputFormField(
                        id: 'amount',
                        controller: expenseController.amountController,
                        placeholder: Text(
                          'Enter amount',
                          style: theme.textTheme.muted,
                        ),
                        leading: Container(
                          padding: const EdgeInsets.only(left: 12, right: 8),
                          child: Text(
                            '₱',
                            style: theme.textTheme.small.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (v) =>
                            v.isEmpty ? 'Amount is required' : null,
                        onChanged: (t) => expenseController.amount.value =
                            double.tryParse(t) ?? 0.0,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.card,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: theme.colorScheme.border.withValues(alpha: 0.5),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.category_outlined,
                            size: 16,
                            color: theme.colorScheme.muted,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Category',
                            style: theme.textTheme.small.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '*',
                            style: TextStyle(
                              color: theme.colorScheme.destructive,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      ConstrainedBox(
                        constraints: const BoxConstraints(minWidth: 280),
                        child: ShadSelect<String>(
                          placeholder: Row(
                            children: const [
                              Icon(
                                LucideIcons.circleQuestionMark400,
                                color: Colors.grey,
                                size: 18,
                              ),
                              SizedBox(width: 8),
                              Text('Where did you spend it?'),
                            ],
                          ),

                          options: expenseCategories.map((cat) {
                            return ShadOption<String>(
                              value: cat.name,
                              child: Row(
                                children: [
                                  Icon(cat.icon, color: cat.color, size: 18),
                                  const SizedBox(width: 8),
                                  Text(cat.name),
                                ],
                              ),
                            );
                          }).toList(),
                          selectedOptionBuilder: (context, value) {
                            final category = expenseCategories.firstWhere(
                              (cat) => cat.name == value,
                              orElse: () => ExpenseCategory(
                                name: 'Unknown',
                                icon: Icons.help,
                                color: Colors.grey,
                              ),
                            );
                            return Row(
                              children: [
                                Icon(
                                  category.icon,
                                  color: category.color,
                                  size: 18,
                                ),
                                const SizedBox(width: 8),
                                Text(category.name),
                              ],
                            );
                          },
                          onChanged: (value) {
                            // handle value change here
                            expenseController.selectedCategory.value =
                                value ?? '';
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // 💾 Action Buttons
                Row(
                  children: [
                    Expanded(
                      child: ShadButton.outline(
                        onPressed: () {
                          expenseController.resetForm();
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancel'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 2,
                      child: Obx(() {
                        final isValid =
                            expenseController.amount.value > 0 &&
                            expenseController.selectedCategory.value.isNotEmpty;

                        return ShadButton.destructive(
                          onPressed: isValid
                              ? () async {
                                  await expenseController.saveExpenseEntry();
                                }
                              : null, // 🚫 disables the button
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.save, size: 18),
                              SizedBox(width: 8),
                              Text('Add Expense'),
                            ],
                          ),
                        );
                      }),
                    ),
                  ],
                ),

                // Bottom padding for keyboard
                SizedBox(
                  height: MediaQuery.of(context).viewInsets.bottom > 0 ? 20 : 0,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
