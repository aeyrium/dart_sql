library dart_sql;

import 'package:dart_sql/src/delete_query.dart';
import 'package:dart_sql/src/select_query.dart';

abstract class SQL {
  static SQLSelectQuery select([List<String> projection]) {
    return SQLSelectQuery(projection: projection, parent: null);
  }

  static SQLDeleteQuery delete() {
    return SQLDeleteQuery();
  }
}
