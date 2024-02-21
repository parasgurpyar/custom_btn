library custom_btn;


import 'package:flutter/material.dart';

class Btn extends StatefulWidget {
  final String? title;
  final double? borderRadius;
  final Widget? child;
  final double? textPadding;
  final EdgeInsetsGeometry? customPadding;
  final bool? loading;
  final double? width;
  final double? loaderWidth;
  final double? loaderHeight;
  final double? height;
  final VoidCallback? onTap;
  final Color? backGroundColor;
  final Color? loaderColor;
  final Color? borderColor;
  final Color? textColor;
  final double? textSize;
  final double? borderWidth;
  final TextStyle? titleStyle;
  final List<BoxShadow>? boxShadow;
  final EdgeInsetsGeometry? margin;

  const Btn({
    Key? key,
    this.title,
    this.onTap,
    this.backGroundColor,
    this.titleStyle,
    this.textColor,
    this.child,
    this.borderColor,
    this.borderWidth,
    this.loaderWidth,
    this.loaderHeight,
    this.loading,
    this.borderRadius,
    this.loaderColor,
    this.width,
    this.height,
    this.textPadding,
    this.customPadding,
    this.boxShadow,
    this.textSize,
    this.margin,
  }) : super(key: key);

  @override
  State<Btn> createState() => _BtnState();
}

class _BtnState extends State<Btn> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (widget.loading ?? false) ? null : widget.onTap,
      child: Container(
        width: widget.width ?? double.infinity,
        height: widget.height,
        margin: widget.margin,
        decoration: BoxDecoration(
            color: widget.backGroundColor ?? Colors.blue,
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
            boxShadow: widget.boxShadow,
            border: Border.all(
                color: widget.borderColor ?? Colors.transparent,
                width: widget.borderWidth ?? 0)),
        child: Padding(
          padding: widget.customPadding ??
              EdgeInsets.all(widget.textPadding ?? 13.0),
          child: Center(
            child: (widget.loading ?? false)
                ? customLoader(
                color: widget.loaderColor ?? Colors.white,
                height: widget.loaderHeight ?? 25,
                width: widget.loaderWidth ?? 25)
                : (widget.child != null)
                ? (widget.child)
                : Text(
              (widget.title ?? ""),
              style: widget.titleStyle ??
                  TextStyle(
// fontWeight: FontWeight.w500,
                    fontSize: widget.textSize ?? 16,
                    fontWeight:FontWeight.w500,
                    color: widget.textColor ?? Colors.white,
                  ),
            ),
          ),
        ),
      ),
    );
  }
  Widget customLoader({
    double height = 25,
    double width = 25,
    Color color = Colors.black,
    double? value,
  }) {
    return SizedBox(
      height: height,
      width: width,
      child: CircularProgressIndicator(
        color: color,
        value: value,
      ),
    );
  }
}
