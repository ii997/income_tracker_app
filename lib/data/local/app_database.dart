import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:income_tracker_app/data/local/daos/activity_dao.dart';
import 'package:income_tracker_app/data/local/daos/expense_dao.dart';
// 👈 this one!
import 'daos/income_dao.dart';
part 'app_database.g.dart';

// Income Entries Table
class IncomeEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get amount => real()();
  TextColumn get currency =>
      text().withLength(min: 3, max: 3).withDefault(const Constant('PHP'))();
  BoolColumn get isShared => boolean().withDefault(const Constant(false))();
  RealColumn get amountShared => real().withDefault(const Constant(0.0))();
  RealColumn get sharePercent => real().withDefault(const Constant(0.35))();
  TextColumn get incomeCategory => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

class Expenses extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get amount => real()();
  TextColumn get currency =>
      text().withLength(min: 3, max: 3).withDefault(const Constant('PHP'))();
  TextColumn get category => text().nullable()();
  DateTimeColumn get expenseDate =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

class RecentActivity extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get type => text()(); // 'income' or 'expense'
  RealColumn get amount => real()();
  TextColumn get description => text().nullable()();
  TextColumn get currency =>
      text().withLength(min: 3, max: 3).withDefault(const Constant('PHP'))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

@DriftDatabase(
  tables: [IncomeEntries, Expenses, RecentActivity],
  daos: [IncomeDao, ExpenseDao, ActivityDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
    },
    onUpgrade: (Migrator m, int from, int to) async {
      // Handle future schema migrations here
    },
  );
}

// LazyDatabase _openConnection() {
//   return LazyDatabase(() async {
//     // Get the app's documents directory
//     final dbFolder = await getApplicationDocumentsDirectory();
//     // Define the full path of the SQLite database file
//     final file = File(p.join(dbFolder.path, 'app_database.sqlite'));

//     // Return a NativeDatabase that uses the file (persistent storage)
//     return NativeDatabase(file);
//   });
// }

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    return NativeDatabase.memory();
  });
}
