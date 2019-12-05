import 'package:dart_sql/src/sql_writer.dart';
import 'package:dart_sql/src/where_clause.dart';

class SQLFrom extends SQLWriter {
  SQLFrom({this.tableName, SQLWriter parent}) : super(parent);

  String tableName;

  SQLWhereClause where(column) {
    return SQLWhereClause(column: column, parent: this);
  }

  @override
  void writeTo(StringSink sink) {
    sink.write('FROM $tableName ');
  }
}
