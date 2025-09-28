import 'package:book_store/models/book.dart';
import 'package:book_store/screens/saved_screen.dart';
import 'package:flutter/material.dart';
import 'home_content.dart'; // Make sure this file is renamed from home_tab.dart to home_content.dart

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> menuBooks = [
    'Horror',
    'Comics',
    'History',
    'History A',
    'History B',
  ];

  // final List<Map<String, dynamic>> books = [
  //   {
  //     "imagePath": "assets/books/1.jpg",
  //     "title": "Displacement",
  //     "author": "Kiku Hughes",
  //     "price": 16.55,
  //     "rating": 4,
  //     "reviewCount": 45,
  //     "description": "A story about refugees and their journey to find safety and belonging."
  //   },
  //   {
  //     "imagePath": "assets/books/2.jpg",
  //     "title": "The Arrival",
  //     "author": "Shaun Tan",
  //     "price": 18.99,
  //     "rating": 3,
  //     "reviewCount": 45,
  //     "description": "A wordless graphic novel about immigration and the immigrant experience."
  //   },
  //   {
  //     "imagePath": "assets/books/3.jpg",
  //     "title": "Persepolis",
  //     "author": "Marjane Satrapi",
  //     "price": 14.25,
  //     "rating": 5,
  //     "reviewCount": 45,
  //     "description": "A memoir of growing up in Iran during and after the Islamic revolution."
  //   },
  //   {
  //     "imagePath": "assets/books/4.jpg",
  //     "title": "Maus",
  //     "author": "Art Spiegelman",
  //     "price": 22.00,
  //     "rating": 4,
  //     "reviewCount": 45,
  //     "description": "A graphic novel depicting Holocaust survivors as animals."
  //   },
  //   {
  //     "imagePath": "assets/books/5.jpg",
  //     "title": "Fun Home",
  //     "author": "Alison Bechdel",
  //     "price": 19.75,
  //     "rating": 3,
  //     "reviewCount": 45,
  //     "description": "A coming-of-age memoir exploring family secrets and identity."
  //   },
  //   {
  //     "imagePath": "assets/books/6.jpg",
  //     "title": "Blankets",
  //     "author": "Craig Thompson",
  //     "price": 21.30,
  //     "rating": 3,
  //     "reviewCount": 45,
  //     "description": "A graphic novel about first love and spiritual awakening."
  //   },
  //   {
  //     "imagePath": "assets/books/7.jpg",
  //     "title": "Nimona",
  //     "author": "ND Stevenson",
  //     "price": 17.40,
  //     "rating": 2,
  //     "reviewCount": 45,
  //     "description": "A fantasy tale of a young shapeshifter and her villainous mentor."
  //   },
  //   {
  //     "imagePath": "assets/books/8.jpg",
  //     "title": "March",
  //     "author": "John Lewis",
  //     "price": 20.00,
  //     "rating": 4,
  //     "reviewCount": 45,
  //     "description": "A graphic memoir about the Civil Rights Movement."
  //   },
  //   {
  //     "imagePath": "assets/books/9.jpg",
  //     "title": "This One Summer",
  //     "author": "Mariko Tamaki",
  //     "price": 15.60,
  //     "rating": 5,
  //     "reviewCount": 45,
  //     "description": "A coming-of-age story about friendship and family."
  //   },
  //   {
  //     "imagePath": "assets/books/10.jpg",
  //     "title": "Ghost World",
  //     "author": "Daniel Clowes",
  //     "price": 13.95,
  //     "rating": 4,
  //     "reviewCount": 45,
  //     "description": "A graphic novel about two teenage girls and their struggles with adulthood."
  //   },
  //   {
  //     "imagePath": "assets/books/11.jpg",
  //     "title": "The Best We Could Do",
  //     "author": "Thi Bui",
  //     "price": 18.25,
  //     "rating": 3,
  //     "reviewCount": 45,
  //     "description": "A family memoir about immigration and resilience."
  //   },
  //   {
  //     "imagePath": "assets/books/12.jpg",
  //     "title": "A Contract with God",
  //     "author": "Will Eisner",
  //     "price": 16.00,
  //     "rating": 3,
  //     "reviewCount": 45,
  //     "description": "A seminal graphic novel exploring human struggles in an urban setting."
  //   },
  // ];

  final List<Book> books = [
    Book(
      imagePath: "assets/books/1.jpg",
      title: "Displacement",
      author: "Kiku Hughes",
      price: 16.55,
      rating: 4,
      reviewCount: 45,
      description:
          "A story about refugees and their journey to find safety and belonging.",
    ),
    Book(
      imagePath: "assets/books/2.jpg",
      title: "The Arrival",
      author: "Shaun Tan",
      price: 18.99,
      rating: 3,
      reviewCount: 45,
      description:
          "A wordless graphic novel about immigration and the immigrant experience.",
    ),
    Book(
      imagePath: "assets/books/3.jpg",
      title: "Persepolis",
      author: "Marjane Satrapi",
      price: 14.25,
      rating: 5,
      reviewCount: 45,
      description:
          "A memoir of growing up in Iran during and after the Islamic revolution.",
    ),
    Book(
      imagePath: "assets/books/4.jpg",
      title: "Maus",
      author: "Art Spiegelman",
      price: 22.00,
      rating: 4,
      reviewCount: 45,
      description: "A graphic novel depicting Holocaust survivors as animals.",
    ),
    Book(
      imagePath: "assets/books/5.jpg",
      title: "Fun Home",
      author: "Alison Bechdel",
      price: 19.75,
      rating: 3,
      reviewCount: 45,
      description:
          "A coming-of-age memoir exploring family secrets and identity.",
    ),
    Book(
      imagePath: "assets/books/6.jpg",
      title: "Blankets",
      author: "Craig Thompson",
      price: 21.30,
      rating: 3,
      reviewCount: 45,
      description: "A graphic novel about first love and spiritual awakening.",
    ),
    Book(
      imagePath: "assets/books/7.jpg",
      title: "Nimona",
      author: "ND Stevenson",
      price: 17.40,
      rating: 2,
      reviewCount: 45,
      description:
          "A fantasy tale of a young shapeshifter and her villainous mentor.",
    ),
    Book(
      imagePath: "assets/books/8.jpg",
      title: "March",
      author: "John Lewis",
      price: 20.00,
      rating: 4,
      reviewCount: 45,
      description: "A graphic memoir about the Civil Rights Movement.",
    ),
    Book(
      imagePath: "assets/books/9.jpg",
      title: "This One Summer",
      author: "Mariko Tamaki",
      price: 15.60,
      rating: 5,
      reviewCount: 45,
      description: "A coming-of-age story about friendship and family.",
    ),
    Book(
      imagePath: "assets/books/10.jpg",
      title: "Ghost World",
      author: "Daniel Clowes",
      price: 13.95,
      rating: 4,
      reviewCount: 45,
      description:
          "A graphic novel about two teenage girls and their struggles with adulthood.",
    ),
    Book(
      imagePath: "assets/books/11.jpg",
      title: "The Best We Could Do",
      author: "Thi Bui",
      price: 18.25,
      rating: 3,
      reviewCount: 45,
      description: "A family memoir about immigration and resilience.",
    ),
    Book(
      imagePath: "assets/books/12.jpg",
      title: "A Contract with God",
      author: "Will Eisner",
      price: 16.00,
      rating: 3,
      reviewCount: 45,
      description:
          "A seminal graphic novel exploring human struggles in an urban setting.",
    ),
  ];

  int _selectedIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomeContent(menuBooks: menuBooks, books: books),
      const Center(child: Text('Explore Tab Content')),
      SavedScreen(),
      const Center(child: Text('Profile Tab Content')),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Store'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 18.0),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'EXPLORE',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'SAVE',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'PROFILE',
          ),
        ],
      ),
    );
  }
}
