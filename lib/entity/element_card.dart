import 'package:hive/hive.dart';

// part 'group.g.dart';
part 'element_card.g.dart';

@HiveType(typeId: 1)
class ElementCard extends HiveObject {
  @HiveField(0)
  List keyss;
  @HiveField(1)
  List value;


  ElementCard({
    required  this.keyss,
    required this.value,
  });
}
