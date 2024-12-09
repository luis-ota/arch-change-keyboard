import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/current_map_card.dart';
import '../components/options_card.dart';
import '../providers/current_map_provider.dart';
import '../providers/search_result_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SearchResultProvider()),
        ChangeNotifierProvider(create: (context) => CurrentMapProvider()),
      ],
      child: const MaterialApp(
        home: Scaffold(
            body: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CurrentMapCard(),
              OptionsCard()
            ],
          ),
        )),
      ),
    );
  }
}
