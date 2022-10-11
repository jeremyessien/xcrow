import 'package:flutter/material.dart';
import 'package:xcrow/util/utils/brand_colors.dart';

class SearchVendors extends StatefulWidget {
  const SearchVendors({Key? key}) : super(key: key);

  @override
  State<SearchVendors> createState() => _SearchVendorsState();
}

class _SearchVendorsState extends State<SearchVendors> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: BrandColors.colorAccent,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: BrandColors.colorBackground,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: const Text('Search Vendor'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: BrandColors.colorBackground,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: const EdgeInsets.all(20),
            height: MediaQuery.of(context).size.height,
            color: BrandColors.colorAccent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
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
                    hintText: 'Search vendors...',
                    hintStyle: const TextStyle(fontWeight: FontWeight.w600),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'What are you looking for?',
                      style: TextStyle(
                          color: BrandColors.colorBackground, fontSize: 15),
                    )),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Prodcut Category?',
                  style: TextStyle(
                      color: BrandColors.colorBackground,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: BrandColors.colorBackground,
                    hintText: 'Category',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Transaction title',
                  style: TextStyle(
                      color: BrandColors.colorBackground,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: BrandColors.colorBackground,
                    hintText: 'Enter your transaction title here...',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Transaction descritpion',
                  style: TextStyle(
                      color: BrandColors.colorBackground,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextField(
                  maxLines: 6,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: BrandColors.colorBackground,
                    hintText: 'Enter your transaction description here...',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Country',
                  style: TextStyle(
                      color: BrandColors.colorBackground,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: BrandColors.colorBackground,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                    onTap: () {},
                    child: Container(
                        alignment: Alignment.center,
                        width: double.maxFinite,
                        height: 45,
                        decoration: const BoxDecoration(
                            color: BrandColors.colorPrimaryDark,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: const Text(
                          'Continue',
                          style: TextStyle(
                              color: BrandColors.colorBackground,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
