import 'dart:convert';
import 'dart:io';

void main() async {
  final file = File('../input.txt');
  Stream<String> lines =
      file.openRead().transform(utf8.decoder).transform(LineSplitter());
  try {
    var result = 0;
    await for (var line in lines) {
      final numPattern = RegExp(r'(\d+)');

      line = line.replaceFirst(RegExp(r'Card +\d+: '), '');
      final wins = numPattern
          .allMatches(line.split('|')[0])
          .map((m) => m.group(0))
          .toSet();
      final got = numPattern
          .allMatches(line.split('|')[1])
          .map((m) => m.group(0))
          .toSet();

      final amount = wins.intersection(got).length;
      if (amount > 0) {
        var points = 1;
        for (var i = 0; i < amount - 1; i++) {
          points = points * 2;
        }
        result += points;
      }
    }
    print(result);
  } catch (e) {
    print(e);
  }
}
