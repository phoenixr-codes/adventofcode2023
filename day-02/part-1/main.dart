import 'dart:convert';
import 'dart:io';

void main() async {
  const available = {'red': 12, 'green': 13, 'blue': 14};
  final file = File('../input.txt');
  Stream<String> lines =
      file.openRead().transform(utf8.decoder).transform(LineSplitter());
  try {
    var result = 0;
    var lineIndex = 0;
    await for (var line in lines) {
      lineIndex += 1;
      var gameCubes = {'red': 0, 'green': 0, 'blue': 0};
      line = line.substring(line.indexOf(': ') + 2);
      List sets = line.split('; ');
      for (final s in sets) {
        var cubes = s.split(', ');
        for (var cube in cubes) {
          List part = cube.split(' ');
          var amt = int.parse(part[0]);
          var color = part[1];
          gameCubes.update(color, (v) {
            if (amt > v) {
              return amt;
            } else {
              return v;
            }
          });
        }
      }
      if (possible(available, gameCubes)) {
        result += lineIndex;
      }
    }
    print(result);
  } catch (e) {
    print(e);
  }
}

bool possible(Map<String, int> available, Map<String, int> given) {
  return given['red']! <= available['red']! &&
      given['green']! <= available['green']! &&
      given['blue']! <= available['blue']!;
}
