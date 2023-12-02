import 'dart:convert';
import 'dart:io';

void main() async {
  final file = File('../input.txt');
  Stream<String> lines =
      file.openRead().transform(utf8.decoder).transform(LineSplitter());
  try {
    var result = 0;
    await for (var line in lines) {
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
      result += power(gameCubes);
    }
    print(result);
  } catch (e) {
    print(e);
  }
}

int power(Map<String, int> cubes) {
  return cubes['red']! * cubes['green']! * cubes['blue']!;
}
