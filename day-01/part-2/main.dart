import 'dart:convert';
import 'dart:io';

void main() async {
  final file = File('../input.txt');
  Stream<String> lines =
      file.openRead().transform(utf8.decoder).transform(LineSplitter());
  try {
    var total = 0;
    await for (var line in lines) {
      var concatenated = '';
      List<int> numbers = [];
      line.split('').forEach((ch) {
        concatenated += ch;
        final fromWord = obtain(concatenated);
        if (fromWord != null) {
          numbers.add(fromWord);
        } else {
          final fromChar = int.tryParse(ch);
          if (fromChar != null) {
            numbers.add(fromChar);
          }
        }
      });
      if (numbers.length > 0) {
        String joined = '${numbers[0]}${numbers[numbers.length - 1]}';
        total += int.parse(joined);
      }
    }
    print(total);
  } catch (e) {
    print(e);
  }
}

int? obtain(String text) {
  final words = [
    'one',
    'two',
    'three',
    'four',
    'five',
    'six',
    'seven',
    'eight',
    'nine'
  ];
  for (final (index, word) in words.indexed) {
    if (text.length - word.length >= 0 &&
        text.substring(text.length - word.length) == word) {
      return index + 1;
    }
  }
  return null;
}
