import 'package:flutter/material.dart';

import '../utils/process_functios.dart';

class CurrentMapProvider with ChangeNotifier {
  late String currentMap = "";

  String get name{
    update();
    return currentMap;
  }

  Future<void> update() async {
    currentMap = await getCurrentMap();
    notifyListeners();
  }


}
