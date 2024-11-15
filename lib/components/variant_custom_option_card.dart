import 'package:flutter/material.dart';

import '../models/full_map_model.dart';
import '../utils/process_functios.dart';

class VariantCustomOptionCard extends StatefulWidget {
  final String idLayout;

  const VariantCustomOptionCard({super.key, required this.idLayout});

  @override
  State<StatefulWidget> createState() {
    return _VariantCustomOptionCardState();
  }
}

class _VariantCustomOptionCardState extends State<VariantCustomOptionCard> {
  late TextEditingController _customVariantController = TextEditingController();

  ShapeBorder shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(25),
  );

  @override
  void dispose() {
    // Dispose the controller when the widget is disposed to free up resources
    _customVariantController.dispose();
    super.dispose();
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
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 10),
          child: TextFormField(
            controller: _customVariantController,
            decoration: const InputDecoration(
              hintText: 'Type a custom variant...',
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.black54),
            ),
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
            onFieldSubmitted: (value) {
              // Call the set function when Enter is pressed
              _setCustom(value);
            },
          ),
        ),
      ),
    );
  }

  void _setCustom(String value) {
    setMap(FullMapModel(widget.idLayout, value));
    Navigator.pop(context, 'pop');
  }
}
