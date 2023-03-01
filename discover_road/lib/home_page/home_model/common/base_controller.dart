import 'base_list_controller.dart';

abstract class CommonGetXController extends NormalGetxController {
  /// 项目中 使用的失败界面的标识,用于使用者 显示不同的界面
  /// 具体 使用,一般是通过网络请求,进行逻辑处理
  var placeHoldType = CommonPlaceHoldType.nothing;
}

abstract class CommonGetXListController extends NormalGetxListController {
  /// 项目中 使用的失败界面的标识,用于使用者 显示不同的界面
  /// 具体 使用,一般是通过网络请求,进行逻辑处理
  var placeHoldType = CommonPlaceHoldType.nothing;

  @override
  configreload() {}

  configPageState({
    required int allNum,
    required int netlistNum,
  }) {
    PageState st = PageState.dataFetchState;
    if (allNum == 0) {
      st = PageState.emptyDataState;
    } else if (netlistNum == 0) {
      st = PageState.noMoreDataState;
    }
    return st;
  }
}

enum CommonPlaceHoldType {
  /// 无网络
  nonetwork,

  /// 未登录
  nologin,

  ///空数据
  nothing,
}
