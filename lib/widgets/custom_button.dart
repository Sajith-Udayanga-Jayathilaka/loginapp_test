import 'package:flutter/material.dart';
import 'package:loginapp/widgets/custom_text.dart';

// ignore: must_be_immutable
class CustomButton1 extends StatefulWidget {
  final String buttonName;
  final List<Color> colors;
  VoidCallback ontap;
  CustomButton1({
    super.key,
    required this.size,
    required this.buttonName,
    required this.colors,
    required this.ontap,
  });

  final Size size;

  @override
  State<CustomButton1> createState() => _CustomButton1State();
}

class _CustomButton1State extends State<CustomButton1> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_){
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_){
        setState(() {
          _isPressed = false;
        });
        widget.ontap();
      },
      onTapCancel: (){
        _isPressed = false;
      }, 
      //onTap: widget.ontap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          width: widget.size.width,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: _isPressed ? [Colors.lightBlueAccent, Colors.lightBlueAccent] : widget.colors,
            )
          ),
          child: Center(
            child: CustomText(
              text: widget.buttonName, 
              color: Colors.white,
              fontSize: 16,),
          ),
        ),
      ),
    );
  }
}