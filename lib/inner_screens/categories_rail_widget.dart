import 'package:flutter/material.dart';

import '../consts/constants.dart';

class ContentSpace extends StatelessWidget {
  ContentSpace(this.categoryLabel);

  String categoryLabel;

  @override
  Widget build(BuildContext context) {
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
                            'title',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            'US 16\$',
                            style: TextStyle(
                              color: Colors.pink,
                              fontSize: 22,
                            ),
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
                          testProductUrl,
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
          itemCount: 5,
        ),
      ),
    );
  }
}
