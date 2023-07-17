// import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:medsurlink/common/index_common.dart';

// class AppDateForm extends StatefulWidget {
//   const AppDateForm({
//     Key? key,
//     this.label,
//     this.controller,
//     this.hintText,
//     this.validator,
//     this.onSaved,
//   }) : super(key: key);

//   final Widget? label;
//   final TextEditingController? controller;
//   final String? hintText;
//   final Function(DateTime?)? validator;
//   final Function(DateTime?)? onSaved;

//   @override
//   _AppDateFormState createState() => _AppDateFormState();
// }

// class _AppDateFormState extends State<AppDateForm> {
//   final format = DateFormat("yyyy/MM/dd");
//   @override
//   Widget build(BuildContext context) {
//     return DateTimeField(
//       format: format,
//       onShowPicker: (context, currentValue) async {
//         final date = await showDatePicker(
//             context: context,
//             firstDate: DateTime(1900),
//             initialDate: currentValue ?? DateTime.now(),
//             lastDate: DateTime(2100));
//         if (date != null) {
//           final time = await showTimePicker(
//             context: context,
//             initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
//           );
//           return DateTimeField.combine(date, time);
//         } else {
//           return currentValue;
//         }
//       },
//       controller: widget.controller,
//       decoration: InputDecoration(
//         hintText: widget.hintText,
//         label: widget.label,
//         contentPadding: const EdgeInsets.all(20.0),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(4),
//           borderSide: const BorderSide(
//             width: 1,
//             style: BorderStyle.solid,
//             color: AppColors.primaryGreen,
//           ),
//         ),
//       ),
//       validator: widget.validator as String? Function(DateTime?)?,
//       onSaved: widget.onSaved,
//       keyboardType: TextInputType.text,
//     );
//   }
// }
