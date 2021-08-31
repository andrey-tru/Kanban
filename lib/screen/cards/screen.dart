import 'package:flutter/material.dart';
import 'package:kanban/screen/cards/widgets/cards_list.dart';

class CardsScreen extends StatelessWidget {
  final String token;

  CardsScreen({required this.token});

  static Map<String, String> tabPages = {
    '0': 'On hold',
    '1': 'In progress',
    '2': 'Needs review',
    '3': 'Approved',
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabPages.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            unselectedLabelColor: Colors.black,
            labelColor: Colors.white,
            indicatorColor: Colors.white,
            tabs: tabPages.values
                .map((e) => Tab(
                      child: Text(e),
                    ))
                .toList(),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: TabBarView(
            children: tabPages.keys
                .map((row) => CardsList(
                      token: token,
                      row: row,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
