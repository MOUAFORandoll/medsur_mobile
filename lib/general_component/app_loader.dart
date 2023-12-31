import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:medsur_app/constants/index_common.dart';

import 'bounce_loader.dart';

/// App loaders
/// final _loaderDialogController = IndeterminateProgress.bounceLargeColorLoaderController();
/// _loaderDialogController.open(context);
/// _loaderDialogController.close();
//
///
class AppLoader {
  static Widget circular(
      {Color? color, double scale = .7, double strokeWidth = 6}) {
    color ??= AppColors.primaryGreen;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Transform.scale(
            scale: scale,
            child: CircularProgressIndicator(
              strokeWidth: strokeWidth,
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ))
      ],
    );
  }

  static Widget ballClipRotateMultiple({double size = 50, Color? color}) {
    return Container(
        alignment: Alignment.center,
        height: size,
        width: size,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            LoadingIndicator(
              indicatorType: Indicator.ballClipRotateMultiple,
              backgroundColor: color,
            ),
          ],
        ));
  }

  static Widget ballRotateChase({double size = 50, Color? color}) {
    return SizedBox(
      height: size,
      width: size,
      child: const LoadingIndicator(indicatorType: Indicator.ballRotateChase),
    );
  }

  static Widget bounceLargeColorLoader({double radius = 30.0}) =>
      BounceLargeColorLoader(
        radius: radius,
      );

  static LoaderDialogController bounceLargeColorLoaderController() =>
      LoaderDialogController(loader: BounceLargeColorLoader());
}

class _LoaderDialog extends StatefulWidget {
  final Widget loader;
  final StreamController<String> controller;

  /// Create a loader dialog that cannot be
  /// dismissed by pressing the back button.
  const _LoaderDialog({required this.loader, required this.controller});

  @override
  _LoaderDialogState createState() => _LoaderDialogState();

  /// Show the dialog loader.
  void open(BuildContext context) {
    showDialog(
        context: context, barrierDismissible: false, builder: (ctx) => this);
  }
}

class _LoaderDialogState extends State<_LoaderDialog> {
  bool loading = true;

  @override
  void initState() {
    super.initState();
    widget.controller.stream.listen((event) {
      // if (mounted) {
      if (event == 'close' /* && loading */) {
        //print("close loader required");
        setState(() {
          loading = false;
        });
        WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
          Navigator.of(context).canPop() ? Navigator.of(context).pop() : null;
        });
        // }
      }
    });
  }

  @override
  void dispose() {
    widget.controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => !loading,
      child: Center(
        child: widget.loader,
      ),
    );
  }
}

class LoaderDialogController {
  Widget loader;

  StreamController<String> _streamController = StreamController<String>();

  LoaderDialogController({required this.loader});

  /// Show the dialog
  void open(BuildContext context) {
    _streamController = StreamController<String>();
    _LoaderDialog(loader: loader, controller: _streamController).open(context);
  }

  /// Close the dialog
  close() {
    if (_streamController.isClosed) {
      _streamController = StreamController<String>();
    }
    // _streamController.add('close');
    // _streamController.close();
    return _streamController..add('close');
  }
}

class Load {
  int dialogId = 1;

  /// Show the dialog loader.
  void open() {
    Get.dialog(
        Container(
            width: 100.0,
            height: 100.0,
            //color: AppColors.primaryBlue12,
            child: Center(
                child: Container(
                    child: Image.asset(
              Assets.spin,
              fit: BoxFit.fill,
              height: kMdHeight / 30,
            )))),
        name: dialogId.toString());
  }

  void close() {
    // Get.back();
    // Get.close(dialogId);
    Navigator.of(Get.context!).pop();
  }
}
// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:loading_indicator/loading_indicator.dart';
// import 'package:medsur_app/constants/index_common.dart';

// import 'bounce_loader.dart';

// /// App loaders
// /// final _loaderDialogController = IndeterminateProgress.bounceLargeColorLoaderController();
// /// _loaderDialogController.open(context);
// /// _loaderDialogController.close();
// ///
// class AppLoader {
//   static Widget circular(
//       {Color? color, double scale = .7, double strokeWidth = 6}) {
//     color ??= AppColors.primaryGreen;
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Transform.scale(
//           scale: scale,
//           child: CircularProgressIndicator(
//             strokeWidth: strokeWidth,
//             valueColor: AlwaysStoppedAnimation<Color>(color),
//           ),
//         ),
//       ],
//     );
//   }

//   static Widget ballClipRotateMultiple({double size = 50, Color? color}) {
//     return Container(
//       alignment: Alignment.center,
//       height: size,
//       width: size,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           LoadingIndicator(
//             indicatorType: Indicator.ballClipRotateMultiple,
//             backgroundColor: color,
//           ),
//         ],
//       ),
//     );
//   }

//   static Widget ballRotateChase({double size = 50, Color? color}) {
//     return SizedBox(
//       height: size,
//       width: size,
//       child: const LoadingIndicator(indicatorType: Indicator.ballRotateChase),
//     );
//   }

//   static Widget bounceLargeColorLoader({double radius = 30.0}) =>
//       BounceLargeColorLoader(
//         radius: radius,
//       );

//   static LoaderDialogController bounceLargeColorLoaderController() =>
//       LoaderDialogController(
//         loader: BounceLargeColorLoader(),
//       );
// }

// class _LoaderDialog extends StatefulWidget {
//   final Widget loader;
//   final StreamController<String> controller;

//   /// Create a loader dialog that cannot be
//   /// dismissed by pressing the back button.
//   const _LoaderDialog({required this.loader, required this.controller});

//   @override
//   _LoaderDialogState createState() => _LoaderDialogState();

//   /// Show the dialog loader.
//   void open(BuildContext context) {
//     showDialog<void>(
//       context: context,
//       barrierDismissible: false,
//       builder: (ctx) => this,
//     );
//   }
// }

// class _LoaderDialogState extends State<_LoaderDialog> {
//   bool loading = true;

//   @override
//   void initState() {
//     super.initState();
//     widget.controller.stream.listen((event) {
//       if (mounted) {
//         if (event == 'close' && loading) {
//           //print("close loader required");
//           setState(() {
//             loading = false;
//           });
//           WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
//             if (Navigator.of(context).canPop()) {
//               Navigator.of(context).pop();
//             }
//           });
//         }
//       }
//     });
//   }

//   @override
//   void dispose() {
//     widget.controller.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async => !loading,
//       child: Center(
//         child: widget.loader,
//       ),
//     );
//   }
// }

// class LoaderDialogController {
//   Widget loader;

//   StreamController<String> _streamController = StreamController<String>();

//   LoaderDialogController({required this.loader});

//   /// Show the dialog
//   void open(BuildContext context) {
//     _streamController = StreamController<String>();
//     _LoaderDialog(loader: loader, controller: _streamController).open(context);
//   }

//   /// Close the dialog
//   StreamController<String> close() {
//     if (_streamController.isClosed) {
//       _streamController = StreamController<String>();
//     }
//     return _streamController..add('close');
//   }
// }
