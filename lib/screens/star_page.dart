import 'package:chkbmap/components/variant_option_card.dart';
import 'package:flutter/material.dart';

class StarPage extends StatefulWidget {
  final List<Map<String, String>> list_starred_maps;
  const StarPage({super.key, required this.list_starred_maps});

  @override
  State<StatefulWidget> createState() => _StarPageState();
}

class _StarPageState extends State<StarPage> {


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
                const Text(
                  "Starred Maps",  
                  style: TextStyle(fontSize: 15), 
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.list_starred_maps.length,
                itemBuilder: (context, i) => VariantOptionCard(name: widget.list_starred_maps.elementAt(i)['name']??'', id: widget.list_starred_maps.elementAt(i)['variant']??'', idLayout: widget.list_starred_maps.elementAt(i)['layout']??'', starred: true,)
                
              ),
            )
          ],
        ),
      ),
    );
  }
}
