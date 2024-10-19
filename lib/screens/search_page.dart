import 'package:chkbmap/components/map_option_card.dart';
import 'package:chkbmap/providers/search_result_provider.dart';
import 'package:chkbmap/utils/process_functios.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  final String initialSearch;

  const SearchPage({super.key, required this.initialSearch});

  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _search(widget.initialSearch);
    _searchController = TextEditingController(text: widget.initialSearch);
  }

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
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: TextFormField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        hintText: 'Search...',
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.black54),
                      ),
                      style: const TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.bold),
                      autofocus: true,
                      onChanged: (value) {
                        _search(value);

                      },
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: Provider.of<SearchResultProvider>(context).count,
                itemBuilder: (context, i) => MapOptionCard(
                    name: Provider.of<SearchResultProvider>(context,
                            listen: false)
                        .byIndex(i)
                        .name,
                    id: Provider.of<SearchResultProvider>(context,
                            listen: false)
                        .byIndex(i)
                        .id,
                searched: true,),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _search(String value) async {
    var result = await searchMapLayouts(value);
    Provider.of<SearchResultProvider>(context, listen: false)
        .mapOptionCards
        .clear();
    List<String> options = result.split("\n");

    for (String option in options.take(5)) {
      String id = option.trim().split(" ")[0];
      String name = option.trim().replaceAll(id, "").trim();
      if(id!="" ){
        Provider.of<SearchResultProvider>(context, listen: false)
            .put(MapOptionCard(name: name, id: id,));
      }
    }
  }
}
