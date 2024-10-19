import 'package:flutter/material.dart';

class CurrentMapCard extends StatefulWidget {
  final String name;
  final String id;
  final bool starred;

  const CurrentMapCard({super.key, required this.name, required this.id, required this.starred});

  @override
  State<StatefulWidget> createState() {
    return _CurrentMapCardState();
  }
}

class _CurrentMapCardState extends State<CurrentMapCard> {
  ShapeBorder shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(25),
  );
  late bool starred = widget.starred;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 80,
      child:  Card(
        shape: shape,
        shadowColor: Colors.purple,
        elevation: 10,
        color: Colors.deepPurpleAccent,
        child: Center(
          child: ListTile(
            leading: Column(children: [Text('Current', style: TextStyle(fontSize: 15, color: Colors.black),)],),
            title: Text(widget.name, style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black), textAlign: TextAlign.center,),
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
    );
  }

  void _updateStarred() {
    setState(() {
      starred = !starred;
    });
  }
}
