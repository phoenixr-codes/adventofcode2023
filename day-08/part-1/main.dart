import 'dart:io';

void main() {
  final nodePattern =
      RegExp(r'(?<source>\w+) = \((?<left>\w+), (?<right>\w+)\)');

  final file = File('../input.txt');
  var lines = file.readAsLinesSync();

  final directions = lines.removeAt(0);
  lines.removeAt(0); // blank line

  Map<String, (String, String)> nodes = {};
  for (final line in lines) {
    final match = nodePattern.firstMatch(line)!;
    final source = match.namedGroup('source')!;
    final left = match.namedGroup('left')!;
    final right = match.namedGroup('right')!;

    nodes[source] = (left, right);
  }

  final entry = 'AAA';
  final destination = 'ZZZ';

  var current = entry;
  var i = 0;
  while (current != destination) {
    final goto = directions[i % directions.length];
    switch (goto) {
      case 'L':
        current = nodes[current]!.$1;
      case 'R':
        current = nodes[current]!.$2;
    }
    i++;
  }
  print(i);
}
