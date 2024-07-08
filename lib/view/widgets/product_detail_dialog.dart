import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simple_shop_app2/model/t_product.dart';

class ProductDetailsDialog extends StatelessWidget {
  final Items product;

  const ProductDetailsDialog({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Make background transparent
      appBar: AppBar(
        title: Text(product.name!),
        backgroundColor: Colors.transparent, // Transparent app bar
        elevation: 0, // Remove app bar shadow
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Content doesn't overflow
              children: [
                const SizedBox(height: 20.0),
                // Display product image with rounded corners
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    'https://api.timbu.cloud/images/${product.imageUrl}',
                    height: 150.0,
                  ),
                ),
                const SizedBox(height: 20.0),
                // Display product price
               Text(
                 NumberFormat.currency(locale: 'en_NG', symbol: '₦')
              .format(double.parse(product.currentPrice!)),
          style: Theme.of(context).textTheme.titleMedium,
               ),
                const SizedBox(height: 20.0),
                // Display product description (if available)
                if (product.description != null)
                  Text(
                    product.description!,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                const SizedBox(height: 20.0),
                // Close button
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Close',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
