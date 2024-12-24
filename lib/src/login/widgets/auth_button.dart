import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  const AuthButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        gradient: LinearGradient(
          colors: [
            Color(0xFFBE4ACC),
            Color(0xFFE173C6),
            Color(0xFFC68E0F),
          ]
        ),
      ),
      child: ElevatedButton(
        onPressed: (){
          onPressed();
        },
        child: Text(text, style: TextStyle(fontSize: 20),),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 50),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent
        ),
      ),
    );
  }
}
