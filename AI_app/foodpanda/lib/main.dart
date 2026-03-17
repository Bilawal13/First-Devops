import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const FoodpandaApp());
}

// --- Constants & Theme ---
const Color kPandaPink = Color(0xFFD70F64);
const Color kPandaLightPink = Color(0xFFFDECF3);
const Color kBackground = Color(0xFFFAFAFA);
const Color kTextDark = Color(0xFF333333);
const Color kTextGray = Color(0xFF707070);

class FoodpandaApp extends StatelessWidget {
  const FoodpandaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodpanda Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPandaPink,
        scaffoldBackgroundColor: kBackground,
        appBarTheme: const AppBarTheme(
          backgroundColor: kPandaPink,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: kPandaPink,
          unselectedItemColor: kTextGray,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        fontFamily: 'Roboto',
      ),
      home: const MainScreen(),
    );
  }
}

// --- Main Container with Bottom Navigation ---

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _goToSearch() {
    setState(() {
      _selectedIndex = 2; // Index of SearchScreen
    });
  }

  @override
  Widget build(BuildContext context) {
    // We build pages here to pass callbacks if needed
    final List<Widget> pages = [
      HomeScreen(onSearchTap: _goToSearch),
      const GroceryScreen(),
      const SearchScreen(),
      const CartScreen(),
      const AccountScreen(),
    ];

    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: pages),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.storefront_outlined),
              activeIcon: Icon(Icons.storefront),
              label: 'Grocery',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              activeIcon: Icon(Icons.search, weight: 700),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              activeIcon: Icon(Icons.shopping_bag),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}

// --- 1. Home Screen ---

class HomeScreen extends StatelessWidget {
  final VoidCallback onSearchTap;

  const HomeScreen({super.key, required this.onSearchTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: Column(
        children: [
          // Custom Header
          Container(
            color: kPandaPink,
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "Home • 123 Main Street",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.favorite_border, color: Colors.white),
                  ],
                ),
                const SizedBox(height: 16),
                // Search Bar (Tappable)
                GestureDetector(
                  onTap: onSearchTap,
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: const [
                        Icon(Icons.search, color: kTextGray),
                        SizedBox(width: 10),
                        Text(
                          "Search for shops & restaurants",
                          style: TextStyle(color: kTextGray, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Scrollable Content
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Expanded(child: _buildpillButton("Delivery", true)),
                      const SizedBox(width: 10),
                      Expanded(child: _buildpillButton("Pick-up", false)),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: _buildBigCard(
                          context,
                          "Food delivery",
                          "Order from your fav\nrestaurants",
                          "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildBigCard(
                          context,
                          "Pandamart",
                          "Groceries delivered\nin 20 mins",
                          "https://images.unsplash.com/photo-1542838132-92c53300491e?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                SizedBox(
                  height: 110,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      _buildCircleCat("Offers", Icons.percent, Colors.blue),
                      _buildCircleCat(
                        "Cuisines",
                        Icons.restaurant,
                        Colors.orange,
                      ),
                      _buildCircleCat("Shops", Icons.store, Colors.purple),
                      _buildCircleCat(
                        "Dine-in",
                        Icons.table_restaurant,
                        Colors.red,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: const Text(
                    "Your daily deals",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: kTextDark,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Tappable Restaurant Cards
                _buildRestaurantCard(
                  context,
                  "Burger King",
                  "American • Fast Food",
                  "4.5",
                  "15-25 min",
                  "https://images.unsplash.com/photo-1571091718767-18b5b1457add?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
                  isPromo: true,
                ),
                _buildRestaurantCard(
                  context,
                  "Subway",
                  "Healthy • Sandwiches",
                  "4.2",
                  "20-35 min",
                  "https://images.unsplash.com/photo-1561758033-d89a9ad46330?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
                ),
                _buildRestaurantCard(
                  context,
                  "Pizza Hut",
                  "Italian • Pizza",
                  "4.0",
                  "30-45 min",
                  "https://images.unsplash.com/photo-1574071318508-1cdbab80d002?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
                  isPromo: true,
                ),
                _buildRestaurantCard(
                  context,
                  "Sushi Master",
                  "Japanese • Sushi",
                  "4.8",
                  "25-40 min",
                  "https://images.unsplash.com/photo-1579871494447-9811cf80d66c?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildpillButton(String text, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? kPandaPink : Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: isSelected ? kPandaPink : Colors.grey.shade300,
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : kTextDark,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildBigCard(
    BuildContext context,
    String title,
    String subtitle,
    String imageUrl,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => RestaurantMenuScreen(title, imageUrl, "General"),
          ),
        );
      },
      child: Container(
        height: 220,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 12, color: kTextGray),
                  ),
                ],
              ),
            ),
            const Spacer(),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              child: Image.network(
                imageUrl,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder:
                    (c, o, s) => Container(color: Colors.grey.shade200),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircleCat(String label, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildRestaurantCard(
    BuildContext context,
    String name,
    String tags,
    String rating,
    String time,
    String imgUrl, {
    bool isPromo = false,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RestaurantMenuScreen(name, imgUrl, tags),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  child: Hero(
                    tag: name, // Hero animation for image
                    child: Image.network(
                      imgUrl,
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder:
                          (c, o, s) => Container(
                            height: 180,
                            color: Colors.grey.shade300,
                          ),
                    ),
                  ),
                ),
                if (isPromo)
                  Positioned(
                    top: 16,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: const BoxDecoration(
                        color: kPandaPink,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(4),
                          bottomRight: Radius.circular(4),
                        ),
                      ),
                      child: const Text(
                        "50% OFF",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                Positioned(
                  bottom: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      time,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            rating,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          const Text(
                            " (500+)",
                            style: TextStyle(color: kTextGray, fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    tags,
                    style: const TextStyle(color: kTextGray, fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
                      Icon(
                        Icons.local_shipping_outlined,
                        size: 16,
                        color: kPandaPink,
                      ),
                      SizedBox(width: 4),
                      Text(
                        "Free delivery",
                        style: TextStyle(
                          color: kPandaPink,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- NEW: Restaurant Menu Screen ---

class RestaurantMenuScreen extends StatelessWidget {
  final String restaurantName;
  final String imageUrl;
  final String tags;

  const RestaurantMenuScreen(
    this.restaurantName,
    this.imageUrl,
    this.tags, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                restaurantName,
                style: const TextStyle(
                  color: Colors.white,
                  shadows: [Shadow(color: Colors.black54, blurRadius: 2)],
                ),
              ),
              background: Hero(
                tag: restaurantName,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  color: Colors.black.withOpacity(0.3),
                  colorBlendMode: BlendMode.darken,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tags,
                    style: const TextStyle(color: kTextGray, fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      Icon(Icons.star, color: kPandaPink, size: 20),
                      Text(
                        " 4.8",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        " (1k+ reviews)",
                        style: TextStyle(color: kTextGray),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Popular Items",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return _buildMenuItem(index);
            }, childCount: 10),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: kPandaPink,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              "Go to Checkout",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(int index) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade100)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Delicious Item #${index + 1}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "Grilled chicken patty with fresh lettuce and special sauce.",
                  style: TextStyle(color: kTextGray, fontSize: 13),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  "\$ ${(index + 5) * 1.5}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(
                  "https://source.unsplash.com/random/200x200?food,$index",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- 2. Grocery Screen ---

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Groceries",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Search Bar
          Container(
            height: 45,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(25),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: const [
                Icon(Icons.search, color: kTextGray),
                SizedBox(width: 10),
                Text(
                  "Search shops",
                  style: TextStyle(color: kTextGray, fontSize: 14),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Shop by category",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 16),

          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.8,
            children: [
              _buildShopCard(
                "Pandamart",
                Colors.pink.shade100,
                "https://images.unsplash.com/photo-1542838132-92c53300491e?ixlib=rb-1.2.1&auto=format&fit=crop&w=200&q=60",
              ),
              _buildShopCard(
                "7-Eleven",
                Colors.green.shade100,
                "https://images.unsplash.com/photo-1550989460-0adf9ea622e2?ixlib=rb-1.2.1&auto=format&fit=crop&w=200&q=60",
              ),
              _buildShopCard(
                "Watsons",
                Colors.teal.shade100,
                "https://images.unsplash.com/photo-1585435557343-3b092031a831?ixlib=rb-1.2.1&auto=format&fit=crop&w=200&q=60",
              ),
              _buildShopCard(
                "Bakery",
                Colors.orange.shade100,
                "https://images.unsplash.com/photo-1509440159596-0249088772ff?ixlib=rb-1.2.1&auto=format&fit=crop&w=200&q=60",
              ),
              _buildShopCard(
                "Drinks",
                Colors.blue.shade100,
                "https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?ixlib=rb-1.2.1&auto=format&fit=crop&w=200&q=60",
              ),
              _buildShopCard(
                "Flowers",
                Colors.purple.shade100,
                "https://images.unsplash.com/photo-1490750967868-58cb75062ed0?ixlib=rb-1.2.1&auto=format&fit=crop&w=200&q=60",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildShopCard(String title, Color bgColor, String imgUrl) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(imgUrl),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.1),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
        ),
      ],
    );
  }
}

// --- 3. Search Screen (UPDATED: Functional) ---

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  String _query = "";

  // Dummy Data for Search
  final List<Map<String, String>> _allRestaurants = [
    {
      "name": "Burger King",
      "tags": "American • Fast Food",
      "image":
          "https://images.unsplash.com/photo-1571091718767-18b5b1457add?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    },
    {
      "name": "Subway",
      "tags": "Healthy • Sandwiches",
      "image":
          "https://images.unsplash.com/photo-1561758033-d89a9ad46330?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    },
    {
      "name": "Pizza Hut",
      "tags": "Italian • Pizza",
      "image":
          "https://images.unsplash.com/photo-1574071318508-1cdbab80d002?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    },
    {
      "name": "Sushi Master",
      "tags": "Japanese • Sushi",
      "image":
          "https://images.unsplash.com/photo-1579871494447-9811cf80d66c?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    },
    {
      "name": "McDonald's",
      "tags": "American • Burgers",
      "image":
          "https://images.unsplash.com/photo-1551782450-a2132b4ba21d?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    },
    {
      "name": "KFC",
      "tags": "American • Chicken",
      "image":
          "https://images.unsplash.com/photo-1626082927389-e1a77e64e39a?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    },
    {
      "name": "Starbucks",
      "tags": "Coffee • Drinks",
      "image":
          "https://images.unsplash.com/photo-1509042239860-f550ce710b93?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    },
    {
      "name": "Taco Bell",
      "tags": "Mexican • Tacos",
      "image":
          "https://images.unsplash.com/photo-1552332386-f8dd00d5f0ad?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Filter Logic
    final List<Map<String, String>> results =
        _query.isEmpty
            ? []
            : _allRestaurants
                .where(
                  (r) =>
                      r['name']!.toLowerCase().contains(_query.toLowerCase()) ||
                      r['tags']!.toLowerCase().contains(_query.toLowerCase()),
                )
                .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: TextField(
          controller: _controller,
          autofocus: false,
          onChanged: (value) {
            setState(() {
              _query = value;
            });
          },
          decoration: InputDecoration(
            hintText: "Search for restaurants...",
            border: InputBorder.none,
            prefixIcon: const Icon(Icons.search, color: kPandaPink),
            suffixIcon:
                _query.isNotEmpty
                    ? IconButton(
                      icon: const Icon(Icons.clear, color: Colors.grey),
                      onPressed: () {
                        _controller.clear();
                        setState(() => _query = "");
                      },
                    )
                    : null,
            hintStyle: TextStyle(color: Colors.grey.shade400),
          ),
        ),
      ),
      body:
          _query.isEmpty
              ? _buildDefaultSearchView()
              : _buildSearchResults(results),
    );
  }

  Widget _buildDefaultSearchView() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Top Cuisines",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _buildChip("Pizza"),
              _buildChip("Burger"),
              _buildChip("Bubble Tea"),
              _buildChip("Chicken"),
              _buildChip("Salad"),
              _buildChip("Japanese"),
              _buildChip("Korean"),
              _buildChip("Dessert"),
            ],
          ),
          const SizedBox(height: 30),
          const Text(
            "Recent Searches",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: const Icon(Icons.history, color: kTextGray),
                  title: const Text("McDonald's"),
                  contentPadding: EdgeInsets.zero,
                  onTap: () {
                    _controller.text = "McDonald's";
                    setState(() => _query = "McDonald's");
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.history, color: kTextGray),
                  title: const Text("KFC"),
                  contentPadding: EdgeInsets.zero,
                  onTap: () {
                    _controller.text = "KFC";
                    setState(() => _query = "KFC");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults(List<Map<String, String>> results) {
    if (results.isEmpty) {
      return const Center(
        child: Text(
          "No restaurants found.",
          style: TextStyle(color: kTextGray),
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: results.length,
      itemBuilder: (context, index) {
        final item = results[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => RestaurantMenuScreen(
                      item['name']!,
                      item['image']!,
                      item['tags']!,
                    ),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 5),
              ],
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(12),
                  ),
                  child: Image.network(
                    item['image']!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    errorBuilder:
                        (c, o, s) => Container(
                          width: 100,
                          height: 100,
                          color: Colors.grey.shade200,
                        ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['name']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item['tags']!,
                        style: const TextStyle(color: kTextGray, fontSize: 13),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "20-30 min • Free delivery",
                        style: TextStyle(fontSize: 12, color: kPandaPink),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildChip(String label) {
    return ActionChip(
      label: Text(label),
      backgroundColor: Colors.white,
      side: BorderSide(color: Colors.grey.shade300),
      labelStyle: const TextStyle(color: kTextDark),
      onPressed: () {
        _controller.text = label;
        setState(() => _query = label);
      },
    );
  }
}

// --- 4. Cart Screen ---

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cart",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.remove_shopping_cart_outlined,
              size: 100,
              color: Colors.grey.shade300,
            ),
            const SizedBox(height: 20),
            const Text(
              "Hungry?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "You haven't added anything to your cart yet!",
              style: TextStyle(color: kTextGray),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: kPandaPink,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: const Text(
                "Browse Restaurants",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- 5. Account Screen ---

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Header
          Container(
            color: kPandaPink,
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 30),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.person, color: kPandaPink, size: 30),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "John Doe",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "john.doe@example.com",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Menu Items
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(top: 10),
              children: [
                _buildProfileItem(Icons.favorite_outline, "Favorites"),
                _buildProfileItem(
                  Icons.local_offer_outlined,
                  "Vouchers & Offers",
                ),
                _buildProfileItem(Icons.payment_outlined, "Payment Methods"),
                _buildProfileItem(Icons.location_on_outlined, "Addresses"),
                const Divider(),
                _buildProfileItem(Icons.help_outline, "Help center"),
                _buildProfileItem(Icons.settings_outlined, "Settings"),
                _buildProfileItem(Icons.logout, "Log out"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: kTextDark),
      title: Text(
        title,
        style: const TextStyle(color: kTextDark, fontWeight: FontWeight.w500),
      ),
      trailing: const Icon(Icons.chevron_right, size: 20, color: kTextGray),
      onTap: () {},
    );
  }
}
