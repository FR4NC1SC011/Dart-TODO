import 'dart:async';
import 'dart:io';
import 'dart:convert';

final path = '/home/franciscoortiz/Desktop/Dart/todo/DB/db.txt';
final file = File('/home/franciscoortiz/Desktop/Dart/todo/DB/db.txt');


void show() async {
  var lineNumber = 0;
  final lines = utf8.decoder
      .bind(file.openRead())
      .transform(const LineSplitter());
  try {
    await for (var line in lines) {
      stdout.write('${lineNumber++}. ');
      stdout.writeln(line);
    }
  } catch(_) {
    await _handleError(path);
  }
}


void write(String task) {
  var sink = file.openWrite(mode: FileMode.append); 
  sink.writeln(task);

  sink.close();

}


void remove(int index) {
  file.readAsLines().then((List<String> lines) {
    lines.removeAt(index);
    final newTextData = lines.join('\n');
    file.writeAsString(newTextData);
  });
}


Future _handleError(String path) async {
  if (await FileSystemEntity.isDirectory(path)) {
    stderr.writeln('error: $path is a directory');
  } else {
    exitCode = 2;
  }
}








