import 'package:flutter/material.dart';

class MapOptionCard extends StatefulWidget {
  final String name;
  final String id;
  final bool starred;
  final bool searched;

  const MapOptionCard({super.key, required this.name, required this.id, this.starred = false, this.searched=false});

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
            leading: SizedBox(width: 5,),
            title: Text(widget.name, style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black),),
            trailing: IconButton(
              onPressed: widget.searched?_goToVariants:_updateStarred,
              icon: Icon(
                widget.searched?Icons.arrow_forward_ios_outlined:starred ? Icons.star : Icons.star_border,
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
  void _goToVariants() {
    setState(() {
      starred = !starred;
    });
  }
}
