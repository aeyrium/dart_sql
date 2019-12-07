library dart_sql;

import 'src/sql_delete_query.dart';
import 'src/sql_select_query.dart';
import 'src/sql_insert_query.dart';
import 'src/sql_update_query.dart';

export 'src/sql_delete_query.dart';
export 'src/sql_select_query.dart';
export 'src/sql_insert_query.dart';
export 'src/sql_update_query.dart';

abstract class SQL {
  static SQLSelectQuery select([List<String> projection]) {
    return SQLSelectQuery(projection: projection, parent: null);
  }

  static SQLDeleteQuery delete() {
    return SQLDeleteQuery();
  }

  static SQLInsertQuery insert() {
    return SQLInsertQuery();
  }

  static SQLUpdateQuery update() {
    return SQLUpdateQuery();
  }
}
