import 'package:book_store/models/book.dart';
import 'package:book_store/providers/cart_provider.dart';
import 'package:book_store/providers/favorite_provider.dart'; // Make sure this exists
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookDetailScreen extends StatefulWidget {
  final String imagePath;
  final String title;
  final String description;
  final String author;
  final double price;
  final int rating;
  final int reviewCount;

  const BookDetailScreen({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.author,
    required this.price,
    required this.rating,
    required this.reviewCount,
  });

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  bool favSave = false;
  int count = 1;

  void _addCart() {
    setState(() {
      count++;
    });
  }

  void _minCart() {
    setState(() {
      if (count > 1) count--;
    });
  }

  void _favoriteSave() {
    setState(() {
      favSave = !favSave;
    });
  }

  @override
  Widget build(BuildContext context) {
    final book = Book(
      imagePath: widget.imagePath,
      title: widget.title,
      author: widget.author,
      description: widget.description,
      price: widget.price,
      rating: widget.rating,
      reviewCount: widget.reviewCount,
    );

    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final isFavorite = favoriteProvider.isFavorite(book);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Details'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
              ),
              onPressed:(){
                 favoriteProvider.toggleFavorite(book);
              }
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 350,
              decoration: BoxDecoration(
                color: const Color.fromARGB(200, 193, 189, 189),
                borderRadius: BorderRadius.circular(10),
              ),
              clipBehavior: Clip.hardEdge,
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  widget.imagePath,
                  width: 180,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.title,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      size: 18,
                      color: Colors.yellow,
                    ),
                    const SizedBox(width: 5),
                    Text('${widget.rating.toStringAsFixed(1)} (${widget.reviewCount})'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text('Price - \$${widget.price.toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 16)),
                    const SizedBox(width: 10),
                    Text('\$${widget.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 16,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.grey,
                          decorationThickness: 1.2,
                        )),
                  ],
                ),
                Container(
                  height: 35,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: _minCart,
                          icon: const Icon(
                            Icons.remove,
                            size: 18,
                          )),
                      Text('$count'),
                      IconButton(
                          onPressed: _addCart,
                          icon: const Icon(
                            Icons.add,
                            size: 18,
                          )),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  widget.description,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Provider.of<CartProvider>(context, listen: false)
                    .addToCart(book, count);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${widget.title} added to cart')),
                );
              },
              child: const Text('Add to Cart'),
            ),
            
          ],
        ),
      ),
    );
  }
}
