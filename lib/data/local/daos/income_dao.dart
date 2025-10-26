import 'package:drift/drift.dart';
import '../app_database.dart';

part 'income_dao.g.dart';

@DriftAccessor(tables: [IncomeEntries, RecentActivity])
class IncomeDao extends DatabaseAccessor<AppDatabase> with _$IncomeDaoMixin {
  IncomeDao(super.db);

  Future<double> getTotalIncome() async {
    final result = await (select(
      incomeEntries,
    )..where((tbl) => tbl.amount.isBiggerThanValue(0))).get();
    return result.fold<double>(0.0, (sum, entry) => sum + entry.amount);
  }

  Future<void> insertIncome(IncomeEntriesCompanion income) async {
    await transaction(() async {
      try {
        // 1️⃣ Insert the income
        await into(incomeEntries).insert(income);

        // 2️⃣ Insert into recent_activity table
        final activity = RecentActivityCompanion.insert(
          type: 'income',
          description: Value(income.incomeCategory.value ?? 'No Description'),
          amount: income.amount.value,
        );
        await into(db.recentActivity).insert(activity);

        print('✅ Both income and recent activity inserted successfully');
      } catch (e, stack) {
        print('❌ Failed to insert income and activity: $e');
        print(stack);
        rethrow; // optional: rethrow if you want the controller to handle it
      }
    });
  }

  // in income_dao.dart
  Stream<double> watchTotalIncome() {
    return (select(incomeEntries)
          ..where((tbl) => tbl.amount.isBiggerThanValue(0)))
        .watch()
        .map((rows) => rows.fold<double>(0.0, (sum, row) => sum + row.amount));
  }

  Future<List<IncomeEntry>> getAllIncomeEntries() async {
    return await select(incomeEntries).get();
  }
}
