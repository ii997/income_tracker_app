import 'package:drift/drift.dart';
import 'package:income_tracker_app/data/local/app_database.dart';

part 'activity_dao.g.dart';

@DriftAccessor(tables: [RecentActivity])
class ActivityDao extends DatabaseAccessor<AppDatabase>
    with _$ActivityDaoMixin {
  ActivityDao(super.db);

  Stream<List<RecentActivityData>> watchRecentActivities() {
    return (select(
      recentActivity,
    )..orderBy([(t) => OrderingTerm.desc(t.createdAt)])).watch();
  }
}
