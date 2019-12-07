import 'package:dart_sql/dart_sql.dart';

void main() {
  // SELECT * FROM aircraft
  SQL.select().from('aircraft').toString();

  // SELECT id, model, year FROM aircraft
  SQL.select(['id', 'model', 'year']).from('aircraft').toString();

  // INSERT INTO aircraft (model, year) VALUES ("SR22", "2014")
  Map<String, dynamic> values = {"model": "SR22", "year": "2014"};
  SQL.insert().into('aircraft').values(values).toString();

  // DELETE FROM aircraft WHERE model = "SR22"'
  SQL.delete().from('aircraft').where('model').eq("SR22").toString();
}
