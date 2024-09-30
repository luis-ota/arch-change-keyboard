import 'package:flutter/material.dart';

class StarredMapCard extends StatefulWidget {
  final String name;

  const StarredMapCard({super.key, required this.name});

  @override
  State<StatefulWidget> createState() {
    return _StarredMapCardState();
  }
}

class _StarredMapCardState extends State<StarredMapCard> {
  ShapeBorder shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(25),
  );
  bool starred = true;

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
        child: RawMaterialButton(
          onPressed: () {
            print('pressed');
          },
          shape: shape,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 340 / 3,
              ),
              SizedBox(
                width: 340 / 3,
                child: Text(
                  widget.name,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                width: 340 / 3,
                child: IconButton(
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
              )
            ],
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
