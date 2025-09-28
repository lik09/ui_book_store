import 'package:flutter/material.dart';
import '../models/book.dart';
import '../widgets/book_card.dart';
import '../widgets/book_menu.dart';
import 'book_detail_screen.dart'; // Your detail screen

class HomeContent extends StatefulWidget {
  final List<String> menuBooks;
  final List<Book> books;

  const HomeContent({
    Key? key,
    required this.menuBooks,
    required this.books,
  }) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  String selectedBook = 'All Book';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            // Horizontal menu for book categories
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  BookMenu(
                    title: 'All Book',
                    isSelected: selectedBook == 'All Book',
                    onTap: () {
                      setState(() {
                        selectedBook = 'All Book';
                      });
                    },
                  ),
                  ...widget.menuBooks.map(
                    (book) => BookMenu(
                      title: book,
                      isSelected: selectedBook == book,
                      onTap: () {
                        setState(() {
                          selectedBook = book;
                          print('show select: $selectedBook');
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Best selling books header
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Best selling books',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  InkWell(
                    onTap: () {
                      print("Tapped See All Best Selling");
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'See all',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_right_sharp,
                            color: Colors.blue,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Horizontal scroll of best selling books
            SizedBox(
              height: 350,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: widget.books.map((book) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => BookDetailScreen(
                                imagePath: book.imagePath,
                                title: book.title,
                                author: book.author,
                                description: book.description,
                                price: book.price,
                                rating: book.rating,
                                reviewCount: book.reviewCount,
                              ),
                            ),
                          );
                        },
                        child: BookCard(book: book),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),

            // Trending Now header
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Trending Now',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  InkWell(
                    onTap: () {
                      print("Tapped See All Trending");
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'See all',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_right_sharp,
                            color: Colors.blue,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Horizontal scroll of trending books (reuse widget.books for now)
            SizedBox(
              height: 350,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: widget.books.map((book) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: BookCard(book: book),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
