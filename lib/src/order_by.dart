import 'package:dart_sql/src/sql_writer.dart';

class SQLOrderBy extends SQLWriter {
  SQLOrderBy({SQLWriter parent, this.columns}) : super(parent);

  List<String> columns;

  String _suffix;

  SQLOrderBy having() {
    return this;
  }

  SQLOrderBy get asc {
    _suffix = 'ASC';
    return this;
  }

  SQLOrderBy get desc {
    _suffix = 'DESC';
    return this;
  }

  @override
  void writeTo(StringSink sink) {
    sink.write('ORDER BY ');
    sink.writeAll(columns, ', ');
    if (_suffix != null) {
      sink.write(' $_suffix');
    }
  }
}
