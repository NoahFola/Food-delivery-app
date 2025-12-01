import 'package:flutter/material.dart';
import '../../features/splash/presentation/pages/splash_screen.dart';
import '../../features/auth/presentation/pages/login_screen.dart';
import '../../features/auth/presentation/pages/signup_screen.dart';
import '../../features/home/presentation/pages/home_screen.dart';
import '../../features/restaurant/presentation/pages/restaurant_menu_screen.dart';
import '../../features/cart/presentation/pages/cart_screen.dart';
import '../../features/checkout/presentation/pages/checkout_screen.dart';
import '../../features/profile/presentation/pages/profile_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String restaurantMenu = '/restaurant_menu';
  static const String cart = '/cart';
  static const String checkout = '/checkout';
  static const String profile = '/profile';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case signup:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case restaurantMenu:
        final restaurant = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => RestaurantMenuScreen(restaurant: restaurant),
        );
      case cart:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case checkout:
        return MaterialPageRoute(builder: (_) => const CheckoutScreen());
      case profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
