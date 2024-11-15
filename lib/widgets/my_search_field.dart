import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../utils/colors.dart';

class MySearchField extends StatelessWidget {
  const MySearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: searchBarColor,
          borderRadius: BorderRadius.circular(35),
        ),
        child: const TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Iconsax.search_normal,
              color: Colors.black54,
            ),
            hintText: "Search",
            hintStyle: TextStyle(
              color: Colors.black54,
            ),
            contentPadding: EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 10,
            ),
          ),
        ),
      ),
    );
  }
}
