import 'dart:convert';
import 'dart:io';

Future<String> searchMapLayouts(String word) async {
  var process = await Process.start('/bin/bash', [
    '-c',
    "awk '/! layout/{flag=1; next} /!/{flag=0} flag' /usr/share/X11/xkb/rules/xorg.lst | grep $word -i"
  ]);

  String output = await process.stdout.transform(utf8.decoder).join();

  String errors = await process.stderr.transform(utf8.decoder).join();

  if (errors.isNotEmpty) {
    print("Error: $errors");
  }

  return output;
}

Future<Stream<String>> searchMapVariants(String word) async {
  var process = await Process.start('/bin/bash', [
    '-c',
    "awk '/! variant/{flag=1; next} /!/{flag=0} flag' /usr/share/X11/xkb/rules/xorg.lst | grep $word -i"
  ]);

  Stream<String> output = await process.stdout.transform(utf8.decoder);

  String errors = await process.stderr.transform(utf8.decoder).join();

  if (errors.isNotEmpty) {
    print("Error: $errors");
  }

  return output;
}
