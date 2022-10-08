import 'package:flutter/material.dart';
import 'package:xcrow/util/utils/brand_colors.dart';
import 'package:xcrow/util/utils/image_constants.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Home screen'),
      // ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  tileMode: TileMode.mirror,
                  colors: [
                    BrandColors.colorPrimary,
                    Color.fromARGB(255, 26, 95, 173),

                    BrandColors.whiteColor,
                    Color.fromARGB(255, 172, 167, 167),
                    Color.fromARGB(255, 76, 70, 70),
                    // Colors.black,
                  ],
                  // stops: [
                  //   0.3,
                  //   0.6,
                  //   0.9,
                  // ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Positioned(
              right: 10,
              top: 8,
              child: Image.asset(
                xcrowLogoDark,
                width: size.width * 0.4,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: size.height * 0.1),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: XcrowLoginButton(
                  title: 'Get Started',
                  onTap: () {
                    // pushNamed
                  },
                ),
              ),
            ),

            // Image.asset(''),
          ],
        ),
      ),
    );
  }
}

class XcrowLoginButton extends StatelessWidget {
  const XcrowLoginButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 20,
          ),
          backgroundColor: BrandColors.colorPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )),
      onPressed: onTap,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 23,
        ),
      ),
    );
  }
}
