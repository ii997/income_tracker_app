import 'package:drift/drift.dart';
import '../app_database.dart';

part 'expense_dao.g.dart';

@DriftAccessor(tables: [Expenses, RecentActivity])
class ExpenseDao extends DatabaseAccessor<AppDatabase> with _$ExpenseDaoMixin {
  ExpenseDao(super.db);

  Future<double> getTotalExpense() async {
    final result = await (select(
      expenses,
    )..where((tbl) => tbl.amount.isBiggerThanValue(0))).get();
    return result.fold<double>(0.0, (sum, entry) => sum + entry.amount);
  }

  Future<Expense> insertExpense(ExpensesCompanion expense) async {
    return transaction(() async {
      try {
        // 1️⃣ Insert the expense
        final insertedExpense = await into(expenses).insertReturning(expense);

        // 2️⃣ Insert into recent_activity table
        final activity = RecentActivityCompanion.insert(
          type: 'expense',
          description: Value(expense.category.value ?? 'No Description'),
          amount: expense.amount.value,
        );
        await into(recentActivity).insert(activity);

        print('✅ Both expense and recent activity inserted successfully');

        return insertedExpense;
      } catch (e, stack) {
        print('❌ Failed to insert expense and activity: $e');
        print(stack);
        rethrow; // optional: rethrow if you want the controller to handle it
      }
    });
  }

  // in expense_dao.dart
  Stream<double> watchTotalExpense(int year, int month) {
    final startOfMonth = DateTime(year, month, 1);
    final endOfMonth = DateTime(year, month + 1, 1);

    return (select(expenses)
          ..where((tbl) => tbl.amount.isBiggerThanValue(0))
          ..where((tbl) => tbl.createdAt.isBiggerOrEqualValue(startOfMonth))
          ..where((tbl) => tbl.createdAt.isSmallerThanValue(endOfMonth)))
        .watch()
        .map((rows) => rows.fold<double>(0.0, (sum, row) => sum + row.amount));
  }

  // Income DAO
  Stream<List<Expense>> watchAllExpenseEntries() {
    return (select(
      expenses,
    )..orderBy([(t) => OrderingTerm.desc(t.expenseDate)])).watch();
  }
}
