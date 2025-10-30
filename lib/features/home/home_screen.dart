// ignore_for_file: unused_import

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      backgroundColor: const Color(0xFFF8F7FC),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              toolbarHeight: 100,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello',
                            style: ShadTheme.of(context).textTheme.muted,
                          ),
                          Text(
                            _getGreeting(),
                            style: ShadTheme.of(context).textTheme.h4,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SliverAppBar(
              pinned: true,
              expandedHeight: 150,
              flexibleSpace: FlexibleSpaceBar(
                background: Obx(
                  () => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        CurrencyHelper.format(financeService.netBalance.value),
                        style: ShadTheme.of(context).textTheme.h2,
                      ),
                      Text(
                        'Net Balance',
                        style: ShadTheme.of(
                          context,
                        ).textTheme.small.copyWith(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // // App Bar
            // SliverToBoxAdapter(
            //   child: Padding(
            //     padding: EdgeInsets.fromLTRB(
            //       isTablet ? 32 : 20,
            //       isTablet ? 24 : 16,
            //       isTablet ? 32 : 20,
            //       isTablet ? 16 : 12,
            //     ),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text(
            //               'Finance Tracker',
            //               style: ShadTheme.of(context).textTheme.h4.copyWith(
            //                 fontSize: 24,
            //                 color: const Color(0xFF1A1A1A),
            //                 letterSpacing: -0.5,
            //                 overflow: TextOverflow.ellipsis,
            //               ),
            //             ),
            //             const SizedBox(height: 4),
            //             Text(
            //               _getGreeting(),
            //               style: ShadTheme.of(context).textTheme.h4.copyWith(
            //                 fontSize: isTablet ? 16 : 14,
            //                 color: const Color(0xFF6B6B6B),
            //                 fontWeight: FontWeight.w500,
            //                 letterSpacing: -0.5,
            //               ),
            //             ),
            //           ],
            //         ),
            //         // Stack(
            //         //   clipBehavior: Clip.none,
            //         //   children: [
            //         //     Container(
            //         //       padding: const EdgeInsets.all(12),
            //         //       decoration: BoxDecoration(
            //         //         color: Colors.white,
            //         //         borderRadius: BorderRadius.circular(16),
            //         //         boxShadow: [
            //         //           BoxShadow(
            //         //             color: const Color(0xFF7C3AED).withOpacity(0.1),
            //         //             blurRadius: 12,
            //         //             offset: const Offset(0, 4),
            //         //           ),
            //         //         ],
            //         //       ),
            //         //       child: const Icon(
            //         //         LucideIcons.bell,
            //         //         color: Color(0xFF7C3AED),
            //         //         size: 25,
            //         //       ),
            //         //     ),

            //         //     // 🔴 Notification bubble
            //         //     Positioned(
            //         //       right: 4,
            //         //       top: 4,
            //         //       child: Container(
            //         //         padding: const EdgeInsets.all(4),
            //         //         decoration: BoxDecoration(
            //         //           color: Colors.redAccent,
            //         //           shape: BoxShape.circle,
            //         //           border: Border.all(color: Colors.white, width: 2),
            //         //         ),
            //         //         constraints: const BoxConstraints(
            //         //           minWidth: 18,
            //         //           minHeight: 18,
            //         //         ),
            //         //         child: const Center(
            //         //           child: Text(
            //         //             '10',
            //         //             style: TextStyle(
            //         //               color: Colors.white,
            //         //               fontSize: 10,
            //         //               fontWeight: FontWeight.bold,
            //         //             ),
            //         //           ),
            //         //         ),
            //         //       ),
            //         //     ),
            //         //   ],
            //         // ),
            //         Center(
            //           child: Container(
            //             decoration: BoxDecoration(
            //               shape: BoxShape.circle,
            //               boxShadow: [
            //                 BoxShadow(
            //                   color: Colors.black.withOpacity(0.15),
            //                   blurRadius: 8,
            //                   offset: const Offset(0, 4),
            //                 ),
            //               ],
            //             ),
            //             child: const CircleAvatar(
            //               radius: 25,
            //               backgroundColor: Colors.white,
            //               backgroundImage: NetworkImage(
            //                 'https://scontent.fdvo8-1.fna.fbcdn.net/v/t39.30808-6/547360770_1845677699697398_2293729068978289129_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=a5f93a&_nc_eui2=AeGtSJZS5L_VHf-C40ys0VI-v_QGWtFMkJO_9AZa0UyQk0-jjt4IpsyP-wn4Wu1k9d4_LdcN8Yg6kNv5mlYeJyDb&_nc_ohc=8zpSuTvkAZ0Q7kNvwGb3AF8&_nc_oc=AdmQdKHi_bP9TXzD7meNi4ZgQJaSjfRhysiVLK3hIjV8mnhSdCpi29G_5TUVWETVzRE&_nc_zt=23&_nc_ht=scontent.fdvo8-1.fna&_nc_gid=xO2lqkvJ3R_QAppRb5dt-g&oh=00_AffNcnENHVAEFc1y1Peqr6QjMSfbzPpjA30WX4Ww70GZKg&oe=69035969', // replace with your image URL
            //               ),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),

            // Summary Cards
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isTablet ? 32 : 20,
                  vertical: 8,
                ),
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
                          _buildSummaryCard(
                            'Net Balance',
                            CurrencyHelper.format(homeCtrl.netBalance.value),
                            LucideIcons.trendingUp,
                            const Color(0xFF7C3AED),
                            '+12.5%',
                            true,
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: _buildSummaryCard(
                                  'Total Income',
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
            ),

            // Recent Activity
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  isTablet ? 32 : 20,
                  isTablet ? 32 : 24,
                  isTablet ? 32 : 20,
                  isTablet ? 12 : 8,
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
                horizontal: isTablet ? 32 : 20,
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
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            'No recent activity found.',
                            style: ShadTheme.of(context).textTheme.small
                                .copyWith(
                                  color: const Color(0xFF6B6B6B),
                                  fontSize: 12,
                                ),
                          ),
                        ),
                      ),
                    );
                  }

                  return SliverList.builder(
                    itemCount: activities.length > 4 ? 4 : activities.length,
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

            SliverPadding(
              padding: EdgeInsets.fromLTRB(
                isTablet ? 32 : 20,
                8,
                isTablet ? 32 : 20,
                isTablet ? 32 : 24,
              ),
              sliver: SliverList(delegate: SliverChildListDelegate([])),
            ),
          ],
        ),
      ),

      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Income Button
          FloatingActionButton(
            heroTag: 'add-income',
            onPressed: () => showShadSheet(
              side: ShadSheetSide.bottom,
              context: context,
              builder: (context) => _showAddIncomeSheet(
                context,
                incomeController,
                ShadSheetSide.bottom,
              ),
            ),
            backgroundColor: const Color(0xFF7C3AED),
            elevation: 2,
            child: const Icon(
              LucideIcons.arrowUp,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(height: 12),
          // Expense Button
          FloatingActionButton(
            heroTag: 'add-expense',
            onPressed: () => showShadSheet(
              side: ShadSheetSide.bottom,
              context: context,
              builder: (context) => _showAddExpenseSheet(
                context,
                expenseController,
                ShadSheetSide.bottom,
              ),
            ),
            backgroundColor: const Color(0xFFEF4444),
            elevation: 2,
            child: const Icon(
              LucideIcons.arrowDown,
              color: Colors.white,
              size: 24,
            ),
          ),
        ],
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

  Widget _buildActionCard(
    String label,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: color.withOpacity(0.1), width: 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(icon, color: color, size: 28),
              ),
              const SizedBox(height: 12),
              Flexible(
                child: Text(
                  label,
                  style: ShadTheme.of(context).textTheme.h4.copyWith(
                    fontSize: 14,
                    color: const Color(0xFF1A1A1A),
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
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

Widget _buildActionButton({required IconData icon, required String label}) {
  return Column(children: [

    ],
  );
}
