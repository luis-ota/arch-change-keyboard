import 'package:chkbmap/models/full_map_model.dart';
import 'package:chkbmap/utils/config_menager.dart';
import 'package:chkbmap/utils/process_functios.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/current_map_provider.dart';

class CurrentMapCard extends StatefulWidget {

  const CurrentMapCard(
      {super.key});

  @override
  State<StatefulWidget> createState() {
    return _CurrentMapCardState();
  }
}

class _CurrentMapCardState extends State<CurrentMapCard> {
  ShapeBorder shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(25),
  );

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
            leading: const Column(
              children: [
                Text(
                  'Current',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            title: Text(
              Provider.of<CurrentMapProvider>(context).name,
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              onPressed: _updateStarred,
              icon: Icon(
                Provider.of<CurrentMapProvider>(context).isStarred ? Icons.star : Icons.star_border,
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

  Future<void> _updateStarred() async {
    FullMapModel mapIds = await getCurrentMapIds();
    Provider.of<CurrentMapProvider>(context, listen: false).setStarred(!Provider.of<CurrentMapProvider>(context, listen: false).isStarred);

    if (Provider.of<CurrentMapProvider>(context, listen: false).isStarred) {
      addMap(mapIds.idLayout, mapIds.idVariant,mapIds.idVariant!='default'?mapIds.name:"Default ${mapIds.name}");
    } else {
      removeMap(mapIds.idLayout, mapIds.idVariant);
    };

  }
}
