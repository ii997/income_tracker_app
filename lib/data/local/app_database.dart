import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:income_tracker_app/data/local/daos/consumer_dao.dart';
import 'daos/categories_dao.dart';
import 'daos/income_dao.dart';
import 'daos/income_sources_dao.dart';

part 'app_database.g.dart';

// Income Categories Table
class IncomeCategories extends Table {
  IntColumn get categoryId => integer().autoIncrement()();
  TextColumn get categoryName => text().withLength(min: 1, max: 50)();
  TextColumn get categoryDescription => text()();
  BoolColumn get categoryisActiveStatus =>
      boolean().withDefault(const Constant(true))();
  DateTimeColumn get categoryCreatedAt =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get categoryUpdatedAt =>
      dateTime().withDefault(currentDateAndTime)();
}

// Income Sources Table
class IncomeSources extends Table {
  IntColumn get sourceId => integer().autoIncrement()();
  TextColumn get sourceName => text().withLength(min: 1, max: 100)();
  IntColumn get sourceCategoryId =>
      integer().references(IncomeCategories, #categoryId)();
  BoolColumn get sourceisActiveStatus =>
      boolean().withDefault(const Constant(true))();
  DateTimeColumn get sourceCreatedAt =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get sourceUpdatedAt =>
      dateTime().withDefault(currentDateAndTime)();
}

// Income Entries Table
class IncomeEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get amount => real()();
  TextColumn get currency =>
      text().withLength(min: 3, max: 3).withDefault(const Constant('PHP'))();
  BoolColumn get isShared => boolean().withDefault(const Constant(false))();
  RealColumn get amountShared => real().withDefault(const Constant(0.0))();
  RealColumn get sharePercent => real().withDefault(const Constant(0.35))();
  IntColumn get incomeSourceId => integer().references(IncomeSources, #sourceId)();
  IntColumn get currentConsumerId => integer().references(Consumers, #consumerId)();
  TextColumn get description => text().nullable()();
  DateTimeColumn get incomeDate => dateTime()();
  BoolColumn get isRecurring => boolean().withDefault(const Constant(false))();
  TextColumn get recurringPattern =>
      text().nullable()(); // daily, weekly, monthly, yearly
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

class Consumers extends Table {
  IntColumn get consumerId => integer().autoIncrement()();
  TextColumn get consumerName => text().withDefault(const Constant('John Doe'))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}



abstract class IncomeSourcesWithCategory extends View {
  IncomeSources get incomeSources;
  IncomeCategories get incomeCategories;

  @override
  Query as() =>
      select([
        incomeSources.sourceId,
        incomeSources.sourceName,
        incomeSources.sourceCategoryId,
        incomeSources.sourceisActiveStatus,
        incomeSources.sourceCreatedAt,
        incomeSources.sourceUpdatedAt,

        incomeCategories.categoryId,
        incomeCategories.categoryName,
        incomeCategories.categoryDescription,
        incomeCategories.categoryisActiveStatus,
        incomeCategories.categoryCreatedAt,
        incomeCategories.categoryUpdatedAt,
      ]).from(incomeSources).join([
        innerJoin(
          incomeCategories,
          incomeSources.sourceCategoryId.equalsExp(incomeCategories.categoryId),
        ),
      ]);
}

@DriftDatabase(
  tables: [IncomeCategories, IncomeSources, IncomeEntries, Consumers],
  daos: [IncomeSourcesDAO, IncomeDao, CategoriesDao, ConsumersDao],
  views: [IncomeSourcesWithCategory],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  Future<double> getMonthlyIncome(int year, int month) async {
  // Compute range of that month
  final start = DateTime(year, month, 1);
  final end = DateTime(year, month + 1, 1);

  final result = await (selectOnly(incomeEntries)
        ..addColumns([incomeEntries.amount.sum()])
        ..where(incomeEntries.incomeDate.isBiggerOrEqualValue(start))
        ..where(incomeEntries.incomeDate.isSmallerThanValue(end)))
      .getSingle();

  return result.read(incomeEntries.amount.sum()) ?? 0.0;
}

  Future<double> getTotalIncome(int year) async {
  final result = await (selectOnly(incomeEntries)
        ..addColumns([incomeEntries.amount.sum()])
        ..where(incomeEntries.incomeDate.isBiggerOrEqualValue(DateTime(year)))
        )
      .getSingle();

  return result.read(incomeEntries.amount.sum()) ?? 0.0;
}
  Future<int> getTotalCategories() async {
  final result = await (selectOnly(incomeCategories)
        ..addColumns([incomeCategories.categoryId.count()])
        )
      .getSingle();

  return result.read(incomeCategories.categoryId.count()) ?? 0;
}


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

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    return NativeDatabase.memory();
  });
}
