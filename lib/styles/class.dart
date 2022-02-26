
import '../key/key.dart';

class Labels {
  String label;
  Map mapName;

  List listKeys = [];
  List listValues = [];
  Labels({required this.label, required this.mapName});

  static List<Labels> sample = [
    Labels(label: 'Lug`at', mapName: lugatKey),

  ];

  listValuesAdd(int index) {
    return Labels.sample[index].mapName.values.toList().forEach((element) {
      listValues.add(element);
    });
  }

  listKeysAdd(int index) {
    return Labels.sample[index].mapName.keys
      ..toList().forEach((element) {
        listKeys.add(element);
      });
  }
// static List<Labels>
}
