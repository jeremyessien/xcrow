import 'package:flutter/material.dart';
import 'package:xcrow/util/utils/brand_colors.dart';
import 'package:xcrow/util/utils/image_constants.dart';

class ServicesScreen extends StatelessWidget {
  static const routeName = 'services_screen';

  const ServicesScreen({super.key});
  TextStyle homeScreenTextStyle() {
    return const TextStyle(
        color: BrandColors.colorBackground,
        fontSize: 20,
        fontWeight: FontWeight.w500);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: BrandColors.colorBackground,
          bottomNavigationBar: BottomAppBar(
            color: BrandColors.colorBackground,
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(
                  color: BrandColors.colorTextDark,
                  width: 3,
                  style: BorderStyle.solid,
                ),
                insets: EdgeInsets.all(5),
              ),
              tabs: [
                Tab(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.home,
                        color: BrandColors.colorTextDark,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Dashboard',
                        style: TextStyle(
                            color: BrandColors.colorTextDark,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Tab(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.history,
                        color: BrandColors.colorTextDark,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Task History',
                        style: TextStyle(
                          color: BrandColors.colorTextDark,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
              left: 5,
              right: 5,
            ),
            child: TabBarView(
              children: [
                Container(
                  height: size.height,
                  width: size.width,
                  color: BrandColors.colorBackground,
                  child: ListView(
                    children: [
                      SellerCardHorizontal(
                        size: size,
                        height: 0.12,
                        text: 'Fashion Designers',
                        imgUrl: fashiondesigner,
                        textStyle: homeScreenTextStyle(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: SellerCardVert(
                              size: size,
                              height: 0.22,
                              width: 0.3,
                              imgUrl: logoDesigner,
                              text: 'logo design',
                              textStyle: homeScreenTextStyle(),
                            ),
                          ),
                          Expanded(
                            child: SellerCardVert(
                              size: size,
                              height: 0.22,
                              width: 0.3,
                              imgUrl: logoDesigner,
                              text: 'Social Media Influencer',
                              textStyle: homeScreenTextStyle(),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SellerCardHorizontal(
                        size: size,
                        height: 0.12,
                        text: 'Crypto Merchant',
                        imgUrl: cryptoMerchant,
                        textStyle: homeScreenTextStyle(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: SellerCardVert(
                              size: size,
                              height: 0.22,
                              width: 0.3,
                              imgUrl: productdesigner,
                              text: 'Product designer',
                              textStyle: homeScreenTextStyle(),
                            ),
                          ),
                          Expanded(
                            child: SellerCardVert(
                              size: size,
                              height: 0.22,
                              width: 0.3,
                              imgUrl: hairVendor,
                              text: 'hair vendors',
                              textStyle: homeScreenTextStyle(),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: SellerCardVert(
                              size: size,
                              height: 0.22,
                              width: 0.3,
                              imgUrl: webDesigner,
                              text: 'Web Developers',
                              textStyle: homeScreenTextStyle(),
                            ),
                          ),
                          Expanded(
                            child: SellerCardVert(
                              size: size,
                              height: 0.22,
                              width: 0.3,
                              imgUrl: clothVendor,
                              text: 'Cloth vendors',
                              textStyle: homeScreenTextStyle(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: size.height,
                  width: size.width,
                  color: BrandColors.colorGreen,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SellerCardVert extends StatelessWidget {
  const SellerCardVert({
    Key? key,
    required this.size,
    required this.height,
    required this.width,
    required this.imgUrl,
    required this.text,
    this.textStyle,
  }) : super(key: key);

  final Size size;
  final double height, width;
  final String imgUrl, text;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * width,
      height: size.height * height,
      child: Card(
          clipBehavior: Clip.hardEdge,
          color: BrandColors.colorPrimary,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 3,
                ),
                Image.asset(
                  imgUrl,
                  width: size.width * 0.35,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          )),
    );
  }
}

class SellerCardHorizontal extends StatelessWidget {
  const SellerCardHorizontal({
    Key? key,
    required this.size,
    required this.height,
    required this.text,
    required this.imgUrl,
    this.textStyle,
  }) : super(key: key);

  final Size size;
  final double height;
  final String text, imgUrl;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height * height,
      child: Card(
          clipBehavior: Clip.hardEdge,
          color: BrandColors.colorPrimary,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: ListTile(
              title: Text(text, style: textStyle),
              trailing: Image.asset(
                imgUrl,
                width: 100,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          )

          // Row(
          //   mainAxisSize: MainAxisSize.min,
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     const Text('Fashion designers'),
          //     // const SizedBox(
          //     //   height: 2,
          //     // ),
          //     Image.asset(
          //       xcrowLogoDark,
          //       width: 100,
          //       height: 20,
          //       fit: BoxFit.cover,
          //     ),
          //   ],
          // ),
          ),
    );
  }
}
