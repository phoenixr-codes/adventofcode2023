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

    final times = numRe.allMatches(lines[0]).toList();
    final distances = numRe.allMatches(lines[1]).toList();

    List<int> variants = [];
    for (var i = 0; i < times.length; i++) {
      final race = Race(
          int.parse(times[i].group(0)!), int.parse(distances[i].group(0)!));

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
    }

    print(result);
  } catch (e) {
    print(e);
  }
}
