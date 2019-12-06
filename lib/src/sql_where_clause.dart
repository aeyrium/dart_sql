import 'package:dart_sql/src/sql_expression.dart';
import 'package:dart_sql/src/sql_writer.dart';

class SQLWhereClause extends SQLExpression {
  SQLWhereClause({SQLWriter parent, this.column}) : super(parent: parent);

  String column;

  @override
  void writeTo(StringSink sink) {
    sink.write('WHERE ');
    if (column != null) {
      sink.write('$column ');
    }
  }
}
