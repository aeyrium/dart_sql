import 'package:dart_sql/src/sql_where_clause.dart';
import 'package:dart_sql/src/sql_writer.dart';

class SQLSetValues extends SQLWriter {
  SQLSetValues({this.tableName, this.values, SQLWriter parent}) : super(parent);

  String tableName;
  Map<String, dynamic> values;

  SQLWhereClause where(String column) {
    return SQLWhereClause(parent: this, column: column);
  }

  @override
  void writeTo(StringSink sink) {
    sink.write('$tableName SET ');

    int count = 0;
    values.forEach((column, value) {
      sink.write('$column = ${writeVal(value)}');
      if (count < values.length - 1) {
        sink.write(', ');
      } else {
        sink.write(' ');
      }
      count++;
    });
  }
}
