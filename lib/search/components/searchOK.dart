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
  var _check;
  var timeout = false;

  void fetchProducts() async {
    _check = await webScraper.loadWebPage(
        '/thuoc/drgsearch.aspx?act=DrugSearch&key=' +
            widget.nameOfMedicine +
            '&opt=TT');
    if (_check) {
      Future.delayed(Duration(seconds: 5));
      setState(() {
        // getElement takes the address of html tag/element and attributes you want to scrap from website
        // it will return the attributes in the same order passed
        productNames = webScraper.getElement('a.textlink01_v', ['innerText']);
        productImages = webScraper.getElement('img.imgdrg_lst', ['src']);

        preprocessMedicineList();

        productDetails = webScraper.getElement('td.textdrg_hoz', ['innerText']);
        timeout = true;
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
    return Scaffold(body: SafeArea(child: getBody()));
  }

  getBody() {
    if (!timeout) {
      return Center(child: CircularProgressIndicator());
    } else if (productNames != null && productNames!.length > 0) {
      return medicineInfo(
        productNames: productNames,
        productImages: productImages,
        productDetails: productDetails,
      );
    } else {
      return Center(
          child: Text(
        "No result",
        textScaleFactor: 3,
      ));
    }
  }
}
