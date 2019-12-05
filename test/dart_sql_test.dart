import 'package:flutter_test/flutter_test.dart';

import 'package:dart_sql/dart_sql.dart';

void main() {
  group('SELECT Tests', () {
    test('SELECT * FROM aircraft', () {
      var sql = SQL.select([]).from('aircraft').toString();
      expect(sql, 'SELECT * FROM aircraft');
    });

    test('SELECT * FROM aircraft ORDER BY ', () {
      var sql = SQL.select([]).from('aircraft').toString();
      expect(sql, 'SELECT * FROM aircraft');
    });

    test('SELECT * FROM aircraft WHERE model = "SR22"', () {
      var sql =
          SQL.select([]).from('aircraft').where('model').eq('SR22').toString();
      expect(sql, 'SELECT * FROM aircraft WHERE model = "SR22"');
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
  });
}
