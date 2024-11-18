import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

import '../models/full_map_model.dart';

Future<String> searchMapLayouts(String word) async {
  var process = await Process.start('/bin/bash', [
    '-c',
    "awk '/! layout/{flag=1; next} /!/{flag=0} flag' /usr/share/X11/xkb/rules/xorg.lst | grep $word -i"
  ]);

  String output = await process.stdout.transform(utf8.decoder).join();

  String errors = await process.stderr.transform(utf8.decoder).join();

  if (errors.isNotEmpty) {
    if (kDebugMode) {
      print("Error: $errors");
    }
    // Send a desktop notification for errors
    await Process.start('/bin/bash', [
      '-c',
      "notify-send -t 10000 'Error' 'Error while searching for map layouts: $errors'"
    ]);
  }

  return output;
}

Future<String> searchMapVariants(String word) async {
  var process = await Process.start('/bin/bash', [
    '-c',
    "awk '/! variant/{flag=1; next} /!/{flag=0} flag' /usr/share/X11/xkb/rules/xorg.lst | grep $word: -i"
  ]);

  String output = await process.stdout.transform(utf8.decoder).join();

  String errors = await process.stderr.transform(utf8.decoder).join();

  if (errors.isNotEmpty) {
    // Send a desktop notification for errors
    await Process.start('/bin/bash', [
      '-c',
      "notify-send -t 10000 'Error' 'Error while searching for map variants: $errors'"
    ]);
  }

  return output;
}

void setMap(FullMapModel fullMapOptions) async {
  await Process.start('/bin/bash', [
    '-c',
    "notify-send -t 10000 'Info' 'Setting keyboard layout to ${fullMapOptions.idLayout}: ${fullMapOptions.idVariant}'"
  ]);

  var process = await Process.start('/bin/bash', [
    '-c',
    fullMapOptions.idVariant != "default"
        ? "setxkbmap -layout ${fullMapOptions.idLayout} -variant ${fullMapOptions.idVariant}"
        : "setxkbmap -layout ${fullMapOptions.idLayout}"
  ]);

  String errors = await process.stderr.transform(utf8.decoder).join();

  if (errors.isNotEmpty) {
    await Process.start('/bin/bash', [
      '-c',
      "notify-send -t 10000 'Error' 'Error while setting keyboard layout: $errors'"
    ]);
    await Process.start('/bin/bash', [
      '-c',
      "notify-send -t 10000 'Info' 'Setting to the selected layout default'"
    ]);

    await Process.start(
        '/bin/bash', ['-c', "setxkbmap -layout ${fullMapOptions.idLayout}"]);


  }
}


Future<String> getCurrentMap() async {
  var process = await Process.start('/bin/bash', [
    '-c',
    '''
    layout=\$(setxkbmap -query | awk '/layout:/ {layout=\$2} END {system("awk \\047/! layout/{flag=1; next} /!/{flag=0} flag\\047 /usr/share/X11/xkb/rules/xorg.lst | grep \\047 " layout " \\047 -i")}' | sed 's/^[[:space:]]*[^[:space:]]\\+[[:space:]]\\+//')
    variant=\$(setxkbmap -query | grep variant | awk '{print \$2}')
    if [ -n "\$variant" ]; then
        echo "\$layout \$variant"
    else
        echo "\$layout"
    fi
    '''
  ]);

  String output = await process.stdout.transform(utf8.decoder).join();
  String errors = await process.stderr.transform(utf8.decoder).join();

  if (errors.isNotEmpty) {
    await Process.start('/bin/bash', [
      '-c',
      "notify-send -t 10000 'Error' 'Error while retriver keyboard map: $errors'"
    ]);
  }
  return output.trim();
}

