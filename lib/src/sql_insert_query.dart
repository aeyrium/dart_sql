import 'package:dart_sql/src/sql_into.dart';
import 'package:dart_sql/src/sql_writer.dart';

class SQLInsertQuery extends SQLWriter {
  SQLInsertQuery() : super(null);

  String _suffix;
  SQLInsertQuery orReplace() {
    _suffix = 'OR REPLACE';
    return this;
  }

  SQLInsertQuery orRollback() {
    _suffix = 'OR ROLLBACK';
    return this;
  }

  SQLInsertQuery orFail() {
    _suffix = 'OR FAIL';
    return this;
  }

  SQLInsertQuery orAbort() {
    _suffix = 'OR ABORT';
    return this;
  }

  SQLInsertQuery orIgnore() {
    _suffix = 'OR IGNORE';
    return this;
  }

  SQLInto into(String tableName) {
    return SQLInto(tableName: tableName, parent: this);
  }

  @override
  void writeTo(StringSink sink) {
    sink.write('INSERT ');
    if (_suffix != null) {
      sink.write('$_suffix ');
    }
  }
}
