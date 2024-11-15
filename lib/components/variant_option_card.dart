
import 'package:flutter/material.dart';

import '../models/full_map_model.dart';
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

  void _updateStarred() {
    setState(() {
      starred = !starred;
    });
  }

  Future<void> _goToHome() async {
    setMap(FullMapModel(widget.idLayout, widget.id));
    Navigator.pop(context, 'pop');
  }
}
