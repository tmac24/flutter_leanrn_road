// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class RefreshableListExample extends StatefulWidget {
  const RefreshableListExample({super.key});

  @override
  _RefreshableListExampleState createState() => _RefreshableListExampleState();
}

class _RefreshableListExampleState extends State<RefreshableListExample> {
  final _items = List<String>.generate(20, (i) => "Item ${i + 1}");
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter上拉加载下拉刷新列表示例')),
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: ListView.builder(
          itemCount: _isLoading ? _items.length + 1 : _items.length,
          itemBuilder: (context, index) {
            if (index == _items.length) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListTile(title: Text(_items[index]));
          },
          controller: _scrollController,
        ),
      ),
    );
  }

  Future<void> _handleRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _items.clear();
      _items.addAll(List<String>.generate(20, (i) => "Item ${i + 1}"));
      _isLoading = false;
    });
  }

  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.extentAfter == 0) {
        setState(() => _isLoading = true);
        _loadMoreItems();
      }
    });
  }

  Future<void> _loadMoreItems() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      _items.addAll(
          List<String>.generate(20, (i) => "Item ${_items.length + i + 1}"));
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
