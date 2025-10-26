import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Represents a single expense category with metadata.
class IncomeCategory {
  final String name;
  final IconData icon;
  final Color color;

  const IncomeCategory({
    required this.name,
    required this.icon,
    required this.color,
  });
}

/// A list of predefined income categories for offline use.
final List<IncomeCategory> incomeCategories = [
  IncomeCategory(
    name: 'Wifi-Vendo',
    icon: LucideIcons.wifi400,
    color: const Color(0xFF6366F1), // Indigo
  ),

  IncomeCategory(
    name: 'Service User',
    icon: LucideIcons.houseWifi400,
    color: const Color(0xFFD946EF), // Pink
  ),

  IncomeCategory(
    name: 'Others',
    icon: LucideIcons.circleEllipsis400,
    color: const Color(0xFF94A3B8), // Gray
  ),
];
