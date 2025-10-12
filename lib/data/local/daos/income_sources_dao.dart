import 'package:drift/drift.dart';
import '../app_database.dart';

part 'income_sources_dao.g.dart';

@DriftAccessor(tables: [IncomeSources, IncomeCategories], views: [IncomeSourcesWithCategory])
class IncomeSourcesDAO extends DatabaseAccessor<AppDatabase> with _$IncomeSourcesDAOMixin { 
  IncomeSourcesDAO(super.db);

   Future<List<IncomeSourcesWithCategoryData>> getSourcesWithCategory() {
    return select(incomeSourcesWithCategory).get();
  }

}