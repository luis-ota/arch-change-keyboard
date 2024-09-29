import 'package:chkbmap/components/current_map_card.dart';
import 'package:flutter/material.dart';

class StarPage extends StatefulWidget {
  const StarPage({super.key});

  @override
  State<StatefulWidget> createState() => _StarPageState();
}

class _StarPageState extends State<StarPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_outlined),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: const [
                CurrentMapCard(),
                CurrentMapCard(),
                CurrentMapCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
