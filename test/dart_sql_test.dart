import 'package:test/test.dart';

import 'package:dart_sql/dart_sql.dart';

void main() {
  group('SELECT Tests', () {
    test('SELECT * FROM aircraft', () {
      var sql = SQL.select([]).from('aircraft').toString();
      expect(sql, 'SELECT * FROM aircraft');
    });

    test('SELECT id, model, year FROM aircraft', () {
      var sql = SQL.select(['id', 'model', 'year']).from('aircraft').toString();
      expect(sql, 'SELECT id, model, year FROM aircraft');
    });

    test('SELECT * FROM aircraft ORDER BY model', () {
      var sql = SQL.select().from('aircraft').orderBy(['model']).toString();
      expect(sql, 'SELECT * FROM aircraft ORDER BY model');
    });

    test('SELECT * FROM aircraft ORDER BY model, year', () {
      var sql =
          SQL.select().from('aircraft').orderBy(['model', 'year']).toString();
      expect(sql, 'SELECT * FROM aircraft ORDER BY model, year');
    });

    test('SELECT * FROM aircraft WHERE model = "SR22" ORDER BY model', () {
      var sql = SQL
          .select()
          .from('aircraft')
          .where('model')
          .eq('SR22')
          .orderBy(['model']).toString();
      expect(sql, 'SELECT * FROM aircraft WHERE model = "SR22" ORDER BY model');
    });

    test('SELECT * FROM aircraft WHERE NOT model = "SR22"', () {
      var sql = SQL
          .select([])
          .from('aircraft')
          .where()
          .not('model')
          .eq('SR22')
          .toString();
      expect(sql, 'SELECT * FROM aircraft WHERE NOT model = "SR22"');
    });

    test(
        'SELECT * FROM aircraft WHERE NOT model = "SR22" AND NOT model = "SR22T"',
        () {
      var sql = SQL
          .select([])
          .from('aircraft')
          .where()
          .not('model')
          .eq('SR22')
          .and()
          .not('model')
          .eq('SR22T')
          .toString();
      expect(sql,
          'SELECT * FROM aircraft WHERE NOT model = "SR22" AND NOT model = "SR22T"');
    });

    test(
        'SELECT * FROM aircraft WHERE model = "SR22" AND landing_weight >= 3000',
        () {
      var sql = SQL
          .select()
          .from('aircraft')
          .where('model')
          .eq('SR22')
          .and('landing_weight')
          .gte(3000)
          .toString();
      expect(sql,
          'SELECT * FROM aircraft WHERE model = "SR22" AND landing_weight >= 3000');
    });

    test(
        'SELECT * FROM aircraft WHERE model = "SR22" AND year > 2000 OR year <= 2020',
        () {
      var sql = SQL
          .select([])
          .from('aircraft')
          .where('model')
          .eq('SR22')
          .and('year')
          .gt(2000)
          .or('year')
          .lte(2020)
          .toString();
      expect(sql,
          'SELECT * FROM aircraft WHERE model = "SR22" AND year > 2000 OR year <= 2020');
    });

    test('SELECT * FROM aircraft WHERE model IN ("SR22", "C172", "C170")', () {
      var sql = SQL
          .select()
          .from('aircraft')
          .where('model')
          .inList(["SR22", "C172", "C170"]).toString();

      expect(sql,
          'SELECT * FROM aircraft WHERE model IN ("SR22", "C172", "C170")');
    });

    test('SELECT * FROM aircraft WHERE model IN SELECT name FROM models', () {
      var sql = SQL
          .select()
          .from('aircraft')
          .where('model')
          .inSelect(['name'])
          .from('models')
          .toString();

      expect(
          sql, 'SELECT * FROM aircraft WHERE model IN SELECT name FROM models');
    });

    test('SELECT * FROM aircraft WHERE year BETWEEN 2000 AND 2020', () {
      var sql = SQL
          .select()
          .from('aircraft')
          .where('year')
          .between(2000, 2020)
          .toString();

      expect(sql, 'SELECT * FROM aircraft WHERE year BETWEEN 2000 AND 2020');
    });
  });

  group('DELETE Tests', () {
    test('DELETE FROM aircraft', () {
      final sql = SQL.delete().from('aircraft').toString();
      expect(sql, 'DELETE FROM aircraft');
    });

    test('DELETE FROM aircraft WHERE model = "SR22"', () {
      final sql =
          SQL.delete().from('aircraft').where('model').eq("SR22").toString();
      expect(sql, 'DELETE FROM aircraft WHERE model = "SR22"');
    });

    test('DELETE FROM aircraft WHERE NOT model = "SR22"', () {
      final sql = SQL
          .delete()
          .from('aircraft')
          .where()
          .not('model')
          .eq("SR22")
          .toString();
      expect(sql, 'DELETE FROM aircraft WHERE NOT model = "SR22"');
    });
  });

  group('Insert Queries', () {
    test('INSERT INTO aircraft (model, year) VALUES ("SR22", "2014")', () {
      Map<String, dynamic> values = {"model": "SR22", "year": "2014"};
      final sql = SQL.insert().into('aircraft').values(values).toString();
      expect(sql, 'INSERT INTO aircraft (model, year) VALUES ("SR22", "2014")');
    });

    test(
        'INSERT OR REPLACE INTO aircraft (model, year) VALUES ("SR22", "2014")',
        () {
      Map<String, dynamic> values = {"model": "SR22", "year": "2014"};
      final sql =
          SQL.insert().orReplace().into('aircraft').values(values).toString();
      expect(sql,
          'INSERT OR REPLACE INTO aircraft (model, year) VALUES ("SR22", "2014")');
    });
  });
}
