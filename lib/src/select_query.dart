import 'package:dart_sql/src/sql_from.dart';
import 'package:dart_sql/src/sql_writer.dart';

class SQLSelectQuery extends SQLWriter {
  SQLSelectQuery({List<String> projection, SQLWriter parent}) : super(parent);

  List<String> projection;

  SQLFrom from(String tableName) {
    return SQLFrom(tableName: tableName, parent: this);
  }

  @override
  void writeTo(StringSink sink) {
    sink.write('SELECT ');
    if (projection == null || projection.isEmpty) {
      sink.write('* ');
    } else {
      sink.writeAll(projection);
    }
  }
}
