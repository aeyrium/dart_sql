abstract class SQLWriter {
  SQLWriter parent;

  SQLWriter(this.parent);

  void writeTo(StringSink sink);

  @override
  String toString() {
    final StringBuffer buffer = StringBuffer();
    _writeTo(this, buffer);
    return buffer.toString().trimRight();
  }

  void _writeTo(SQLWriter writer, StringSink sink) {
    if (writer.parent != null) {
      writer.parent._writeTo(writer.parent, sink);
    }
    writer.writeTo(sink);
  }
}

String writeVal(dynamic val) {
  return (val is String) ? '"$val"' : '$val';
}
