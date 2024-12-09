
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/full_map_model.dart';
import '../providers/current_map_provider.dart';
import '../utils/config_menager.dart';
import '../utils/process_functios.dart';

class VariantOptionCard extends StatefulWidget {
  final String name;
  final String id;
  final String idLayout;
  final bool starred;

  const VariantOptionCard(
      {super.key,
      required this.name,
      required this.id,
      this.starred = false,
      required this.idLayout});

  @override
  State<StatefulWidget> createState() {
    return _VariantOptionCardState();
  }
}

class _VariantOptionCardState extends State<VariantOptionCard> {
  ShapeBorder shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(25),
  );

  late bool starred;
  @override
  void initState() {
    starred = hashMap(widget.idLayout, widget.id);
    super.initState();
  }

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
        child: MaterialButton(
          onPressed: _goToHome,
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
                onPressed: _updateStarred,
                icon: Icon(
                  starred ? Icons.star : Icons.star_border,
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
      ),
    );
  }

  Future<void> _updateStarred() async {
    if (!starred) {
      addMap(widget.idLayout, widget.id, widget.name);
    } else {
      removeMap(widget.idLayout, widget.id);
    }
    ;
    setState(() {
      starred = !starred;
    });
  }

  Future<void> _goToHome() async {
    setMap(FullMapModel(widget.idLayout, widget.id));
    Navigator.pop(context, 'pop');
    await Provider.of<CurrentMapProvider>(context, listen: false).update();
  }
}
