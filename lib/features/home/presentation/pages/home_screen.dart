import 'package:flutter/material.dart';
import '../../data/mock_home_data.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/category_item.dart';
import '../widgets/restaurant_card.dart';
// import '../../../../core/routes/routes.dart';
import '../../../profile/presentation/pages/profile_screen.dart';
import '../../../cart/presentation/pages/cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions = <Widget>[
      const HomeContent(),
      const Center(child: Text('Search')),
      const CartScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: const Color(0xFF2196F3),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Orders',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Home",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_none, size: 30),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Search Bar
              const CustomSearchBar(),
              const SizedBox(height: 30),
              // Categories
              const Text(
                "Food Categories",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: MockHomeData.categories.length,
                  itemBuilder: (context, index) {
                    final category = MockHomeData.categories[index];
                    return CategoryItem(
                      name: category['name'],
                      icon: category['icon'],
                      image: category['image'] ?? '',
                      isSelected: index == 0, // Mock selection
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
              // Featured Restaurants
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Featured Restaurants",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextButton(onPressed: () {}, child: const Text("See all")),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 260,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: MockHomeData.restaurants.length,
                  itemBuilder: (context, index) {
                    final restaurant = MockHomeData.restaurants[index];
                    return RestaurantCard(
                      name: restaurant['name'],
                      image: restaurant['image'] ?? '',
                      rating: restaurant['rating'],
                      time: restaurant['time'],
                      tags: List<String>.from(restaurant['tags']),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
