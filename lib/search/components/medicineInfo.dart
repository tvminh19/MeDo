import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class medicineInfo extends StatelessWidget {
  const medicineInfo({
    Key? key,
    required this.productNames,
    required this.productImages,
    required this.productDescriptions,
  }) : super(key: key);

  final List<Map<String, dynamic>>? productNames;
  final List<Map<String, dynamic>>? productImages;
  final List<Map<String, dynamic>>? productDescriptions;

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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                        child: Image.network(
                            productImages![index]['attributes']['src'],
                            height: 72,
                            width: 72, errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                          return const FlutterLogo(size: 72);
                        }),
                      ),
                      Column(
                        children: [
                          Text(
                            productNames![index * 2]['title'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'Thành phần: ' +
                                productDescriptions![index]['title'],
                          )
                        ],
                      ),
                    ],
                  ));
            }));
  }
}

//da lam xong