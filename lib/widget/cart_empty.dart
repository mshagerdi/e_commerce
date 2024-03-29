import 'package:e_commerce/provider/dark_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartEmpty extends StatelessWidget {
  const CartEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DarkThemeProvider>(context);
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 77),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * .39,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/emptycart.png'),
            ),
          ),
        ),
        Text(
          'Your Cart Is Empty',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 39,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 33,
        ),
        Text(
          'Looks Like You didn\'t \nadd anything to your cart yet',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 29,
        ),
        Container(
          height: MediaQuery.of(context).size.height * .06,
          width: MediaQuery.of(context).size.width * .9,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
            ),
            onPressed: () {},
            child: Text(
              'shop now'.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
                color: provider.darkTheme ? Colors.white70 : Colors.black87,
              ),
            ),
          ),
        )
      ],
    );
  }
}
