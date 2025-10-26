import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:income_tracker_app/features/incomes/income_controller.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class IncomeListScreen extends StatefulWidget {
  const IncomeListScreen({super.key});

  @override
  State<IncomeListScreen> createState() => _IncomeListScreenState();
}

class _IncomeListScreenState extends State<IncomeListScreen> {
  final incomeController = Get.find<IncomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _showAddIncomeSheet(context, incomeController);
        },
        backgroundColor: const Color(0xFF7C3AED),
        elevation: 4,
        icon: const Icon(LucideIcons.plus, color: Colors.white),
        label: const Text(
          'Add Income',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Incomes',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: SafeArea(child: Column(children: [
          ] )),
    );
  }
}

class AddIncomeSheet extends StatelessWidget {
  const AddIncomeSheet({super.key, required this.incomeController});

  final IncomeController incomeController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.05,
        right: MediaQuery.of(context).size.width * 0.05,
        top: 30,
        bottom: MediaQuery.of(context).viewInsets.bottom + 30,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Add New Income', style: ShadTheme.of(context).textTheme.h3),
            const SizedBox(height: 15),

            // 💰 Amount field
            ShadInputFormField(
              id: 'amount',
              label: Text(
                'Amount',
                style: ShadTheme.of(context).textTheme.small,
              ),
              controller: incomeController.amountController,
              placeholder: Text(
                'Enter amount',
                style: ShadTheme.of(context).textTheme.muted,
              ),
              validator: (v) => v.isEmpty ? 'Amount required' : null,
              onChanged: (t) =>
                  incomeController.amount.value = double.tryParse(t) ?? 0.0,
            ),

            // const SizedBox(height: 16),

            // // 📝 Description
            // ShadTextareaFormField(
            //   id: 'description',
            //   controller: incomeController.descriptionController,
            //   label: Text(
            //     'Description',
            //     style: ShadTheme.of(context).textTheme.small,
            //   ),
            //   placeholder: Text(
            //     'Enter Description',
            //     style: ShadTheme.of(context).textTheme.muted,
            //   ),
            //   validator: (v) {
            //     if (v.length < 10) {
            //       return 'Description must be at least 10 characters.';
            //     }
            //     return null;
            //   },
            //   onChanged: (value) => incomeController.description.value = value,
            // ),
            const SizedBox(height: 20),
            // 👥 Shared checkbox + conditional field
            Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShadCheckbox(
                    value: incomeController.isShared.value,
                    onChanged: (v) => incomeController.isShared.value = v,
                    label: Text(
                      'Is Shared?',
                      style: ShadTheme.of(context).textTheme.small,
                    ),
                  ),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: incomeController.isShared.value
                        ? Padding(
                            key: const ValueKey('shared_amount_field'),
                            padding: const EdgeInsets.only(top: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Shared Amount (35%)',
                                  style: ShadTheme.of(context).textTheme.small,
                                ),
                                const SizedBox(height: 8),
                                Obx(
                                  () => ShadInputFormField(
                                    id: 'shared_amount',
                                    placeholder: Text(
                                      incomeController.amountShared.value
                                          .toStringAsFixed(2),
                                      style: ShadTheme.of(
                                        context,
                                      ).textTheme.muted,
                                    ),
                                    validator: (v) => v.isEmpty
                                        ? 'Shared amount required'
                                        : null,
                                    readOnly: true,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : const SizedBox.shrink(key: ValueKey('empty')),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 💾 Save button
            ShadButton(
              onPressed: () async {
                await incomeController.saveEntry();
                // Reset the form after saving
                incomeController.resetForm();

                if (context.mounted) {
                  ShadToaster.of(context).show(
                    ShadToast(
                      title: Text('Success: Added new income entry'),
                      description: Text('${DateTime.now()}'),
                    ),
                  );
                }
              },
              child: const Text('Save Income'),
            ),
          ],
        ),
      ),
    );
  }
}

void _showAddIncomeSheet(
  BuildContext context,
  IncomeController incomeController,
) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // ✅ lets sheet expand with keyboard
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (ctx) {
      return DraggableScrollableSheet(
        expand: false,
        minChildSize: 0.4,
        maxChildSize: 0.9,
        initialChildSize: 0.6,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            controller: scrollController, // ✅ sync with drag
            child: AddIncomeSheet(incomeController: incomeController),
          );
        },
      );
    },
  );
}

Widget _buildIncomeCard(
  BuildContext context,
  dynamic income,
  dynamic controller,
) {
  final theme = Theme.of(context);
  final colorScheme = theme.colorScheme;

  return Card(
    elevation: 0,
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
      side: BorderSide(color: colorScheme.outline.withOpacity(0.2), width: 1),
    ),
    child: InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        // Navigate to details
      },
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Source badge at top
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHighest.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        LucideIcons.wallet,
                        size: 12,
                        color: colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        income.source?.sourceName ?? 'Unknown',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                // Status badges
                if (income.entry.isRecurring)
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Icon(
                      LucideIcons.repeat,
                      size: 12,
                      color: Colors.blue.shade700,
                    ),
                  ),
                if (income.entry.isShared)
                  Container(
                    margin: const EdgeInsets.only(left: 4),
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Icon(
                      LucideIcons.users,
                      size: 12,
                      color: Colors.green.shade700,
                    ),
                  ),
              ],
            ),

            const SizedBox(height: 10),

            // Amount + Actions row
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Amount
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        income.entry.currency,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: colorScheme.secondary,
                        ),
                      ),
                      const SizedBox(width: 4),
                      income.entry.isShared
                          ? Flexible(
                              child: Text(
                                income.entry.amountShared.toStringAsFixed(2),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: colorScheme.primary,
                                  height: 1,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          : Flexible(
                              child: Text(
                                income.entry.amount.toStringAsFixed(2),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: colorScheme.primary,
                                  height: 1,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                    ],
                  ),
                ),
                // Quick actions
                InkWell(
                  onTap: () {
                    // Edit action
                  },
                  borderRadius: BorderRadius.circular(6),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Icon(
                      LucideIcons.pencil,
                      size: 16,
                      color: colorScheme.primary,
                    ),
                  ),
                ),
                const SizedBox(width: 2),
                InkWell(
                  onTap: () async {
                    final confirmed = await _showDeleteConfirmation(context);
                    if (confirmed == true) {
                      await controller.deleteEntry(income.entry.id);
                    }
                  },
                  borderRadius: BorderRadius.circular(6),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Icon(
                      LucideIcons.trash2,
                      size: 16,
                      color: Colors.red.shade400,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Date row
            Row(
              children: [
                Icon(
                  LucideIcons.calendar,
                  size: 12,
                  color: colorScheme.secondary,
                ),
                const SizedBox(width: 4),
                Text(
                  _formatDate(income.entry.incomeDate),
                  style: TextStyle(
                    fontSize: 11,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),

            // Description (if exists)
            if (income.entry.description != null &&
                income.entry.description!.isNotEmpty) ...[
              const SizedBox(height: 6),
              Text(
                income.entry.description!,
                style: TextStyle(
                  fontSize: 12,
                  color: colorScheme.onSurfaceVariant,
                  height: 1.3,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],

            // Shared amount with consumer (compact)
            if (income.entry.isShared) ...[
              const SizedBox(height: 6),
              Wrap(
                spacing: 6,
                runSpacing: 4,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: Colors.green.withOpacity(0.3),
                        width: 0.5,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          LucideIcons.arrowRightLeft,
                          size: 10,
                          color: Colors.green.shade700,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${income.entry.currency} ${income.entry.amountShared.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: Colors.green.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      '${(income.entry.sharePercent * 100).toStringAsFixed(0)}%',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade700,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerHighest.withOpacity(
                        0.5,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          LucideIcons.userRound,
                          size: 10,
                          color: colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          income.consumer?.consumerName ?? 'Unknown',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ] else ...[
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      LucideIcons.userRound,
                      size: 10,
                      color: colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      income.consumer?.consumerName ?? 'Unknown',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    ),
  );
}

String _formatDate(DateTime date) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = today.subtract(const Duration(days: 1));
  final dateToCheck = DateTime(date.year, date.month, date.day);

  if (dateToCheck == today) {
    return 'Today';
  } else if (dateToCheck == yesterday) {
    return 'Yesterday';
  } else {
    return date.toLocal().toString().split(' ')[0];
  }
}

Future<bool?> _showDeleteConfirmation(BuildContext context) {
  Theme.of(context);

  return showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      icon: Icon(Icons.warning_rounded, color: Colors.red.shade400, size: 48),
      title: const Text(
        'Delete Income',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: const Text(
        'Are you sure you want to delete this income entry? This action cannot be undone.',
        textAlign: TextAlign.center,
      ),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(true),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text('Delete'),
        ),
      ],
    ),
  );
}
