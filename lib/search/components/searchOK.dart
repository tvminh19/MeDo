import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_scraper/web_scraper.dart';

import 'medicineInfo.dart';

class SearchComplete extends StatefulWidget {
  final String nameOfMedicine;
  const SearchComplete({
    Key? key,
    required this.nameOfMedicine,
  }) : super(key: key);

  @override
  _SearchCompleteState createState() => _SearchCompleteState();
}

class _SearchCompleteState extends State<SearchComplete> {
  final webScraper = WebScraper('https://www.thuocbietduoc.com.vn');

  List<Map<String, dynamic>>? productNames;
  List<Map<String, dynamic>>? productImages;
  List<Map<String, dynamic>>? productDetails;
  List<int> emptyIndex = [];

  void fetchProducts() async {
    if (await webScraper
        .loadWebPage('/thuoc/drgsearch.aspx?act=DrugSearch&key=' +
            widget.nameOfMedicine +
            // 'Panadol' +
            '&opt=TT')) {
      setState(() {
        // getElement takes the address of html tag/element and attributes you want to scrap from website
        // it will return the attributes in the same order passed
        productNames = webScraper.getElement('a.textlink01_v', ['innerText']);
        productImages = webScraper.getElement('img.imgdrg_lst', ['src']);

        preprocessMedicineList();

        productDetails = webScraper.getElement('td.textdrg_hoz', ['innerText']);
      });
    }
  }

  void preprocessMedicineList() {
    productNames!.forEach((element) {
      int i = productNames!.indexOf(element);
      if (productNames![i]['title'].toString() == '') emptyIndex.add(i);
    });
    emptyIndex.forEach((element) {
      productNames!.removeAt(element);
    });
  }

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: productNames == null || productNames!.length < 1
          ? Center(
              child: Center(
                  child:
                      CircularProgressIndicator()), // Loads Circular Loading Animation
            )
          : medicineInfo(
              productNames: productNames,
              productImages: productImages,
              productDetails: productDetails,
            ),
    ));
  }
}
