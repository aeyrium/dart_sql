import 'package:dart_sql/src/sql_from.dart';
import 'package:dart_sql/src/sql_writer.dart';
import 'package:dart_sql/src/sql_where_clause.dart';

class SQLDeleteQuery extends SQLWriter {
  SQLDeleteQuery({SQLWriter parent}) : super(parent);

  SQLFrom from(String tableName) {
    return SQLFrom(tableName: tableName, parent: this);
  }

  SQLWhereClause where(String column) {
    return SQLWhereClause(column: column, parent: this);
  }

  @override
  void writeTo(StringSink sink) {
    sink.write('DELETE ');
  }
}
