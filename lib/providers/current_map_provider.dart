import 'package:chkbmap/models/full_map_model.dart';
import 'package:flutter/material.dart';

import '../utils/process_functios.dart';
import '../utils/config_menager.dart';

class CurrentMapProvider with ChangeNotifier {
  String currentMap = "";
  FullMapModel currentMapIds = const FullMapModel('', '');
  bool isStarred = false;
  String get name{
    update();
    return currentMap;
  }



  Future<FullMapModel> get ids async{
    await update();
    return currentMapIds;

  }

  void setStarred(bool value){
    isStarred = value;
  }

  Future<void> update() async {

    currentMap = await getCurrentMap();
    currentMapIds = await getCurrentMapIds();
    isStarred = hashMap(currentMapIds.idLayout, currentMapIds.idVariant);

    notifyListeners();
  }


}
