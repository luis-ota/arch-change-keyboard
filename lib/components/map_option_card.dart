import 'package:chkbmap/models/variant_model.dart';
import 'package:chkbmap/utils/process_functios.dart';
import 'package:flutter/material.dart';

import '../screens/variant_options_page.dart';

class MapOptionCard extends StatefulWidget {
  final String name;
  final String id;
  final bool starred;
  final bool searched;

  const MapOptionCard(
      {super.key,
      required this.name,
      required this.id,
      this.starred = false,
      this.searched = false});

  @override
  State<StatefulWidget> createState() {
    return _MapOptionCardState();
  }
}

class _MapOptionCardState extends State<MapOptionCard> {
  ShapeBorder shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(25),
  );
  late bool starred = widget.starred;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 80,
      child: Card(
        shape: shape,
        shadowColor: Colors.purple,
        elevation: 10,
        color: Colors.deepPurpleAccent,
        child: Center(
          child: ListTile(
            leading: const SizedBox(
              width: 5,
            ),
            title: Text(
              widget.name,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            trailing: IconButton(
              onPressed: widget.searched ? _goToVariants : _updateStarred,
              icon: Icon(
                widget.searched
                    ? Icons.arrow_forward_ios_outlined
                    : starred
                        ? Icons.star
                        : Icons.star_border,
                size: 30,
                color: Colors.black,
              ),
              splashRadius: 1,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }

  void _updateStarred() {
    setState(() {
      starred = !starred;
    });
  }

  Future<void> _goToVariants() async {
    String result = await searchMapVariants(widget.id);
    List<String> options = result.split("\n");

    Map<String, VariantModel> variantsMap = {
      'default': VariantModel('default', "Default ${widget.name}"),
      'customVariant': VariantModel('customVariant', widget.name),
    };

    for (String option in options) {
      String id = option.trim().split(" ")[0];
      String name = option
          .trim()
          .replaceAll(id, "")
          .trim()
          .replaceAll("${widget.id}:", "")
          .trim();
      if (id.isNotEmpty) {
        variantsMap.putIfAbsent(id, () => VariantModel(id, name));
      }
    }

    if (mounted) {
      var res = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => VariantOptionsPage(
                  variants: variantsMap,
                  idLayout: widget.id,
                )),
      );

      if (res == "pop" && mounted) {
        Navigator.pop(context, res);
      }
    }
  }
}
