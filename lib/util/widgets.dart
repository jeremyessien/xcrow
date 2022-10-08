import 'package:flutter/material.dart';
import 'package:xcrow/util/utils/brand_colors.dart';

class DefaultTxtField extends StatelessWidget {
  String hint;
  bool obstxt;
 DefaultTxtField({Key? key, required this.hint, this.obstxt = false, }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var textFieldController = TextEditingController();
    return TextField(
      controller: textFieldController,
      obscureText: obstxt,
      decoration:  InputDecoration(
        focusColor: BrandColors.colorPrimary,
        hintText: hint,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: BrandColors.colorPrimary,
            width: 1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10))
        )

      ),
    );
  }
}
