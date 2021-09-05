import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class medicineInfo extends StatelessWidget {
  const medicineInfo(
      {Key? key,
      required this.productNames,
      required this.productImages,
      required this.productDetails,
      required this.baseUrl})
      : super(key: key);

  final List<Map<String, dynamic>>? productNames, productImages, productDetails;
  final String baseUrl;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: (productNames!.length / 2).round(),
        itemBuilder: (BuildContext context, int index) {
          return ExpansionTile(
              title: Row(children: [
                InkWell(
                    child: medicineImageWidget(
                        productImages: productImages![index]['attributes']
                            ['src']),
                    onTap: () async {
                      launch(trim(baseUrl +
                          productNames![index * 2]['attributes']['href']
                              .toString()));
                    }),
                Expanded(
                  child: InkWell(
                      child: medicineTitleWidget(
                          productNames:
                              trim(productNames![index * 2]['title'])),
                      onTap: () async {
                        launch(trim(baseUrl +
                            productNames![index * 2]['attributes']['href']
                                .toString()));
                      }),
                )
              ]), //Medicine name,
              children: <Widget>[
                ListTile(
                  title: Container(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        descriptionTextWidget(
                            description:
                                trim(productDetails![index * 4]['title'])),
                        descriptionTextWidget(
                            description: 'Nhóm thuốc: ' +
                                trim(productDetails![index * 4 + 1]['title'])),
                        descriptionTextWidget(
                            description: 'Dạng thuốc: ' +
                                trim(productDetails![index * 4 + 2]['title'])),
                        descriptionTextWidget(
                            description: 'Số đăng ký: ' +
                                trim(productDetails![index * 4 + 3]['title'])),
                      ],
                    ),
                  ),
                ),
              ]);
        });
  }
}

class medicineTitleWidget extends StatelessWidget {
  const medicineTitleWidget({
    Key? key,
    required this.productNames,
  }) : super(key: key);

  final String productNames;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text(
        productNames,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}

class medicineImageWidget extends StatelessWidget {
  const medicineImageWidget({Key? key, required this.productImages})
      : super(key: key);

  final String productImages;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
      child: Column(
        children: [
          Image.network(productImages, height: 72, width: 72, errorBuilder:
              (BuildContext context, Object exception, StackTrace? stackTrace) {
            return const FlutterLogo(size: 72);
          }),
        ],
      ),
    );
  }
}

class descriptionTextWidget extends StatelessWidget {
  const descriptionTextWidget({
    Key? key,
    required this.description,
  }) : super(key: key);

  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 2.0),
      alignment: Alignment.centerLeft,
      child: Text(
        description,
        textAlign: TextAlign.justify,
        textWidthBasis: TextWidthBasis.longestLine,
      ),
    );
  }
}

String trim(String str) {
  return str
      .replaceFirst(new RegExp(r"^\s+"), "")
      .replaceFirst(new RegExp(r"\s+$"), "")
      .replaceFirst("..", "");
}

//da lam xong