import 'package:dart_sql/src/sql_values.dart';
import 'package:dart_sql/src/sql_writer.dart';

class SQLInto extends SQLWriter {
  SQLInto({this.tableName, SQLWriter parent}) : super(parent);

  String tableName;

  SQLValues values(Map<String, dynamic> values) {
    return SQLValues(values: values, parent: this);
  }

  @override
  void writeTo(StringSink sink) {
    sink.write('INTO $tableName ');
  }
}
