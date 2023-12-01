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
      line.split('').forEach((ch) {
        final bool isNum = int.tryParse(ch) != null;
        if (isNum) concatenated += ch;
      });
      if (concatenated.length > 0) {
        concatenated = concatenated[0] + concatenated[concatenated.length - 1];
        total += int.parse(concatenated);
      }
    }
    print(total);
  } catch (e) {
    print(e);
  }
}
