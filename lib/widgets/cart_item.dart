import 'package:exelon_shopping/widgets/increment_counter.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(20),
      height: size.height / 6,
      decoration: BoxDecoration(
        // color: Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/bottle.jpeg',
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Water Bottle',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('Lorem ipsum dolor',
                  style: TextStyle(
                    fontSize: 12,
                  )),
              SizedBox(height: 10),
              Text(
                '\$9.99',
                style: TextStyle(
                  fontSize: 20,
                  
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const CounterWidget(),
        ],
      ),
    );
  }
}
