import 'package:flutter/material.dart';
import 'package:wether_app_v1/widgets/search_icon_wedget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search City"),
      ),
      body: const SearchIcon(),
    );
  }
}
