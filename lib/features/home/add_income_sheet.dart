import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:income_tracker_app/data/dummy_data/income_categories.dart';
import 'package:income_tracker_app/features/incomes/income_controller.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AddIncomeSheet extends StatelessWidget {
  const AddIncomeSheet({super.key, required this.incomeController});

  final IncomeController incomeController;

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
            // padding: EdgeInsets.symmetric(
            //   horizontal: screenSize.width * 0.05,
            // ).copyWith(bottom: 20),
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
                          color: theme.colorScheme.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.attach_money,
                          color: theme.colorScheme.primary,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Add New Income', style: theme.textTheme.h4),
                          Text(
                            'Track your earnings',
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
                      color: theme.colorScheme.border.withOpacity(0.5),
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
                        controller: incomeController.amountController,
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
                        onChanged: (t) => incomeController.amount.value =
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
                              Text('Income Source'),
                            ],
                          ),

                          options: incomeCategories.map((cat) {
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
                            final category = incomeCategories.firstWhere(
                              (cat) => cat.name == value,
                              orElse: () => IncomeCategory(
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
                            incomeController.selectedCategory.value = value!;
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // 👥 Shared Income Section
                Obx(
                  () => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: incomeController.isShared.value
                          ? theme.colorScheme.primary.withOpacity(0.05)
                          : theme.colorScheme.card,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: incomeController.isShared.value
                            ? theme.colorScheme.primary.withOpacity(0.3)
                            : theme.colorScheme.border.withOpacity(0.5),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShadCheckbox(
                          value: incomeController.isShared.value,
                          onChanged: (v) => incomeController.isShared.value = v,
                          label: Row(
                            children: [
                              Icon(
                                Icons.people_outline,
                                size: 16,
                                color: theme.colorScheme.muted,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Shared Income',
                                style: theme.textTheme.small.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),

                        AnimatedSize(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          child: incomeController.isShared.value
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 16),
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: theme.colorScheme.background,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Shared Portion',
                                              style: theme.textTheme.small
                                                  .copyWith(
                                                    color:
                                                        theme.colorScheme.muted,
                                                  ),
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 8,
                                                    vertical: 2,
                                                  ),
                                              decoration: BoxDecoration(
                                                color: theme.colorScheme.primary
                                                    .withOpacity(0.1),
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              child: Text(
                                                '35%',
                                                style: theme.textTheme.small
                                                    .copyWith(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: theme
                                                          .colorScheme
                                                          .primary,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        Obx(
                                          () => Container(
                                            padding: const EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              color: theme.colorScheme.muted
                                                  .withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              border: Border.all(
                                                color: theme.colorScheme.border
                                                    .withOpacity(0.3),
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Amount to share',
                                                  style: theme.textTheme.small,
                                                ),
                                                Text(
                                                  '₱ ${incomeController.amountShared.value.toStringAsFixed(2)}',
                                                  style: theme.textTheme.small
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: theme
                                                            .colorScheme
                                                            .primary,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // 💾 Action Buttons
                Row(
                  children: [
                    Expanded(
                      child: ShadButton.outline(
                        onPressed: () {
                          incomeController.resetForm();
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
                            incomeController.amount.value > 0 &&
                            incomeController.selectedCategory.value.isNotEmpty;

                        return ShadButton(
                          onPressed: isValid
                              ? () async {
                                  await incomeController.saveEntry();
                                }
                              : null, // 🚫 disables the button
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.save, size: 18),
                              SizedBox(width: 8),
                              Text('Save Income'),
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
