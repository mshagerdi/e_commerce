import 'package:e_commerce/consts/styles.dart';
import 'package:intl/intl.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/provider/product_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:persian_fonts/persian_fonts.dart';

class ContentSpace extends StatelessWidget {
  ContentSpace(this.categoryLabel);

  String categoryLabel;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductDataProvider>(context);
    List<Product> _products = provider.products;
    print('products length: ${_products.length}');
    var formatter = NumberFormat('#,##,000');
    return Expanded(
      child: Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Positioned(
                  top: MediaQuery.of(context).size.width * 0.055,
                  left: MediaQuery.of(context).size.width * 0.3,
                  child: Card(
                    elevation: 9,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 26, vertical: 13),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _products[index].title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: PersianFonts.Shabnam.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${formatter.format(_products[index].price)}',
                                style: TextStyle(
                                  color: Colors.pink,
                                  fontSize: 22,
                                ),
                              ),
                              Text(
                                'IRR',
                                style: kCurrencyStyle,
                              )
                            ],
                          ),
                          Text(
                            categoryLabel,
                            style: TextStyle(
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * .33,
                    height: MediaQuery.of(context).size.width * .33,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(9),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                          _products[index].imageUrl,
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
          itemCount: _products.length,
        ),
      ),
    );
  }
}
