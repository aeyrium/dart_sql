library dart_sql;

import 'src/sql_delete_query.dart';
import 'src/sql_select_query.dart';

export 'src/sql_delete_query.dart';
export 'src/sql_select_query.dart';

abstract class SQL {
  static SQLSelectQuery select([List<String> projection]) {
    return SQLSelectQuery(projection: projection, parent: null);
  }

  static SQLDeleteQuery delete() {
    return SQLDeleteQuery();
  }
}
