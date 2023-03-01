import 'package:flutter/cupertino.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';

abstract class NormalGetxController extends GetxController {
  var pageState = PageState.initializedState.obs;

  var isshowloading = false.obs;
  var sizew = 0.0.obs;

  configsiezw(double maxw) {
    sizew.value = maxw;
  }

  /// 配置点击失败界面 刷线方法
  configreload() {}
}

abstract class NormalGetxListController extends NormalGetxController
    implements AbstractNetWork {
  EasyRefreshController? refreshController;
  int page = 1;

  @override
  void onInit() {
    super.onInit();
    refreshController = EasyRefreshController();
  }

  // 下啦刷新触发事件
  configRefresh() async {
    page = 1;
    getnetworkdata(1, configNetWorkParmas());
  }

  // 上啦加载更多触发事件
  configLoading() async {
    page++;
    getnetworkdata(2, configNetWorkParmas());
  }

  /// 网络请求 参数方法
  @override
  Map<String, dynamic>? configNetWorkParmas() {
    return null;
  }

  /// 网络请求数据
  @override
  void getnetworkdata(int? type, Map<String, dynamic>? info) async {}

  /// 通过数据 进行 pagestate 转换
  configListPageState({
    required int allnum,
    required int networknum,
  }) {
    PageState st = PageState.dataFetchState;
    if (allnum == 0) {
      st = PageState.emptyDataState;
    } else if (networknum == 0) {
      st = PageState.noMoreDataState;
    }
    return st;
  }

  /// 结束刷新
  void endRefresh({int? type, PageState? state}) {
    bool success = true;
    bool noMore = false;
    if (state == PageState.noMoreDataState) {
      noMore = true;
    }
    if (state == PageState.errorState ||
        state == PageState.erroronlyTotal ||
        state == PageState.errorshowRelesh) {
      success = false;
    }
    if (refreshController != null) {
      if (type == 1) {
        refreshController!.finishRefresh(success: success);
        refreshController!.resetLoadState();
      } else if (type == 2) {
        refreshController!.finishLoad(success: success, noMore: noMore);
      }
    }
    pageState.value = state!;
  }
}

enum PageState {
  // 初始状态
  initializedState,
  // 错误状态,显示失败界面
  errorState,
  // 错误状态,只弹错误信息
  erroronlyTotal,
  // 错误状态,显示刷新按钮
  errorshowRelesh,
  // 没有更多数据
  noMoreDataState,
  // 空数据状态
  emptyDataState,
  // 数据获取成功状态
  dataFetchState,
}

class BaseState {
  PageState? pageState;
  bool isok = true;
  String? msg;
  String? mark;
  BaseState({this.pageState = PageState.noMoreDataState, this.msg});
}

class BaseVM {
  final BaseState state = BaseState();
}

// 配置网络请求规范
abstract class AbstractNetWork {
  @protected
  Map<String, dynamic>? configNetWorkParmas();

  /// 网络请求
  @protected
  void getnetworkdata(int? type, Map<String, dynamic>? info);
}
