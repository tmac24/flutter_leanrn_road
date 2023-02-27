import 'package:flutter/material.dart';

class ListViewEg4 extends StatelessWidget {
  const ListViewEg4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView'),
      ),
      body: const listeg3(),
    );
  }
}

class listeg3 extends StatelessWidget {
  const listeg3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['A', 'B', 'C'];
    final List<int> colorCodes = <int>[200, 300, 400];

    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          color: Colors.blueGrey[colorCodes[index]],
          child: Center(
            child: Text('data${entries[index]}'),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}

class listeg2 extends StatelessWidget {
  const listeg2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['A', 'B', 'C'];
    final List<int> colorCodes = <int>[200, 300, 400];

    return ListView.builder(
        itemCount: entries.length,
        padding: const EdgeInsets.all(8),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.green[colorCodes[index]],
            child: Center(
              child: Text('Entry${entries[index]}'),
            ),
          );
        });
  }
}

class listeg1 extends StatelessWidget {
  const listeg1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        Container(
          height: 50,
          color: Colors.blue[200],
          child: const Center(
            child: Text('Entry A'),
          ),
        ),
        Container(
          height: 50,
          color: Colors.blue[300],
          child: const Center(
            child: Text('Entry B'),
          ),
        ),
        Container(
          height: 50,
          color: Colors.blue[500],
          child: const Center(
            child: Text('Entry C'),
          ),
        ),
      ],
    );
  }
}
