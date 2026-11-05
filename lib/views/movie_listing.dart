import 'package:flutter/material.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  final Movie movie;

  const MovieListing({super.key, required this.movie});
  @override
  State<MovieListing> createState() {
    return _MovieListingState();
  }
}

class _MovieListingState extends State<MovieListing> {
  int _ticketQuantity = 1;
  String _bookingMessage = '';
  void _addToOrder() {
    setState(() {
      _bookingMessage = 'Added $_ticketQuantity ticket(s) to your order';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.movie.title),
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  'Runtime: ${widget.movie.runtime}',
                  style: const TextStyle(color: cinemaFontWhite),
                ),
                const SizedBox(width: 16),
                Text(
                  'Rating: ${widget.movie.ageRating}',
                  style: const TextStyle(color: cinemaFontWhite),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              widget.movie.screeningTime,
              style: const TextStyle(color: cinemaFontWhite),
            ),
            const SizedBox(height: 8),
            Text(
              widget.movie.formattedPrice,
              style: const TextStyle(color: cinemaFontWhite),
            ),
            SizedBox(height: 8),
            Text(widget.movie.synopsis),
            const SizedBox(height: 16),
            DropdownMenu<int>(
              initialSelection: _ticketQuantity,
              onSelected: (int? value) {
                if (value != null) {
                  setState(() {
                    _ticketQuantity = value;
                  });
                }
              },
              dropdownMenuEntries: const [
                DropdownMenuEntry(value: 1, label: '1'),
                DropdownMenuEntry(value: 2, label: '2'),
                DropdownMenuEntry(value: 3, label: '3'),
                DropdownMenuEntry(value: 4, label: '4'),
                DropdownMenuEntry(value: 5, label: '5'),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _addToOrder,
              child: const Text('Add to order'),
            ),
            const SizedBox(height: 8),
            Text(_bookingMessage),
          ],
        ),
      ),
    );
  }
}
