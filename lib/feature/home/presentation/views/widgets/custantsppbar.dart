import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class Custantappbar extends StatelessWidget {
  const Custantappbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      child: Row(
        children: [
          Image.asset(
            'image/1.png',
            height: 18,
          ),
          const Spacer(),
          IconButton(
              onPressed: () {
                GoRouter.of(context).push('/SearchView');
              },
              icon: const Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 28,
              ))
        ],
      ),
    );
  }
}
