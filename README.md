# dart_sql [Work In Progress]

A declarative SQL front end for any SQL libriary like `moor:ffi` or `sqflite` that enables you to construct queries that look like ...

```dart
SQL.select().from('aircraft').where('tail_number').contains('N%').orderBy('model').asc.toString()
```

## Advantages

1. Exact knowledge of SQL syntax is unecessary, auto-competion will provide guidance
2. No need to contruct cumbersome SQL strings
3. Results in much clearner "pure-dart" code
4. Does not require Flutter, can be used for CLI and Server applications of Dart