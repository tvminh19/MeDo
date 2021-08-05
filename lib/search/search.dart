import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_scraper/web_scraper.dart';
import 'components/medicineInfo.dart';

class MySearch extends StatefulWidget {
  const MySearch({Key? key}) : super(key: key);

  @override
  _MySearchState createState() => _MySearchState();
}

class _MySearchState extends State<MySearch> {
  final webScraper = WebScraper('https://www.thuocbietduoc.com.vn');

  List<Map<String, dynamic>>? productNames;
  List<Map<String, dynamic>>? productImages;
  List<Map<String, dynamic>>? productIngredients;
  List<int> emptyIndex = [];

  void fetchProducts() async {
    if (await webScraper.loadWebPage(
        '/thuoc/drgsearch.aspx?act=DrugSearch&key=Panadol&opt=TT')) {
      setState(() {
        // getElement takes the address of html tag/element and attributes you want to scrap from website
        // it will return the attributes in the same order passed
        productNames = webScraper.getElement('a.textlink01_v', ['innerText']);
        productImages = webScraper.getElement('img.imgdrg_lst', ['src']);
        productNames!.forEach((element) {
          int i = productNames!.indexOf(element);
          if (productNames![i]['title'].toString() == '') emptyIndex.add(i);
        });
        emptyIndex.forEach((element) {
          productNames!.removeAt(element);
        });
        productIngredients = webScraper.getElement(
            '#dlstThuoc > tbody > tr > td > table > tbody > tr:nth-child(2) > td.textdrg_hoz > div',
            ['innerText']);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          productNames == null || productNames!.length < 1
              ? Center(
                  child: Center(
                      child:
                          CircularProgressIndicator()), // Loads Circular Loading Animation
                )
              : Flexible(
                  child: medicineInfo(
                      productNames: productNames,
                      productImages: productImages,
                      productIngredients: productIngredients),
                ),
        ],
      ),
    );
  }
}
