import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:income_tracker_app/features/home/home_controller.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class IncomeExpenseChart extends StatelessWidget {
  const IncomeExpenseChart({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCtrl = Get.find<HomeController>();

    return Obx(() {
      // Early return if no data
      if (homeCtrl.incomes.isEmpty && homeCtrl.expenses.isEmpty) {
        return _buildEmptyState();
      }

      final incomeSpots = _mapToSpots(homeCtrl.incomes);
      final expenseSpots = _mapToSpots(homeCtrl.expenses);

      // Calculate max value for better Y-axis scaling
      final maxY = _calculateMaxY(incomeSpots, expenseSpots);

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Income vs Expenses",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              // Legend
              Row(
                children: [
                  _buildLegendItem(const Color(0xff23b26a), 'Income'),
                  const SizedBox(width: 16),
                  _buildLegendItem(const Color(0xfff8766b), 'Expense'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0, top: 8.0),
              child: LineChart(
                mainData(incomeSpots, expenseSpots, maxY, homeCtrl, context),
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
              ),
            ),
          ),
        ],
      );
    });
  }

  LineChartData mainData(
    List<FlSpot> incomeSpots,
    List<FlSpot> expenseSpots,
    double maxY,
    HomeController homeCtrl,
    BuildContext context,
  ) {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: maxY > 0 ? maxY / 5 : 20,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(color: Colors.grey.withOpacity(0.15), strokeWidth: 1);
        },
        getDrawingVerticalLine: (value) {
          return FlLine(color: Colors.grey.withOpacity(0.15), strokeWidth: 1);
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: (value, meta) {
              // Only show labels for valid indices
              if (value.toInt() >= homeCtrl.incomes.length &&
                  value.toInt() >= homeCtrl.expenses.length) {
                return const SizedBox.shrink();
              }

              final style = TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              );

              return SideTitleWidget(
                space: 8,
                meta: meta,
                child: Text(
                  _getDateLabel(value.toInt(), homeCtrl),
                  style: style,
                ),
              );
            },
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: maxY > 0 ? maxY / 5 : 20,
            getTitlesWidget: (value, meta) {
              final style = TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              );

              return SideTitleWidget(
                meta: meta,
                space: 8,
                child: Text(_formatCurrency(value), style: style),
              );
            },
            reservedSize: 50,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: Colors.grey.withOpacity(0.2), width: 1),
      ),
      minX: 0,
      maxX:
          (incomeSpots.length > expenseSpots.length
                  ? incomeSpots.length
                  : expenseSpots.length)
              .toDouble() -
          1,
      minY: 0,
      maxY: maxY > 0 ? maxY * 1.15 : 100, // Add 15% padding
      lineTouchData: LineTouchData(
        enabled: true,
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (touchedSpot) => Colors.black87,
          tooltipPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
          tooltipMargin: 8,
          getTooltipItems: (touchedSpots) {
            return touchedSpots.map((spot) {
              final isIncome = spot.barIndex == 0;
              final color = isIncome
                  ? const Color(0xff23b26a)
                  : const Color(0xfff8766b);

              return LineTooltipItem(
                '${isIncome ? "Income" : "Expense"}\n₱${_formatTooltipCurrency(spot.y)}',
                ShadTheme.of(context).textTheme.h1.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
                children: [
                  TextSpan(
                    text: '',
                    style: TextStyle(
                      color: color.withOpacity(0.8),
                      fontSize: 11,
                    ),
                  ),
                ],
              );
            }).toList();
          },
        ),
        getTouchedSpotIndicator: (barData, spotIndexes) {
          return spotIndexes.map((spotIndex) {
            return TouchedSpotIndicatorData(
              FlLine(
                color: Colors.grey.withOpacity(0.5),
                strokeWidth: 2,
                dashArray: [5, 5],
              ),
              FlDotData(
                show: true,
                getDotPainter: (spot, percent, barData, index) {
                  return FlDotCirclePainter(
                    radius: 6,
                    color: barData.color ?? Colors.white,
                    strokeWidth: 3,
                    strokeColor: Colors.white,
                  );
                },
              ),
            );
          }).toList();
        },
      ),
      lineBarsData: [
        // Income Line
        LineChartBarData(
          spots: incomeSpots,
          isCurved: true,
          curveSmoothness: 0.35,
          color: const Color(0xff23b26a),
          barWidth: 4,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
            getDotPainter: (spot, percent, barData, index) {
              return FlDotCirclePainter(
                radius: 5,
                color: const Color(0xff23b26a),
                strokeWidth: 2.5,
                strokeColor: Colors.white,
              );
            },
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                const Color(0xff23b26a).withOpacity(0.25),
                const Color(0xff23b26a).withOpacity(0.05),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          shadow: Shadow(
            color: const Color(0xff23b26a).withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ),
        // Expense Line
        LineChartBarData(
          spots: expenseSpots,
          isCurved: true,
          curveSmoothness: 0.35,
          color: const Color(0xfff8766b),
          barWidth: 4,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
            getDotPainter: (spot, percent, barData, index) {
              return FlDotCirclePainter(
                radius: 5,
                color: const Color(0xfff8766b),
                strokeWidth: 2.5,
                strokeColor: Colors.white,
              );
            },
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                const Color(0xfff8766b).withOpacity(0.25),
                const Color(0xfff8766b).withOpacity(0.05),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          shadow: Shadow(
            color: const Color(0xfff8766b).withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Container(
      height: 250,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200, width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.insert_chart_outlined_rounded,
            size: 56,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 16),
          Text(
            'No data available',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade700,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Add income or expenses to see the chart',
            style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 4,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  List<FlSpot> _mapToSpots(List<dynamic> data) {
    if (data.isEmpty) return [];

    return data.asMap().entries.map((entry) {
      final x = entry.key.toDouble();
      final y = (entry.value.amount ?? 0).toDouble();
      return FlSpot(x, y);
    }).toList();
  }

  double _calculateMaxY(List<FlSpot> income, List<FlSpot> expense) {
    if (income.isEmpty && expense.isEmpty) return 100;

    final maxIncome = income.isEmpty
        ? 0.0
        : income.map((e) => e.y).reduce((a, b) => a > b ? a : b);
    final maxExpense = expense.isEmpty
        ? 0.0
        : expense.map((e) => e.y).reduce((a, b) => a > b ? a : b);

    final max = maxIncome > maxExpense ? maxIncome : maxExpense;
    return max > 0 ? max : 100;
  }

  String _formatCurrency(double value) {
    if (value >= 1000000) {
      return '${(value / 1000000).toStringAsFixed(1)}M';
    } else if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(1)}K';
    }
    return value.toStringAsFixed(0);
  }

  String _formatTooltipCurrency(double value) {
    if (value >= 1000000) {
      return '${(value / 1000000).toStringAsFixed(2)}M';
    } else if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(2)}K';
    }
    return value.toStringAsFixed(2);
  }

  String _getDateLabel(int index, HomeController homeCtrl) {
    // Try to get date from income entries first
    if (index < homeCtrl.incomes.length) {
      final date = homeCtrl.incomes[index].createdAt;
      return '${date.month}/${date.day}';
    }

    // Try to get date from expenses
    if (index < homeCtrl.expenses.length) {
      final date = homeCtrl.expenses[index].expenseDate;
      return '${date.month}/${date.day}';
    }

    // Fallback to simple numbering
    return '${index + 1}';
  }
}
