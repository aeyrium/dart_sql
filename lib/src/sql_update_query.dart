import 'package:dart_sql/src/sql_into.dart';
import 'package:dart_sql/src/sql_set_values.dart';
import 'package:dart_sql/src/sql_writer.dart';

class SQLUpdateQuery extends SQLWriter {
  SQLUpdateQuery() : super(null);

  String _suffix;
  SQLUpdateQuery orReplace() {
    _suffix = 'OR REPLACE';
    return this;
  }

  SQLUpdateQuery orRollback() {
    _suffix = 'OR ROLLBACK';
    return this;
  }

  SQLUpdateQuery orFail() {
    _suffix = 'OR FAIL';
    return this;
  }

  SQLUpdateQuery orAbort() {
    _suffix = 'OR ABORT';
    return this;
  }

  SQLUpdateQuery orIgnore() {
    _suffix = 'OR IGNORE';
    return this;
  }

  SQLSetValues setValues(String tableName, Map<String, dynamic> values) {
    return SQLSetValues(tableName: tableName, values: values, parent: this);
  }

  @override
  void writeTo(StringSink sink) {
    sink.write('UPDATE ');
    if (_suffix != null) {
      sink.write('$_suffix ');
    }
  }
}
