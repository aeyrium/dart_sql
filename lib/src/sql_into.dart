import 'package:dart_sql/dart_sql.dart';
import 'package:dart_sql/src/sql_default_values.dart';
import 'package:dart_sql/src/sql_values.dart';
import 'package:dart_sql/src/sql_writer.dart';

class SQLInto extends SQLWriter {
  SQLInto({this.tableName, SQLWriter parent}) : super(parent);

  String tableName;

  String asName;

  SQLValues values(Map<String, dynamic> values) {
    return SQLValues(values: values, parent: this);
  }

  SQLSelectQuery select([List<String> projection]) {
    return SQLSelectQuery(projection: projection, parent: this);
  }

  SQLDefaultValues defaultValues() {
    return SQLDefaultValues(this);
  }

  @override
  void writeTo(StringSink sink) {
    sink.write('INTO $tableName ');
    if (asName != null) {
      sink.write('AS $asName ');
    }
  }
}
