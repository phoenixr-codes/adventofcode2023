import 'dart:io';

class Race {
  final int duration;
  final int distance;

  Race(this.duration, this.distance);

  @override
  String toString() {
    return "Race(duration: $duration, distance: $distance)";
  }
}

void main() async {
  final file = File('../input.txt');
  List<String> lines = file.readAsLinesSync();
  try {
    var result = 0;
    final numRe = RegExp(r"\d+");

    final time = numRe.allMatches(lines[0]).map((m) => m.group(0)!).join();
    final distance = numRe.allMatches(lines[1]).map((m) => m.group(0)!).join();

    List<int> variants = [];
    final race = Race(int.parse(time), int.parse(distance));

    variants.clear();
    for (var hold = 1; hold < race.duration; hold++) {
      final driveFor = race.duration - hold;
      final totalDistance = hold * driveFor;
      if (totalDistance > race.distance) variants.add(hold);
    }

    if (result == 0) {
      result = variants.length;
    } else {
      result *= variants.length;
    }

    print(result);
  } catch (e) {
    print(e);
  }
}
