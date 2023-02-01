import 'package:flutter/material.dart';
import 'dart:async';

class LoadMorePage extends StatefulWidget {
  const LoadMorePage({super.key});

  @override
  State<LoadMorePage> createState() => _LoadMorePageState();
}

class _LoadMorePageState extends State<LoadMorePage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorkey =
      GlobalKey<RefreshIndicatorState>();

  final TrackingScrollController _scrollController = TrackingScrollController();
  List<String> list = <String>[];

  // 是否有下一页
  bool isMore = false;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadMoreData();
  }

  Future _loadMoreData() {
    return _getData();
  }

  //请求数据
  Future _getData() {
    isLoading = true;
    final Completer completer = Completer();

    Timer(const Duration(seconds: 2), () {
      for (var i = 0; i < 20; i++) {
        list.add('数据 ==> ${list.length}');
      }

      if (list.length >= 60) {
        isMore = false;
      } else {
        isMore = true;
      }

      isLoading = false;
      completer.complete(null);
      setState(() {});
    });
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('上拉加载更多'),
        elevation: 0.0, //阴影高度
      ),
      body: NotificationListener(
        onNotification: _onNotification,
        child: ListView.builder(
          controller: _scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: itemCount(),
          itemBuilder: (context, index) => _createItem(context, index),
        ),
      ),
    );
  }

  bool _onNotification(Notification notification) {
    if (notification is ScrollUpdateNotification) {
      // print('max:${_scrollController.mostRecentlyUpdatedPosition.maxScrollExtent}  offset:${_scrollController.offset}');
      // 当没去到底部的时候，maxScrollExtent和offset会相等
      final hfs =
          _scrollController.mostRecentlyUpdatedPosition!.maxScrollExtent >
              _scrollController.offset;
      final hfs2 =
          _scrollController.mostRecentlyUpdatedPosition!.maxScrollExtent -
                  _scrollController.offset <=
              50;
      if (hfs && hfs2) {
        // 要加载更多
        if (isMore && !isLoading) {
          //有下一页
          _loadMoreData();
          setState(() {});
        }
      }
    }
    return true;
  }

  itemCount() {
    if (list.isNotEmpty) {
      return list.length + 1;
    }
    return 0;
  }

  String _getLoadMoreString() {
    if (isMore && !isLoading) {
      return '上拉加载更多';
    } else if (!isMore) {
      return '没有更多了';
    } else {
      return '加载中...';
    }
  }

  _createItem(BuildContext context, int index) {
    if (index < list.length) {
      return _createArticleItem(context, index);
    }

    return SizedBox(
      height: 44,
      child: Center(
        child: Text(_getLoadMoreString()),
      ),
    );
  }

  _createArticleItem(BuildContext context, int index) {
    return Container(
      height: 44,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: Text(list[index]),
                ),
              ],
            ),
          ),
          const Divider(
            height: 0.5,
          )
        ],
      ),
    );
  }
}
