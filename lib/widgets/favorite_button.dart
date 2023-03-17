import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {

  const FavoriteButton({
    super.key,
  });

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool tapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap tapped should be set to true,
      // and the icon should change to a filled heart
      onTap: () {
        setState(() {
          tapped = !tapped;
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Icon(
            Icons.circle,
            size: 40,
          ),
          Icon(
            Icons.favorite,
            size: 25,
            color: tapped? Colors.red : Colors.white,
          ),
        ],
      ),
    );
  }
}
