# dart_sql

A declarative SQL front end for `moor:ffi` that enables you to construct queries that look like ...

```dart
select().from('aircraft').where('tail_number').contains('N%').orderBy('model').asc.toString()
```
