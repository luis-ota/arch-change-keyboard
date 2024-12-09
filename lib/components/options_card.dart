import 'package:chkbmap/screens/search_page.dart';
import 'package:chkbmap/screens/settings_page.dart';
import 'package:chkbmap/screens/star_page.dart';
import 'package:chkbmap/utils/config_menager.dart';
import 'package:flutter/material.dart';

class OptionsCard extends StatefulWidget {
  const OptionsCard({super.key});

  @override
  State<StatefulWidget> createState() {
    return _OptionsCardState();
  }
}

class _OptionsCardState extends State<OptionsCard> {
  bool searchVisible = true;
  bool starVisible = true;
  bool settingsVisible = true;
  bool isSearchExpanded = false;
  double optionsCardWidth = 140;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
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
                  Visibility(
                    visible: searchVisible,
                    child: IconButton(
                      onPressed: _toggleSearch,
                      icon: Icon(
                        !isSearchExpanded ? Icons.search : Icons.close,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  if (isSearchExpanded)
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
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                          autofocus: true,
                          onFieldSubmitted: (value) {
                            _goToSearcPage(value);
                          },
                        ),
                      ),
                    ),
                  Visibility(
                    visible: starVisible && !isSearchExpanded,
                    child: IconButton(
                      onPressed: _goToStarPage,
                      icon: const Icon(Icons.star, color: Colors.black),
                    ),
                  ),
                  Visibility(
                    visible: settingsVisible && !isSearchExpanded,
                    child: IconButton(
                      onPressed: _goToSettingsPage,
                      icon: const Icon(Icons.settings, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _toggleSearch() {
    setState(() {
      if (isSearchExpanded) {
        starVisible = true;
        settingsVisible = true;
        optionsCardWidth = 140;
        isSearchExpanded = false;
        return;
      }

      starVisible = false;
      settingsVisible = false;
      optionsCardWidth = 350;
      isSearchExpanded = true;
    });
  }

  Future<void> _goToStarPage() async {
    List<Map<String, String>> starrad_maps = await loadMaps();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => StarPage(list_starred_maps: starrad_maps,)),
    );
  }

  void _goToSettingsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SettingsPage()),
    );
  }

  Future<void> _goToSearcPage(String text) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SearchPage(initialSearch: text)));

    setState(() {
      _searchController.text = "";
      starVisible = true;
      settingsVisible = true;
      optionsCardWidth = 140;
      isSearchExpanded = false;
    });
  }
}
