import 'package:flutter/material.dart';

class MyExpansionTile extends StatefulWidget {
  const MyExpansionTile({super.key});

  @override
  _MyExpansionTileState createState() => _MyExpansionTileState();
}

class _MyExpansionTileState extends State<MyExpansionTile> {
  bool _isExpanded1 = false;
  bool _isExpanded2 = false;
  bool _isExpanded3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded1 = !_isExpanded1;
              });
            },
            child: Container(
              color: Colors.blue,
              padding: const EdgeInsets.all(8.0),
              child: const Text('Container 1'),
            ),
          ),
          if (_isExpanded1)
            const ExpansionTile(
              title: Text('Expansion Tile 1'),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Expanded content 1'),
                      Text('Expanded content 2'),
                    ],
                  ),
                ),
              ],
            ),
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded2 = !_isExpanded2;
              });
            },
            child: Container(
              color: Colors.green,
              padding: const EdgeInsets.all(8.0),
              child: const Text('Container 2'),
            ),
          ),
          if (_isExpanded2)
            const ExpansionTile(
              title: Text('Expansion Tile 2'),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Expanded content 1'),
                      Text('Expanded content 2'),
                    ],
                  ),
                ),
              ],
            ),
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded3 = !_isExpanded3;
              });
            },
            child: Container(
              color: Colors.red,
              padding: const EdgeInsets.all(8.0),
              child: const Text('Container 3'),
            ),
          ),
          if (_isExpanded3)
            const ExpansionTile(
              title: Text('Expansion Tile 3'),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Expanded content 1'),
                      Text('Expanded content 2'),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}