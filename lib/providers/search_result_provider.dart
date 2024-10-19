import 'package:chkbmap/components/map_option_card.dart';
import 'package:flutter/material.dart';

class SearchResultProvider with ChangeNotifier {
  final Map<String, MapOptionCard> mapOptionCards = {};
  late String porcentagem;

  List<MapOptionCard> get all {
    return [...mapOptionCards.values];
  }

  int get count {
    return mapOptionCards.length;
  }

  MapOptionCard byIndex(int i) {
    return mapOptionCards.values.elementAt(i);
  }

  Future<void> put(MapOptionCard mapOption) async {
    if (mapOption.id.trim().isNotEmpty &&
        mapOptionCards.containsKey(mapOption.id)) {
      mapOptionCards.update(mapOption.id, (_) => mapOption);
    } else {
      final id = mapOption.id;
      mapOptionCards.putIfAbsent(
          id,
          () => MapOptionCard(
                id: mapOption.id,
                name: mapOption.name,
            searched: true,
              ));
    }
    organizar();
    notifyListeners();
  }

  Future<void> remover(MapOptionCard mapOption) async {
    mapOptionCards.remove(mapOption.id);
    notifyListeners();
  }

  Future<void> organizar() async {
    Map<String, MapOptionCard> mapOptionOrdened = {};

    List<String> chavesOrdenadas = mapOptionCards.keys.toList();
    chavesOrdenadas.sort((a, b) => b.compareTo(a));
    for (var chave in chavesOrdenadas) {
      mapOptionOrdened[chave] = mapOptionCards[chave]!;
    }
    mapOptionCards.clear();
    mapOptionCards.addAll(mapOptionOrdened);
    notifyListeners();
  }
}
