// ignore_for_file: unused_import

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:income_tracker_app/data/local/app_database.dart';
import 'package:income_tracker_app/features/transactions/activity_controller.dart';
import 'package:income_tracker_app/features/expenses/expense_controller.dart';
import 'package:income_tracker_app/features/home/add_expense_sheet.dart';
import 'package:income_tracker_app/features/home/add_income_sheet.dart';
import 'package:income_tracker_app/features/home/home_controller.dart';
import 'package:income_tracker_app/features/home/income_expense_chart.dart';
import 'package:income_tracker_app/features/incomes/income_controller.dart';
import 'package:income_tracker_app/router/app_router.dart';
import 'package:income_tracker_app/services/finance_service.dart';
import 'package:income_tracker_app/utils/currency_helper.dart';
import 'package:income_tracker_app/utils/date_formatter.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeCtrl = Get.find<HomeController>();
  final financeService = Get.find<FinanceService>();
  final incomeController = Get.find<IncomeController>();
  final expenseController = Get.find<ExpenseController>();
  final activityController = Get.find<RecentActivityController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              toolbarHeight: 200,
              expandedHeight: 250,
              flexibleSpace: FlexibleSpaceBar(
                background: Obx(
                  () => Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.all(25),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 16,
                              offset: const Offset(0, 4),
                              color: Colors.deepPurple.withOpacity(0.08),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              CurrencyHelper.format(
                                financeService.netBalance.value,
                              ),
                              style: ShadTheme.of(context).textTheme.h1,
                            ),
                            Text(
                              'Net Balance',
                              style: ShadTheme.of(
                                context,
                              ).textTheme.small.copyWith(fontSize: 16),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),

                      // ✅ Correct use of Positioned
                      Positioned(
                        bottom: 0, // adjust as needed
                        left: 0, // adjust as needed
                        child: Image.asset(
                          'assets/images/man_1.png',
                          height: 200,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Summary Cards
            SliverToBoxAdapter(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (isTablet && constraints.maxWidth > 900) {
                    return Row(
                      children: [
                        Expanded(
                          child: _buildSummaryCard(
                            'Total Income',
                            '₱ 125,430.00',
                            LucideIcons.trendingUp,
                            const Color(0xFF7C3AED),
                            '+12.5%',
                            true,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Obx(
                          () => Expanded(
                            child: _buildSummaryCard(
                              'This Month',
                              CurrencyHelper.format(
                                financeService.totalIncome.value,
                              ),
                              LucideIcons.walletMinimal400,
                              const Color(0xFF8B5CF6),
                              '+8.2%',
                              true,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Obx(
                          () => Expanded(
                            child: _buildSummaryCard(
                              'Expenses',
                              financeService.totalExpense.toString(),
                              LucideIcons.calendar,
                              const Color.fromARGB(255, 246, 92, 92),
                              '+8.2%',
                              true,
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  return Obx(
                    () => Column(
                      children: [
                        // _buildSummaryCard(
                        //   'Net Balance',
                        //   CurrencyHelper.format(homeCtrl.netBalance.value),
                        //   LucideIcons.trendingUp,
                        //   const Color(0xFF7C3AED),
                        //   '+12.5%',
                        //   true,
                        // ),
                        // const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: _buildSummaryCard(
                                'This Month',
                                CurrencyHelper.format(
                                  incomeController.totalIncome.value,
                                ),
                                LucideIcons.walletMinimal400,
                                const Color(0xFF8B5CF6),
                                '+8.2%',
                                true,
                              ),
                            ),

                            const SizedBox(width: 12),
                            Obx(
                              () => Expanded(
                                child: _buildSummaryCard(
                                  'Total Expenses',
                                  CurrencyHelper.format(
                                    expenseController.totalExpense.value,
                                  ),
                                  LucideIcons.wallet400,
                                  const Color.fromARGB(255, 246, 92, 92),
                                  '+8.2%',
                                  true,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SliverAppBar(
              backgroundColor: Colors.white,
              expandedHeight: 180,
              collapsedHeight: 180,
              pinned: true,
              flexibleSpace: LayoutBuilder(
                builder: (context, constraints) {
                  // Calculate collapse progress
                  final percent = ((constraints.maxHeight - 80) / (180 - 80))
                      .clamp(0.0, 1.0);

                  return FlexibleSpaceBar(
                    background: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.grey.shade50, Colors.white],
                        ),
                      ),
                      child: SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Opacity(
                                opacity: percent,
                                child: Text(
                                  'Quick Actions',
                                  style: ShadTheme.of(context).textTheme.small
                                      .copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black45,
                                        letterSpacing: 0.5,
                                      ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Expanded(
                                    child: _buildActionCard(
                                      context: context,
                                      icon: LucideIcons.circlePlus,
                                      label: 'Income',
                                      color: Colors.green.shade50,
                                      iconColor: Colors.green.shade700,
                                      onPressed: () => showShadSheet(
                                        side: ShadSheetSide.bottom,
                                        context: context,
                                        builder: (context) =>
                                            _showAddIncomeSheet(
                                              context,
                                              incomeController,
                                              ShadSheetSide.bottom,
                                            ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: _buildActionCard(
                                      context: context,
                                      icon: LucideIcons.circleMinus,
                                      label: 'Expense',
                                      color: Colors.red.shade50,
                                      iconColor: Colors.red.shade700,
                                      onPressed: () => showShadSheet(
                                        side: ShadSheetSide.bottom,
                                        context: context,
                                        builder: (context) =>
                                            _showAddExpenseSheet(
                                              context,
                                              expenseController,
                                              ShadSheetSide.bottom,
                                            ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: _buildActionCard(
                                      context: context,
                                      icon: LucideIcons.target,
                                      label: 'Goal',
                                      color: Colors.blue.shade50,
                                      iconColor: Colors.blue.shade700,
                                      onPressed: () {},
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: _buildActionCard(
                                      context: context,
                                      icon: LucideIcons.chartArea400,
                                      label: 'Reports',
                                      color: Colors.purple.shade50,
                                      iconColor: Colors.purple.shade700,
                                      onPressed: () {},
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Recent Activity
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  isTablet ? 32 : 20,
                  isTablet ? 32 : 15,
                  isTablet ? 32 : 20,
                  isTablet ? 12 : 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recent Transactions',
                      style: ShadTheme.of(context).textTheme.h2.copyWith(
                        fontSize: isTablet ? 20 : 18,
                        color: const Color(0xFF1A1A1A),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () => Get.toNamed(AppRouter.transactions),
                      child: Text(
                        'View All',
                        style: ShadTheme.of(context).textTheme.small.copyWith(
                          color: Color(0xFF7C3AED),
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: isTablet ? 32 : 15,
                vertical: 8,
              ),
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

            // Chart Section
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  isTablet ? 32 : 20,
                  isTablet ? 32 : 24,
                  isTablet ? 32 : 20,
                  isTablet ? 12 : 8,
                ),
                child: Text(
                  'Analytics',
                  style: ShadTheme.of(context).textTheme.h4.copyWith(),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isTablet ? 32 : 20,
                  vertical: 8,
                ),
                child: _buildChartPlaceholder(isTablet),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard(
    String label,
    String value,
    IconData icon,
    Color color,
    String? change,
    bool showChange,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.08),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 20),
              ),
              // if (showChange && change != null)
              //   Container(
              //     padding: const EdgeInsets.symmetric(
              //       horizontal: 8,
              //       vertical: 4,
              //     ),
              //     decoration: BoxDecoration(
              //       color: const Color(0xFF10B981).withOpacity(0.1),
              //       borderRadius: BorderRadius.circular(8),
              //     ),
              //     child: Text(
              //       change,
              //       style: const TextStyle(
              //         color: Color(0xFF10B981),
              //         fontSize: 11,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            label,
            style: ShadTheme.of(context).textTheme.small.copyWith(
              fontSize: 13,
              color: const Color(0xFF6B6B6B),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: ShadTheme.of(context).textTheme.small.copyWith(
              fontSize: 22,
              color: const Color(0xFF1A1A1A),
              letterSpacing: -0.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChartPlaceholder(bool isTablet) {
    // Example: map your data to FlSpot

    return Container(
      height: isTablet ? 320 : 240,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF7C3AED).withOpacity(0.08),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     const Text(
          //       'Income Overview',
          //       style: TextStyle(
          //         fontSize: 16,
          //         fontWeight: FontWeight.bold,
          //         color: Color(0xFF1A1A1A),
          //       ),
          //     ),
          //     Container(
          //       padding: const EdgeInsets.symmetric(
          //         horizontal: 12,
          //         vertical: 6,
          //       ),
          //       decoration: BoxDecoration(
          //         color: const Color(0xFF7C3AED).withOpacity(0.1),
          //         borderRadius: BorderRadius.circular(8),
          //       ),
          //       child: Row(
          //         mainAxisSize: MainAxisSize.min,
          //         children: const [
          //           Text(
          //             'This Month',
          //             style: TextStyle(
          //               fontSize: 12,
          //               fontWeight: FontWeight.w600,
          //               color: Color(0xFF7C3AED),
          //             ),
          //           ),
          //           SizedBox(width: 4),
          //           Icon(
          //             LucideIcons.chevronDown,
          //             size: 14,
          //             color: Color(0xFF7C3AED),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
          // const SizedBox(height: 24),

          // OR if you need it to take remaining space:
          Expanded(child: IncomeExpenseChart()),

          // Then use the widget:
          // Expanded(
          //   child: Center(
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Icon(
          //           LucideIcons.chartArea400,
          //           size: isTablet ? 64 : 48,
          //           color: const Color(0xFF7C3AED).withOpacity(0.3),
          //         ),
          //         const SizedBox(height: 12),
          //         Text(
          //           'Chart visualization will appear here',
          //           style: TextStyle(
          //             fontSize: isTablet ? 14 : 13,
          //             color: const Color(0xFF6B6B6B),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildActivityItem(
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

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good morning, Jhonel 👋';
    if (hour < 17) return 'Good afternoon, Jhonel 👋';
    return 'Good evening, Jhonel 👋';
  }
}

Widget _showAddIncomeSheet(
  BuildContext context,
  IncomeController incomeController,
  ShadSheetSide side,
) {
  return ShadSheet(
    constraints: side == ShadSheetSide.left || side == ShadSheetSide.right
        ? const BoxConstraints(maxWidth: 512)
        : null,
    isScrollControlled: true,
    child: AnimatedPadding(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: AddIncomeSheet(incomeController: incomeController),
    ),
  );
}

Widget _showAddExpenseSheet(
  BuildContext context,
  ExpenseController expenseController,
  ShadSheetSide side,
) {
  return ShadSheet(
    constraints: side == ShadSheetSide.left || side == ShadSheetSide.right
        ? const BoxConstraints(maxWidth: 512)
        : null,
    isScrollControlled: true,
    child: AnimatedPadding(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: AddExpenseSheet(expenseController: expenseController),
    ),
  );
}

Widget _buildActionCard({
  required BuildContext context,
  required IconData icon,
  required String label,
  required Color color,
  required Color iconColor,
  required VoidCallback onPressed,
}) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black.withOpacity(0.05), width: 1),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 24, color: iconColor),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildAnimatedText({required String text}) {
  return SizedBox(
    width: 250.0,
    child: DefaultTextStyle(
      style: TextStyle(fontSize: 30.0, fontFamily: 'Agne'),
      child: AnimatedTextKit(
        animatedTexts: [TypewriterAnimatedText(text)],
        repeatForever: true,
      ),
    ),
  );
}
