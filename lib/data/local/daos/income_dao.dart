import 'package:drift/drift.dart';
import '../app_database.dart';

part 'income_dao.g.dart';

@DriftAccessor(tables: [IncomeEntries, IncomeSources, Consumers])
class IncomeDao extends DatabaseAccessor<AppDatabase> with _$IncomeDaoMixin {
  IncomeDao(super.db);

  Future<List<IncomeEntryWithSource>> getAllIncomeEntries() async {
    final query = select(incomeEntries).join([
      leftOuterJoin(
        incomeSources,
        incomeSources.sourceId.equalsExp(incomeEntries.incomeSourceId),
        
      ),
      leftOuterJoin(consumers, consumers.consumerId.equalsExp(incomeEntries.currentConsumerId))
    ]);

    

    return await query.map((row) {
      final entry = row.readTable(incomeEntries);
      final source = row.readTableOrNull(incomeSources);
      final consumer = row.readTableOrNull(consumers);
      return IncomeEntryWithSource(entry, source, consumer);
    }).get();
  }

}
class IncomeEntryWithSource {
  final IncomeEntry entry;
  final IncomeSource? source;
  final Consumer? consumer;
  IncomeEntryWithSource(this.entry, this.source, this.consumer);
}


