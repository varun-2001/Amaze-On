import 'package:flutter/material.dart';

class PromoBox extends StatelessWidget {
  const PromoBox({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.1-10,
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      // Create input area to enter promo code
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 20),
          const SizedBox(
            width: 200,
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Promo Code',
                  hintStyle: TextStyle(
                    color: Colors.black45,
                    fontSize: 20,
                  )),
            ),
          ),
          const SizedBox(width: 20),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                Colors.black,
              ),
            ),
            onPressed: () {},
            child: const Text('Apply'),
          ),
        ],
      ),
    );
  }
}
