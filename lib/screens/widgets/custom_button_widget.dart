import 'package:bitebybyte/constants/colors.dart';
import 'package:bitebybyte/screens/loading_page/loading_page.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,this.loading=false,
    this.back=false,
  });
  final bool loading;
  final bool back;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        back ? Navigator.of(context).pop():
        loading ? Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=>LoadingPage(recommending: true))) :
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=>LoadingPage(recommending: true)));
      },
      child: Container(
        height: 50,
        width: back? MediaQuery.sizeOf(context).width/3.5 :
              MediaQuery.sizeOf(context).width/1.42,
        color: primaryColor,
        child: Icon(
            back ? Icons.arrow_back_sharp:
            Icons.arrow_forward_sharp,
            size:30,
            color: backgroundColor),
      ),
    );
  }
}