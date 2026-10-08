import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatelessWidget {
  const MovieListing({super.key});

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
  child: const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Se7en'),
      Text(
        'A 1995 dark psychological thriller directed by David Fincher that follows two detectives hunting a meticulous serial killer who bases his gruesome murders on the seven deadly sins.',
      ),
    ],
  ),
),
    );
  }
}
