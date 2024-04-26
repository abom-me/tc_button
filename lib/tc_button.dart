library tc_button;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class TCButton extends StatefulWidget {
  const TCButton({super.key, required this.title,  this.bgColor,  this.icon,  this.iconSize,  this.iconColor,  this.textStyle, required this.onPressed,  this.enabled, required this.width, required this.height,  this.disableMultiTap});
  final String title ;
  final Color? bgColor;
  final bool? disableMultiTap;
  final IconData? icon;
  final double? iconSize;
  final Color? iconColor;
  final TextStyle? textStyle;
  final VoidCallback onPressed;
  final bool? enabled;
  final double width;
  final double height;




  @override
  State<TCButton> createState() => _TCButtonState();
}

class _TCButtonState extends State<TCButton> {
 bool enabled = true;
 bool isPressed = false;
inti(){
  enabled=widget.enabled??true;
  setState(() {

  });
}
@override
  void initState() {
  inti();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
       if(enabled){
          isPressed = true;
         widget.onPressed();
         if(widget.disableMultiTap == true){
          enabled = false;
            setState(() {

            });
            Future.delayed(const Duration(seconds: 3),(){
              enabled = true;
              setState(() {

              });
            });
         }
       }
      },
      child: AnimatedContainer(
        width:isPressed?widget.width-20: widget.width,
        height: isPressed?widget.height-5:widget.height,
        decoration: BoxDecoration(
          color: enabled==true?widget.bgColor??Theme.of(context).colorScheme.primary:Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        duration: Duration(milliseconds: 300),
        onEnd: (){
          isPressed = false;
          setState(() {

          });

        },
        child: Center(
          child: isPressed||(enabled==false && widget.disableMultiTap==true)?CircularProgressIndicator():Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.icon != null
                  ? Icon(
                      widget.icon,
                      size: widget.iconSize,
                      color: widget.iconColor,
                    )
                  : Container(),
              widget.icon != null
                  ? const SizedBox(
                      width: 10,
                    )
                  : Container(),
              Text(
                widget.title,
                style: widget.textStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

