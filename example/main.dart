import 'package:dart_sql/dart_sql.dart';

void main() {
  // SELECT * FROM aircraft
  SQL.select().from('aircraft').toString();

  // SELECT id, model, year FROM aircraft
  SQL.select(['id', 'model', 'year']).from('aircraft').toString();
}
