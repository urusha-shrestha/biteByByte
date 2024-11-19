import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class GridViewItem extends StatelessWidget {
  final String recipeName;
  final bool even;
  const GridViewItem({super.key, required this.recipeName, this.even=true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: Container(

        height: 150,
        width: MediaQuery.of(context).size.width/2.4,
        
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(color:neutralColor,blurRadius: 8,spreadRadius: 0.2, offset: const Offset(4,4))]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            even ? Container(
          height: 150, width: 90,
          decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/recommended_3.png'),
                  fit: BoxFit.cover,
                  alignment: Alignment.centerRight),

              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(70),
                  bottomRight: Radius.circular(70),
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10))
          ),
        ): Container(),

            const Text('Recipe'),
            !even ? Container(
height: 150, width: 90,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/recommended_1.png'),
                fit: BoxFit.cover,
                alignment: Alignment.centerLeft),

                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    topLeft: Radius.circular(70),
                    bottomLeft: Radius.circular(70))
              ),
            ): Container(),
          ],
        ),
      ),
    );
  }
}
