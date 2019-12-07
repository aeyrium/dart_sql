import 'package:dart_sql/src/sql_writer.dart';

class SQLDefaultValues extends SQLWriter {
  SQLDefaultValues(SQLWriter parent) : super(parent);

  @override
  void writeTo(StringSink sink) {
    sink.write('DEFAULT VALUES');
  }
}
