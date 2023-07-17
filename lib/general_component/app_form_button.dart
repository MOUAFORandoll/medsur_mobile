// import 'package:flutter/material.dart';
// import 'package:medsurlink/common/constants/size_constants.dart';
// import 'package:medsurlink/common/index_common.dart';

// class AppFormButton extends StatelessWidget {
//   final Color bgColor;
//   final Color textColor;
//   final String text;
//   final Widget? leading;
//   final VoidCallback? onTap;
//   final bool disabled;
//   final MainAxisSize size;
//   const AppFormButton({
//     Key? key,
//     required this.text,
//     this.bgColor = AppColors.primaryGreen,
//     this.textColor = Colors.white,
//     this.onTap,
//     this.leading,
//     this.disabled = false,
//     this.size = MainAxisSize.min,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: disabled ? null : onTap,
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
//           color: disabled ? bgColor.withOpacity(.5) : bgColor,
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisSize: size,
//           children: [
//             if (leading != null)
//               Padding(
//                 padding: const EdgeInsets.only(right: 5.0),
//                 child: leading!,
//               ),
//             Text(
//               text,
//               style: TextStyle(
//                 color: disabled ? textColor.withOpacity(.5) : textColor,
//                 fontWeight: FontWeight.w600,
//                 fontSize: 16,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
