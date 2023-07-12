import 'package:flutter/material.dart';
import 'package:social_media/theme/colors_theme.dart';

class CustomFormButton extends StatelessWidget {
  final String innerText;
  final void Function()? onPressed;
  final double? horizontalPadding;
  const CustomFormButton({Key? key, required this.innerText, required this.onPressed,this.horizontalPadding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: size.width * 0.82,minWidth: size.width * 0.82,minHeight: horizontalPadding ?? 45),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(shape: MaterialStateProperty.all(const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))
        )),
        backgroundColor: MaterialStateProperty.all(ThemeColor.blue)),
        child: Text(innerText, style: Theme.of(context)
            .textTheme
            .bodyText2
            ?.copyWith(
            fontFamily: 'DMSans',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: ThemeColor.white),
        ),
      ),
    );
  }
}

