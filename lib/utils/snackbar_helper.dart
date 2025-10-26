import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SnackbarHelper {
  /// 🟩 Common private method to show snackbars
  static void _show({
    required String title,
    required String message,
    required Color color,
    required IconData icon,
  }) {
    final context = Get.context!;
    final theme = ShadTheme.of(context).textTheme;

    Get.snackbar(
      '',
      '',
      backgroundColor: color.withOpacity(0.1),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(12),
      borderRadius: 12,
      duration: const Duration(seconds: 3),
      shouldIconPulse: true,
      icon: Icon(icon, color: color),
      titleText: Text(
        title,
        style: theme.small.copyWith(color: color, fontWeight: FontWeight.bold),
      ),
      messageText: Text(
        message,
        style: theme.small.copyWith(color: Colors.black87),
      ),
    );
  }

  // ===========================
  // 💰 Income Snackbars
  // ===========================
  static void showIncomeSaved() => _show(
    title: 'Income Saved',
    message: 'New income entry has been added successfully.',
    color: const Color(0xFF10B981),
    icon: LucideIcons.circleCheck400,
  );

  static void showIncomeUpdated() => _show(
    title: 'Income Updated',
    message: 'Income details have been updated.',
    color: const Color(0xFF2563EB),
    icon: LucideIcons.refreshCcw,
  );

  static void showIncomeDeleted() => _show(
    title: 'Income Deleted',
    message: 'Income record has been deleted.',
    color: const Color(0xFFF87171),
    icon: LucideIcons.trash2,
  );

  // ===========================
  // 💸 Expense Snackbars
  // ===========================
  static void showExpenseSaved() => _show(
    title: 'Expense Saved',
    message: 'New expense entry has been added successfully.',
    color: const Color(0xFFF59E0B),
    icon: LucideIcons.wallet,
  );

  static void showExpenseUpdated() => _show(
    title: 'Expense Updated',
    message: 'Expense details have been updated.',
    color: const Color(0xFF3B82F6),
    icon: LucideIcons.pencil400,
  );

  static void showExpenseDeleted() => _show(
    title: 'Expense Deleted',
    message: 'Expense record has been deleted.',
    color: const Color(0xFFDC2626),
    icon: LucideIcons.trash,
  );

  // ===========================
  // ⚠️ Generic Error
  // ===========================
  static void showError(String message) => _show(
    title: 'Error',
    message: message,
    color: const Color(0xFFEF4444),
    icon: LucideIcons.triangleAlert400,
  );
}
