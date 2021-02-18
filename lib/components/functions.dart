import 'package:flutter/material.dart';
import 'constants.dart';


class CardReusable extends StatelessWidget {
  final Color colour;
  final double height;
  final Widget cardChild;
  final Function onPress;
  CardReusable(
      {@required this.colour,
      this.height,
      this.cardChild,
      this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(5.0),
        height: height,
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: cardChild,
      ),
    );
  }
}


class SexSelectorContent extends StatelessWidget {
  final String label;
  final IconData icono;

  SexSelectorContent({this.label, this.icono});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icono,
          size: 80.0,
        ),
        SizedBox(height: 15.0),
        Text(
          label,
          style: klabelTextStyle,
        )
      ],
    );
  }
}



class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function operation;
  RoundIconButton({this.icon, this.operation});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Color(0xFF4C4F5E),
      elevation: 6.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      onPressed: operation,
      child: Icon(icon),
    );
  }
}

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap, @required this.buttonTitle});
  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargeButtonTextStyle,
          ),
        ),
        color: Color(0xFFEB1555),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: 80.0,
        padding: EdgeInsets.only(bottom: 20.0),
      ),
    );
  }
}
