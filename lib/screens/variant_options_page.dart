import 'package:flutter/material.dart';

import '../components/variant_custom_option_card.dart';
import '../components/variant_option_card.dart';
import '../models/variant_model.dart';

class VariantOptionsPage extends StatefulWidget {
  final Map<String, VariantModel> variants;
  final String idLayout;

  const VariantOptionsPage(
      {super.key, required this.variants, required this.idLayout});

  @override
  State<StatefulWidget> createState() => _VariantOptionsPageState();
}

class _VariantOptionsPageState extends State<VariantOptionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_outlined),
                  onPressed: () => Navigator.pop(context),
                ),
                Text(
                  "Select a variant for ${widget.variants.values.first.name.replaceAll("Default ", "")}",
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.variants.length,
                itemBuilder: (context, i) {
                  String id = widget.variants.keys.toList()[i];
                  return widget.variants[id]!.id != 'customVariant'
                      ? VariantOptionCard(
                          name: widget.variants[id]!.name,
                          id: widget.variants[id]!.id,
                          idLayout: widget.idLayout)
                      : VariantCustomOptionCard(idLayout: widget.idLayout);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
