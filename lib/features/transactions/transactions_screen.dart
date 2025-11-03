import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:income_tracker_app/data/local/app_database.dart';
import 'package:income_tracker_app/features/transactions/activity_controller.dart';
import 'package:income_tracker_app/utils/currency_helper.dart';
import 'package:income_tracker_app/utils/date_formatter.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final activityController = Get.find<RecentActivityController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recent Transactions',
          style: ShadTheme.of(context).textTheme.h4,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            sliver: StreamBuilder<List<RecentActivityData>>(
              stream: activityController.recentActivities,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const SliverToBoxAdapter(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  );
                }

                final activities = snapshot.data!;
                if (activities.isEmpty) {
                  return SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 80,
                        horizontal: 24,
                      ),
                      child: Column(
                        children: [
                          TweenAnimationBuilder<double>(
                            tween: Tween(begin: 0.0, end: 1.0),
                            duration: const Duration(milliseconds: 500),
                            builder: (context, value, child) {
                              return Opacity(
                                opacity: value,
                                child: Column(
                                  children: [
                                    Icon(
                                      LucideIcons.fileText,
                                      size: 60,
                                      color: Colors.grey.shade300,
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      'No recent transactions found',
                                      style: ShadTheme.of(context)
                                          .textTheme
                                          .small
                                          .copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black54,
                                          ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                }

                return SliverList.builder(
                  itemCount: activities.length > 20 ? 20 : activities.length,
                  itemBuilder: (context, index) {
                    final activity = activities[index];
                    final isIncome = activity.type == 'income';

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _buildActivityItem(
                        context,
                        activity.description ?? 'No description',
                        (isIncome ? '+' : '-') +
                            CurrencyHelper.format(activity.amount),
                        DateFormatter.format(activity.createdAt),
                        isIncome
                            ? LucideIcons.banknoteArrowUp400
                            : LucideIcons.banknoteArrowDown400,
                        isIncome
                            ? const Color(0xFF10B981)
                            : const Color(0xFFF87171),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildActivityItem(
  BuildContext context,
  String title,
  String amount,
  String subtitle,
  IconData icon,
  Color color,
) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: const Color(0xFFE5E5E5), width: 1),
    ),
    child: Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: ShadTheme.of(context).textTheme.small.copyWith(
                  fontSize: 14,
                  color: const Color(0xFF1A1A1A),
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.ellipsis,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: ShadTheme.of(context).textTheme.small.copyWith(
                  fontSize: 11,
                  color: const Color(0xFF6B6B6B),
                ),
              ),
            ],
          ),
        ),
        Text(
          amount,
          style: ShadTheme.of(context).textTheme.small.copyWith(
            fontSize: 13,
            color: const Color(0xFF1A1A1A),
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
      ],
    ),
  );
}
