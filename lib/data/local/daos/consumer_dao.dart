import 'package:drift/drift.dart';
import '../app_database.dart';

part 'consumer_dao.g.dart';

@DriftAccessor(tables: [Consumers])
class ConsumersDao extends DatabaseAccessor<AppDatabase>
    with _$ConsumersDaoMixin {
  ConsumersDao(super.db);

    // Income Categories DAO methods
  Future<List<Consumer>> getAllConsumers() =>
      select(consumers).get();


}
