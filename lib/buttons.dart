import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'flutter_flow_theme.dart';

class CalcButton extends StatelessWidget {
  final String buttonText;
  final Color color;
  final Color backgroundColor;
  final FontWeight fontWeight;
  final GestureTapCallback onTap;

  const CalcButton(
      {Key key,
      @required this.buttonText,
      @required this.color,
      this.fontWeight = FontWeight.w600,
      this.onTap,
      this.backgroundColor=const Color(0xFF22252E)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 0, 1),
        child: Material(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            onTap: onTap,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.20,
              height: MediaQuery.of(context).size.width * 0.15,
              child: Align(
                alignment: Alignment(0, 0),
                child: Text(
                  buttonText,
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Poppins',
                    color: color,
                    fontSize: 20,
                    fontWeight: fontWeight,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CalcIconButton extends StatelessWidget {
  final IconData iconData;
  final Color color;
  final Color backgroundColor;
  final double size;
  final GestureTapCallback onTap;

  const CalcIconButton(
      {Key key,
      @required this.iconData,
      @required this.color,
      this.size = 20,
      this.onTap,
      this.backgroundColor=const Color(0xFF22252E)})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 0, 1),
        child: Material(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            onTap: onTap,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.20,
              height: MediaQuery.of(context).size.width * 0.15,
              child: Align(
                alignment: Alignment(0, 0),
                child: FaIcon(
                  iconData,
                  color: color,
                  size: size,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
