import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  const MovieListing({super.key});
  @override
  State<MovieListing> createState() {
    return _MovieListingState();
  }
}

class _MovieListingState extends State<MovieListing> {
  int _ticketQuantity = 1;

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
            Text('Se7en'),
            SizedBox(height: 8),
            Row(
              children: [
                Text('Runtime: 2h 7m'),
                SizedBox(width: 16),
                Text('Rating: = +18'),
              ],
            ),
            SizedBox(height: 8),
            Text(
              'A 1995 dark psychological thriller directed by David Fincher that follows two detectives hunting a meticulous serial killer who bases his gruesome murders on the seven deadly sins.',
            ),
            const SizedBox (height: 16),
            DropdownMenu<int>(
              initialSelection: _ticketQuantity,
              onSelected: (int? value){
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
          ],
      ),
      ),
    );
  }
}
