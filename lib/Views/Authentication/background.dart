import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  final String image;
  final double height;
  final double width;
  const Background({super.key,
    required this.child,
    required this.image,
    this.width = 400,
    this.height = .7,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: SingleChildScrollView(


        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(12),
                      height: size.height * height,
                      width: width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 1,
                                spreadRadius: 0
                            )

                          ]

                      ),
                      child: child,
                    ),
                    Image.asset("assets/photos/$image")
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
