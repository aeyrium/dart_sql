import 'package:dart_sql/src/select_query.dart';
import 'package:dart_sql/src/sql_writer.dart';
import 'package:dart_sql/src/sub_query.dart';

class SQLExpression extends SQLWriter {
  SQLExpression({this.op, this.value, SQLWriter parent}) : super(parent);

  String op;
  dynamic value;

  SQLExpression eq(dynamic val) {
    return SQLExpression(op: '=', value: _writeVal(val), parent: this);
  }

  SQLExpression neq(dynamic val) {
    return SQLExpression(op: '!=', value: _writeVal(val), parent: this);
  }

  SQLExpression gt(dynamic val) {
    return SQLExpression(op: '>', value: _writeVal(val), parent: this);
  }

  SQLExpression lt(dynamic val) {
    return SQLExpression(op: '<', value: _writeVal(val), parent: this);
  }

  SQLExpression gte(dynamic val) {
    return SQLExpression(op: '>=', value: _writeVal(val), parent: this);
  }

  SQLExpression lte(dynamic val) {
    return SQLExpression(op: '<=', value: _writeVal(val), parent: this);
  }

  SQLSubQuery all() {
    return SQLSubQuery.all(this);
  }

  SQLExpression and([String column]) {
    return SQLExpression(op: 'AND', value: column, parent: this);
  }

  SQLSubQuery any() {
    return SQLSubQuery.any(this);
  }

  SQLExpression between(dynamic val1, dynamic val2) {
    return SQLExpression(
        op: 'BETWEEN',
        value: '${_writeVal(val1)} AND ${_writeVal(val2)}',
        parent: this);
  }

  SQLExpression exists() {
    return SQLExpression(op: 'EXISTS', value: null, parent: this);
  }

  SQLExpression inList(List<dynamic> vals) {
    String val = vals.map((val) => _writeVal(val)).join(', ');
    return SQLExpression(op: 'IN', value: '($val)', parent: this);
  }

  SQLSelectQuery inSelect([List<String> projection]) {
    final expr = SQLExpression(op: 'IN', parent: this);
    return SQLSelectQuery(projection: projection, parent: expr);
  }

  SQLExpression like(String pattern) {
    return SQLExpression(op: 'LIKE', value: pattern, parent: this);
  }

  SQLExpression not([String column]) {
    return SQLExpression(op: 'NOT', value: column, parent: this);
  }

  SQLExpression or([String column]) {
    return SQLExpression(op: 'OR', value: column, parent: this);
  }

  @override
  void writeTo(StringSink sink) {
    //assert(op != null);
    if (op != null) {
      sink.write(op);
      sink.write(' ');
    }

    if (value != null) {
      sink.write(value);
      sink.write(' ');
    }
  }

  String _writeVal(dynamic val) {
    return (val is String) ? '"$val"' : '$val';
  }
}
