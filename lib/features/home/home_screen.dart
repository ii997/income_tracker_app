import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:income_tracker_app/features/home/home_controller.dart';
import 'package:income_tracker_app/features/incomes/income_controller.dart';
import 'package:income_tracker_app/router/app_router.dart';
import 'package:income_tracker_app/shared/helpers.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.find<HomeController>();
  final incomeController = Get.find<IncomeController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F7FC),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // App Bar
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  isTablet ? 32 : 20,
                  isTablet ? 24 : 16,
                  isTablet ? 32 : 20,
                  isTablet ? 16 : 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dashboard',
                          style: TextStyle(
                            fontSize: isTablet ? 32 : 28,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF1A1A1A),
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _getGreeting(),
                          style: TextStyle(
                            fontSize: isTablet ? 16 : 14,
                            color: const Color(0xFF6B6B6B),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Stack(
  clipBehavior: Clip.none,
  children: [
    Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF7C3AED).withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const Icon(
        LucideIcons.bell,
        color: Color(0xFF7C3AED),
        size: 25,
      ),
    ),

    // 🔴 Notification bubble
    Positioned(
  right: 4,
  top: 4,
  child: Container(
    padding: const EdgeInsets.all(4),
    decoration: BoxDecoration(
      color: Colors.redAccent,
      shape: BoxShape.circle,
      border: Border.all(color: Colors.white, width: 2),
    ),
    constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
    child: const Center(
      child: Text(
        '10',
        style: TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ),
),
  ],
)

                  ],
                ),
              ),
            ),

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
                                incomeController.totalIncome
                                    .toString(),
                                LucideIcons.calendar,
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
                                'Categories',
                                incomeController.totalCategories.toString(),
                                LucideIcons.tag,
                                const Color(0xFFA78BFA),
                                null,
                                false,
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                    return Obx(()=>
                      Column(
                        children: [
                          _buildSummaryCard(
                            'Total Income',
                            CurrencyHelper.format(incomeController.totalIncome.value),
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
                                          'This Month',
                                          CurrencyHelper.format(incomeController
                                              .totalIncome.value),
                                          LucideIcons.calendar,
                                          const Color(0xFF8B5CF6),
                                          '+8.2%',
                                          true,
                                        ),
                                      ),
                              
                              const SizedBox(width: 12),
                              Obx(
                                () => Expanded(
                                  child: _buildSummaryCard(
                                    'Categories',
                                    incomeController.totalCategories.toString(),
                                    LucideIcons.tag,
                                    const Color(0xFFA78BFA),
                                    null,
                                    false,
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

            // Quick Actions
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  isTablet ? 32 : 20,
                  isTablet ? 32 : 24,
                  isTablet ? 32 : 20,
                  isTablet ? 12 : 8,
                ),
                child: Text(
                  'Quick Actions',
                  style: TextStyle(
                    fontSize: isTablet ? 20 : 18,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1A1A1A),
                  ),
                ),
              ),
            ),

            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: isTablet ? 32 : 20,
                vertical: 8,
              ),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isTablet ? 4 : 2,
                  childAspectRatio: 1.3,
                  crossAxisSpacing: isTablet ? 16 : 12,
                  mainAxisSpacing: isTablet ? 16 : 12,
                ),
                delegate: SliverChildListDelegate([
                  _buildActionCard(
                    'Incomes',
                    LucideIcons.trendingUp,
                    const Color(0xFF7C3AED),
                    () => Get.toNamed(AppRouter.incomes),
                  ),
                  _buildActionCard(
                    'Categories',
                    LucideIcons.grid3x3,
                    const Color(0xFF8B5CF6),
                    () => Get.toNamed(AppRouter.categories),
                  ),
                  _buildActionCard(
                    'Sources',
                    LucideIcons.briefcase,
                    const Color(0xFF9333EA),
                    () => Get.toNamed(AppRouter.sources),
                  ),
                  _buildActionCard(
                    'Reports',
                    LucideIcons.chartBar400,
                    const Color(0xFFA855F7),
                    () {
                      // Navigate to reports
                    },
                  ),
                ]),
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
                  style: TextStyle(
                    fontSize: isTablet ? 20 : 18,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1A1A1A),
                  ),
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
                      'Recent Activity',
                      style: TextStyle(
                        fontSize: isTablet ? 20 : 18,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1A1A1A),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'View All',
                        style: TextStyle(
                          color: Color(0xFF7C3AED),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add new income
        },
        backgroundColor: const Color(0xFF7C3AED),
        elevation: 4,
        icon: const Icon(LucideIcons.plus, color: Colors.white),
        label: const Text(
          'Add Income',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }


  Widget _buildLoadingCard(){
return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.08),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(child: const CircularProgressIndicator(),) , );
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
              if (showChange && change != null)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF10B981).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    change,
                    style: const TextStyle(
                      color: Color(0xFF10B981),
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF6B6B6B),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A1A),
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
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A1A1A),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Income Overview',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF7C3AED).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'This Month',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF7C3AED),
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(
                      LucideIcons.chevronDown,
                      size: 14,
                      color: Color(0xFF7C3AED),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    LucideIcons.chartArea400,
                    size: isTablet ? 64 : 48,
                    color: const Color(0xFF7C3AED).withOpacity(0.3),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Chart visualization will appear here',
                    style: TextStyle(
                      fontSize: isTablet ? 14 : 13,
                      color: const Color(0xFF6B6B6B),
                    ),
                  ),
                ],
              ),
            ),
          ),
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
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF6B6B6B),
                  ),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A1A),
            ),
          ),
        ],
      ),
    );
  }

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good morning';
    if (hour < 17) return 'Good afternoon';
    return 'Good evening';
  }
}
