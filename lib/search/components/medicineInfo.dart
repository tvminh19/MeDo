import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class medicineInfo extends StatelessWidget {
  const medicineInfo(
      {Key? key,
      required this.productNames,
      required this.productImages,
      required this.productDetails})
      : super(key: key);

  final List<Map<String, dynamic>>? productNames;
  final List<Map<String, dynamic>>? productImages;
  final List<Map<String, dynamic>>? productDetails;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: (productNames!.length / 2).round(),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                        child: Image.network(
                            productImages![index]['attributes']['src'],
                            height: 72,
                            width: 72, errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                          return const FlutterLogo(size: 72);
                        }), //Medicine Image
                      ),
                      Flexible(
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                trim(productNames![index * 2]['title']),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ), //Medicine name
                              Text(trim(productDetails![index * 4]
                                  ['title'])), //Medicine ingredients
                              Text('Nhóm thuốc: ' +
                                  trim(
                                      productDetails![index * 4 + 1]['title'])),
                              Text(
                                'Dạng thuốc: ' +
                                    trim(productDetails![index * 4 + 2]
                                        ['title']),
                              ),
                              Text(
                                'Số đăng ký: ' +
                                    trim(productDetails![index * 4 + 3]
                                        ['title']),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ));
            }));
  }
}

String trim(String str) {
  return str
      .replaceFirst(new RegExp(r"^\s+"), "")
      .replaceFirst(new RegExp(r"\s+$"), "");
}

//da lam xong