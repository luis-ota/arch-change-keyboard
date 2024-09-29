import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class OptionsCard extends StatefulWidget {


  const OptionsCard(
      {super.key});

  @override
  State<StatefulWidget> createState() {
    return _OptionsCardState();
  }
}

class _OptionsCardState extends State<OptionsCard> {
  bool searchVisible = true;
  bool starVisible = true;
  bool settingsVisible = true;
  double optionsCardWidth = 140;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: optionsCardWidth,
            height: 65,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              color: Colors.black54,
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Visibility(visible: searchVisible, child: Row(
                    children: [
                      IconButton(onPressed: ExpandSearch, icon: const Icon(Icons.search, color: Colors.black,)),
                    ],
                  )),
                  Visibility(visible: starVisible, child: IconButton(onPressed: (){}, icon: const Icon(Icons.star, color: Colors.black,))),
                  Visibility(visible:settingsVisible, child: IconButton(onPressed: (){}, icon: const Icon(Icons.settings, color: Colors.black,))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> ExpandSearch() async {
    setState(() {
      starVisible = false;
      settingsVisible = false;
      optionsCardWidth = 350 ;
    });
  }
}