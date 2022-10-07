import 'dart:ui';

class ScreenInfos {
  static const String _tag = "ScreenInfos";

  /// 屏幕的 物理 分辨率：宽
  static double physicalWidth = 0.0;
  /// 屏幕的物理 分辨率：高
  static double physicalHeight = 0.0;
  /// dpr(设备像素比): 类似 Android 的 1个点代表多少个像素
  static double dpr = 0.0;
  /// 屏幕宽,类似于 Android 的 xx dp
  static double screenWidth = 0.0;
  /// 屏幕高,类似于 Android 的 xx dp
  static double screenHeight = 0.0;
  /// 屏幕 状态栏的高度
  static double statusBarHeight = 0.0;

  static double rpx = 0.0;
  static double px = 0.0;


  static void init({double designWidth = 750}) {
    if (designWidth < 1) {
      designWidth = 750;
    }
    /// 1. 获取 物理分辨率
    Size physicalSize = window.physicalSize;
    physicalWidth = physicalSize.width;
    physicalHeight = physicalSize.height;

    /// 2. 获取 dpr(设备像素比): 类似 Android 的 1个点代表多少个像素
    dpr = window.devicePixelRatio;
    /// 3. 宽度、高度

    if(dpr != 0) {
      screenWidth = physicalWidth / dpr;
      screenHeight = physicalHeight / dpr;
      /// 4. 状态栏的高度
      statusBarHeight = window.padding.top / dpr;


    }
    /// 5. 计算 rpx (小程序)
    rpx = screenWidth / designWidth;
    px = screenWidth / designWidth * 2;

    print("$_tag, --> init() designWidth = $designWidth, physicalWidth = $physicalWidth,physicalHeight = $physicalHeight,"
        "dpr = $dpr,screenWidth = $screenWidth,screenHeight = $screenHeight,"
        "statusBarHeight = $statusBarHeight,rpx = $rpx,px = px");
  }

  static double getPx(double size) {
    return px * size;
  }


  static double getRpx(double size) {
    return rpx * size;
  }

}

extension DoublePx on double {
  // double px(){
  //   return ScreenInfos.getPx(this);
  // }
  //
  // double rpx(){
  //   return ScreenInfos.getRpx(this);
  // }

  double get px {
    return ScreenInfos.getPx(this);
  }

  double get rpx{
    return ScreenInfos.getRpx(this);
  }
}

extension IntPx on int {
  // double px(){
  //   return ScreenInfos.getPx(toDouble());
  // }
  //
  // double rpx() {
  //   return ScreenInfos.getRpx(toDouble());
  // }

  double get px {
    return ScreenInfos.getPx(toDouble());
  }

  double get rpx {
    return ScreenInfos.getRpx(toDouble());
  }
}