import 'dart:io';

final configFile = File('${Platform.environment['HOME']}/.config/chkbmap/.chkbmap.cfg');

void ensureConfigFileExists() {
  if (!configFile.existsSync()) {
    configFile.createSync(recursive: true);
  }
}

void saveMaps(List<Map<String, String>> maps) {
  ensureConfigFileExists();
  final lines = maps.map((map) => "${map['layout']}:${map['variant']}:${map["name"]}").toList();
  configFile.writeAsStringSync(lines.join('\n'));
}

List<Map<String, String>> loadMaps() {
  ensureConfigFileExists();
  if (!configFile.existsSync()) return [];
  final lines = configFile.readAsLinesSync();
  return lines.map((line) {
    final parts = line.split(':');
    return {"layout": parts.first, "variant": parts.length > 1 ? parts[1] : "", "name":parts.last};
  }).toList();
}

void addMap(String layout, String variant, String name) {
  final maps = loadMaps();
  maps.add({"layout": layout, "variant": variant, "name": name});
  saveMaps(maps);
}

void removeMap(String layout, String variant) {
  final maps = loadMaps();
  maps.removeWhere((map) => map['layout'] == layout && map['variant'] == variant);
  saveMaps(maps);
}

bool hashMap(String layout, String variant) {
  final maps = loadMaps();
  return maps.any((map) => map['layout'] == layout && map['variant'] == variant);
}