import 'package:flutter/material.dart';

// Widget defaultFormField({
//   @required TextEditingController controller,
//   @required TextInputType type,
//   Function onSubmit,
//   Function onChange,
//   Function onTap,
//   IconData suffix,
//   Function suffixPressed,
//   @required Function validate,
//   @required String label,
//   @required IconData prefix,
//   bool isClickable = true,
//   bool isPassword,
// }) =>
//     TextFormField(
       
//       controller: controller,
//       keyboardType: type,
//       onFieldSubmitted: onSubmit,
//       onChanged: onChange,
//       onTap: onTap,
//       validator: validate,
//       enabled: isClickable,
      
//       decoration: InputDecoration(
//           labelText: label,
//           prefixIcon: Icon(prefix),
          
//           border: OutlineInputBorder()),
//     );


Widget defaultTextField({
  @required TextEditingController controller,
  bool isPassword = false,
  @required TextInputType type,
  Function onSubmit,
  Function onTap,
  @required String text,
  @required IconData prefix,
  IconData suffix,
  Function suffixFunction,
  String textForUnValid = 'this element is required',
  @required Function validate, 
}) =>
    Container(
      child: TextFormField(
        autocorrect: true,
        controller: controller,
        onTap: () {
          onTap();
        },
        validator: (value) {
          if (value.isEmpty) {
            return textForUnValid;
          }
          return null;
        },
        onChanged: (value) {},
        onFieldSubmitted: (value) {
          onSubmit(value);
        },
        obscureText: isPassword ? true : false,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          labelText: text,
          prefixIcon: Icon(prefix),
          suffixIcon: IconButton(
            onPressed: () {
              suffixFunction();
            },
            icon: Icon(suffix),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: const BorderSide(),
              gapPadding: 4),
        ),
      ),
    );

