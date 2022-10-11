import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:xcrow/util/utils/brand_colors.dart';

class SellersScreen extends StatelessWidget {
  static const routeName = 'sellers_screen';

 const SellersScreen({super.key});
  TextStyle homeScreenTextStyle() {
    return const TextStyle(
        color: BrandColors.colorText,
        fontSize: 20,
        fontWeight: FontWeight.w500);
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: BrandColors.colorBackground,
        body: Padding(
          padding: const EdgeInsets.only(
            top: 10.0,
            left: 5,
            right: 5,
          ),
          child: ListView(
            children: [
              Row(
                children: [
                  const BackButton(),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: const Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 30,
                          ),
                          onPressed: () {},
                        ),
                        filled: true,
                        fillColor: BrandColors.colorBackground,
                        hintText: 'Vendors List...',
                        hintStyle: const TextStyle(fontWeight: FontWeight.w600),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color: BrandColors.colorGreen,
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 30,
                childAspectRatio: 0.85,
                padding: const EdgeInsets.all(20),
                shrinkWrap: true,
                children: [
                  ...List.generate(20, (index) => AlertsCardMobile(
                    textStyle: homeScreenTextStyle(),
                    companyTitle: 'hhh',
                    navigateOnTap: () {},
                  ),)
                  // AlertsCardMobile(
                  //   textStyle: homeScreenTextStyle(),
                  //   companyTitle: 'hhh',
                  //   navigateOnTap: () {},
                  // ),
                  // AlertsCardMobile(
                  //   textStyle: homeScreenTextStyle(),
                  //   companyTitle: 'jjhhj',
                  //   navigateOnTap: () {},
                  // ),
                  // AlertsCardMobile(
                  //   textStyle: homeScreenTextStyle(),
                  //   companyTitle: 'gggh',
                  //   navigateOnTap: () {},
                  // ),
                  // AlertsCardMobile(
                  //   textStyle: homeScreenTextStyle(),
                  //   companyTitle: 'gvgh',
                  //   navigateOnTap: () {},
                  // ),
                ],
              ),
            ],
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
    required this.onTap,
  }) : super(key: key);

  final Size size;
  final double height, width;
  final String imgUrl, text;
  final TextStyle? textStyle;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
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
      ),
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
    required this.onTap,
  }) : super(key: key);

  final Size size;
  final double height;
  final String text, imgUrl;
  final TextStyle? textStyle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
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
            )),
      ),
    );
  }
}

class AlertsCardMobile extends StatelessWidget {
  AlertsCardMobile({
    Key? key,
    required this.textStyle,
    required this.companyTitle,
    required this.navigateOnTap,
  }) : super(key: key);

  final TextStyle textStyle;
  final String companyTitle;
  final VoidCallback navigateOnTap;
  final fake = Faker();

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      // fit: StackFit.expand,
      children: [
        GestureDetector(
          onTap: navigateOnTap,
          child: Card(
            clipBehavior: Clip.hardEdge,
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Stack(
              fit: StackFit.expand,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(
                  faker.image.image(
                    keywords: ['people'],
                    random: true,
                  ),
                  fit: BoxFit.cover,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    height: 60,
                    // padding: const EdgeInsets.only(bottom: 45),
                    decoration: const BoxDecoration(
                        color: BrandColors.colorTextLight,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        )),
                    child: Center(
                      child: ListTile(
                        contentPadding: EdgeInsets.only(left: 10),
                        minVerticalPadding: 1,
                        title: Text(
                          fake.person.name(),
                          style: const TextStyle(
                            fontSize: 13,
                            color: BrandColors.colorBackground,
                          ),
                          maxLines: 1,
                        ),
                        subtitle: Text(
                          faker.job.title(),
                          style: const TextStyle(
                            fontSize: 13,
                            color: BrandColors.colorBackground,
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
