/*
 * @Author: T-Mac
 * @Date: 2023-08-17 15:40:52
 * @Description: 加载原生视图
 */
import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class iosTestPage extends StatelessWidget {
  const iosTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    const String viewType = '<platform-view-type>';
    // Pass parameters to the platform side.
    final Map<String, dynamic> creationParams = <String, dynamic>{};

    return UiKitView(
      viewType: viewType,
      layoutDirection: TextDirection.ltr,
      creationParams: creationParams,
      creationParamsCodec: const StandardMessageCodec(),
    );
  }
}
