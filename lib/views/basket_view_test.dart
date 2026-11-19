import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/models/ticket_item.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';
import 'package:southsea_cinema/views/basket_view.dart';

const Movie testMovie = Movie(
  id: 'test',
  title: 'Test Film',
  synopsis: 'A test film.',
  ageRating: '15',
  runtime: '1h 30m',
  screeningTime: 'Today 18:00',
  price: 10.0,
  posterImagePath: 'images/test.jpg',
);

void main() {
  setUp(() {
    BasketRepository.instance.clear();
  });

  testWidgets('BasketView shows empty message when basket has no tickets', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: BasketView()));

    expect(find.text('Your basket is empty'), findsOneWidget);
    expect(find.text('CHECKOUT'), findsNothing);
  });

  testWidgets('BasketView shows tickets and removes one when delete pressed', (
    WidgetTester tester,
  ) async {
    BasketRepository.instance.addItem(
      const TicketItem(movie: testMovie, quantity: 2),
    );

    await tester.pumpWidget(const MaterialApp(home: BasketView()));

    expect(find.text('Your basket'), findsOneWidget);
    expect(find.text('2 x Test Film'), findsOneWidget);
    expect(find.text('£20.00'), findsWidgets);
    expect(find.text('CHECKOUT'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.delete_outline));
    await tester.pump();

    expect(find.text('Your basket is empty'), findsOneWidget);
    expect(BasketRepository.instance.getItems(), isEmpty);
  });

  testWidgets('Checkout clears the basket and shows a confirmation', (
    WidgetTester tester,
  ) async {
    BasketRepository.instance.addItem(
      const TicketItem(movie: testMovie, quantity: 1),
    );

    await tester.pumpWidget(const MaterialApp(home: BasketView()));

    await tester.tap(find.text('CHECKOUT'));
    await tester.pump();

    expect(find.text('Thanks, your booking is confirmed'), findsOneWidget);
    expect(find.text('Your basket is empty'), findsOneWidget);
    expect(BasketRepository.instance.getItems(), isEmpty);
  });
}