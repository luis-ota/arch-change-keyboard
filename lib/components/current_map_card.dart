import 'package:flutter/material.dart';

class CurrentMapCard extends StatefulWidget {
  final String name;

  const CurrentMapCard({super.key, required this.name});

  @override
  State<StatefulWidget> createState() {
    return _CurrentMapCardState();
  }
}

class _CurrentMapCardState extends State<CurrentMapCard> {
  bool starred = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 80,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        shadowColor: Colors.purple,
        elevation: 10,
        color: Colors.deepPurpleAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 340 / 3,
              height: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Current:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 340 / 3,
              child: Text(
                widget.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
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
            ),
          ],
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
