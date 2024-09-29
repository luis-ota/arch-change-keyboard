import 'package:flutter/material.dart';


class CurrentMapCard extends StatefulWidget {


  const CurrentMapCard(
      {super.key});

  @override
  State<StatefulWidget> createState() {
    return _CurrentMapCardState();
  }
}

class _CurrentMapCardState extends State<CurrentMapCard> {

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
        child: const Column(
          children: [
            SizedBox(height: 2,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                SizedBox(width: 25,),
                SizedBox(child: Text("Current:", style: TextStyle(fontWeight: FontWeight.bold),),),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: 20,),
                SizedBox(child: Text("English", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),),
                SizedBox(child: Icon(Icons.star, size: 30,),)
              ],
            ),
          ],
        ),
      ),
    );
  }
}