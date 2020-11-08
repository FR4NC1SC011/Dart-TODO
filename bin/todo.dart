import 'package:todo/todo.dart' as todo;
import 'package:args/args.dart';
import 'dart:io';

ArgResults argResults;

void main(List<String> arguments) {
  exitCode = 0;
  var write = false;
  var remove = false;
  var helpmsg = false;

  final parser = ArgParser()
      ..addFlag('add', abbr: 'a', help: 'Add a task', callback: (add) {
        if (add)  write = true;
      })
      ..addFlag('show', abbr: 's', help: 'Show the tasks list', callback: (show) {
        if (show) todo.show();
      })
      ..addFlag('did', abbr: 'd', help: 'Remove a task', callback: (did) {
        if (did) remove = true;
      })
      ..addFlag('help', abbr: 'h', help: 'Display help message', callback: (help) {
        if (help) helpmsg = true;
      });


  argResults = parser.parse(arguments);
  final task = argResults.rest;

  var taskString = task.join(" ");

  if (write) {
    todo.write(taskString);
  } else if (remove) {
    todo.remove(int.parse(taskString));
  } else if (helpmsg) {
    print(parser.usage);
  } 

}


