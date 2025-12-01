import 'package:flutter/material.dart';
import '../widgets/cart_item_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Mock Cart Data
  final List<Map<String, dynamic>> cartItems = [
    {
      'name': 'Food Item 1',
      'description': 'Delicious savory dish',
      'price': 21.40,
      'quantity': 1,
      'image': 'dishes/a.jpg',
    },
    {
      'name': 'Food Item 2',
      'description': 'Crispy and tasty',
      'price': 23.40,
      'quantity': 1,
      'image': 'dishes/b.jpg',
    },
    {
      'name': 'Food Item 3',
      'description': 'Healthy option',
      'price': 35.40,
      'quantity': 1,
      'image': 'dishes/c.jpg',
    },
  ];

  double get subtotal {
    return cartItems.fold(
      0,
      (sum, item) => sum + (item['price'] * item['quantity']),
    );
  }

  double get deliveryFee => 20.00;

  double get total => subtotal + deliveryFee;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Screen"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(24),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return CartItemWidget(
                  name: item['name'],
                  description: item['description'],
                  price: item['price'],
                  quantity: item['quantity'],
                  image: item['image'],
                  onIncrement: () {
                    setState(() {
                      item['quantity']++;
                    });
                  },
                  onDecrement: () {
                    setState(() {
                      if (item['quantity'] > 1) {
                        item['quantity']--;
                      } else {
                        // Remove item logic could go here
                      }
                    });
                  },
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.1),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Column(
              children: [
                _SummaryRow(label: "Subtotal", amount: subtotal),
                const SizedBox(height: 10),
                _SummaryRow(label: "Delivery fee", amount: deliveryFee),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Divider(),
                ),
                _SummaryRow(label: "Total", amount: total, isTotal: true),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/checkout');
                    },
                    child: const Text("Checkout"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final double amount;
  final bool isTotal;

  const _SummaryRow({
    required this.label,
    required this.amount,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isTotal ? 18 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: isTotal ? Colors.black : Colors.grey,
          ),
        ),
        Text(
          "\$${amount.toStringAsFixed(2)}",
          style: TextStyle(
            fontSize: isTotal ? 18 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: isTotal ? Colors.black : Colors.black87,
          ),
        ),
      ],
    );
  }
}
