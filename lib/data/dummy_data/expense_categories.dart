import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Represents a single expense category with metadata.
class ExpenseCategory {
  final String name;
  final IconData icon;
  final Color color;

  const ExpenseCategory({
    required this.name,
    required this.icon,
    required this.color,
  });
}

/// A list of predefined expense categories for offline use.
final List<ExpenseCategory> expenseCategories = [
  ExpenseCategory(
    name: 'Subscriptions',
    icon: LucideIcons.tv400,
    color: const Color(0xFF6366F1), // Indigo
  ),
  ExpenseCategory(
    name: 'Groceries',
    icon: LucideIcons.shoppingBag400,
    color: const Color(0xFF22C55E), // Green
  ),
  ExpenseCategory(
    name: 'Fuel',
    icon: LucideIcons.fuel400,
    color: const Color(0xFFF97316), // Orange
  ),
  ExpenseCategory(
    name: 'Bills',
    icon: LucideIcons.fileText400,
    color: const Color(0xFF0EA5E9), // Sky Blue
  ),
  ExpenseCategory(
    name: 'Food & Drinks',
    icon: LucideIcons.utensils400,
    color: const Color(0xFFEAB308), // Yellow
  ),
  ExpenseCategory(
    name: 'Shopping',
    icon: LucideIcons.shoppingCart400,
    color: const Color(0xFFD946EF), // Pink
  ),
  ExpenseCategory(
    name: 'Health',
    icon: LucideIcons.heartPulse400,
    color: const Color(0xFFEF4444), // Red
  ),
  ExpenseCategory(
    name: 'Entertainment',
    icon: LucideIcons.gamepad2400,
    color: const Color(0xFF8B5CF6), // Violet
  ),
  ExpenseCategory(
    name: 'Transport',
    icon: LucideIcons.bus400,
    color: const Color(0xFF14B8A6), // Teal
  ),
  ExpenseCategory(
    name: 'Others',
    icon: LucideIcons.circleEllipsis400,
    color: const Color(0xFF94A3B8), // Gray
  ),
];
