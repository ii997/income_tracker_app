import 'package:drift/drift.dart';
import '../app_database.dart';

part 'categories_dao.g.dart';

@DriftAccessor(tables: [IncomeCategories])
class CategoriesDao extends DatabaseAccessor<AppDatabase>
    with _$CategoriesDaoMixin {
  CategoriesDao(super.db);

  // Income Categories DAO methods
  Future<List<IncomeCategory>> getAllCategories() =>
      select(incomeCategories).get();

  Future<int> insertCategory(IncomeCategoriesCompanion category) =>
      into(incomeCategories).insert(category);

  Future<bool> updateCategory(IncomeCategory category) =>
      update(incomeCategories).replace(category);

  Future<int> deleteCategory(IncomeCategoriesCompanion category) =>
      delete(incomeCategories).delete(category);
}
