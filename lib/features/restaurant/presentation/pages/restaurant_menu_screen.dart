import 'package:flutter/material.dart';
import '../widgets/food_item_card.dart';

class RestaurantMenuScreen extends StatefulWidget {
  final Map<String, dynamic> restaurant;

  const RestaurantMenuScreen({super.key, required this.restaurant});

  @override
  State<RestaurantMenuScreen> createState() => _RestaurantMenuScreenState();
}

class _RestaurantMenuScreenState extends State<RestaurantMenuScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Mock Menu Data
  // Mock Menu Data
  final List<Map<String, dynamic>> menuItems = [
    {
      'name': 'Food Item 1',
      'description':
          'Delicious savory dish with fresh ingredients and special sauce.',
      'price': 11.00,
      'image': 'dishes/a.jpg',
    },
    {
      'name': 'Food Item 2',
      'description': 'Crispy and tasty, perfect for a quick bite.',
      'price': 15.00,
      'image': 'dishes/b.jpg',
    },
    {
      'name': 'Food Item 3',
      'description': 'Healthy option with lots of greens and protein.',
      'price': 12.50,
      'image': 'dishes/c.jpg',
    },
    {
      'name': 'Food Item 4',
      'description': 'Spicy and flavorful, for those who love heat.',
      'price': 14.00,
      'image': 'dishes/d.jpg',
    },
    {
      'name': 'Food Item 5',
      'description': 'Sweet and delightful dessert.',
      'price': 9.50,
      'image': 'dishes/e.jpg',
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 200,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  widget.restaurant['name'],
                  style: const TextStyle(
                    color: Colors.white,
                    shadows: [Shadow(color: Colors.black, blurRadius: 10)],
                  ),
                ),
                background: Image.asset(
                  widget.restaurant['image'] ?? 'dishes/dish.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            SliverPersistentHeader(
              delegate: _SliverAppBarDelegate(
                TabBar(
                  controller: _tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: const Color(0xFF2196F3),
                  tabs: const [
                    Tab(text: "Categories"),
                    Tab(text: "Menu"),
                    Tab(text: "Info"),
                  ],
                ),
              ),
              pinned: true,
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            // Categories Tab (Placeholder)
            const Center(child: Text("Categories View")),
            // Menu Tab
            ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                final item = menuItems[index];
                return FoodItemCard(
                  name: item['name'],
                  description: item['description'],
                  price: item['price'],
                  image: item['image'],
                  onAdd: () {
                    // Add to cart logic (Mock)
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("${item['name']} added to cart")),
                    );
                  },
                );
              },
            ),
            // Info Tab (Placeholder)
            const Center(child: Text("Restaurant Info View")),
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverAppBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(color: Colors.white, child: _tabBar);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
