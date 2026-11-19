import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/models/ticket_item.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';

const Movie testMovie1 = Movie(
  id: 'test1',
  title: 'Test Film One',
  synopsis: 'A test film.',
  ageRating: '15',
  runtime: '1h 30m',
  screeningTime: 'Today 18:00',
  price: 10.0,
  posterImagePath: 'images/test1.jpg',
);

const Movie testMovie2 = Movie(
  id: 'test2',
  title: 'Test Film Two',
  synopsis: 'Another test film.',
  ageRating: '12A',
  runtime: '2h 0m',
  screeningTime: 'Today 20:00',
  price: 6.0,
  posterImagePath: 'images/test2.jpg',
);

void main() {
  setUp(() {
    BasketRepository.instance.clear();
  });

  group('BasketRepository tests', () {
    test('starts empty with zero totals', () {
      final BasketRepository basket = BasketRepository.instance;

      expect(basket.getItems().length, 0);
      expect(basket.getTotalTickets(), 0);
      expect(basket.getTotal(), 0.0);
    });

    test('adds tickets and calculates the total', () {
      final BasketRepository basket = BasketRepository.instance;

      basket.addItem(const TicketItem(movie: testMovie1, quantity: 2));
      basket.addItem(const TicketItem(movie: testMovie2, quantity: 1));

      expect(basket.getItems().length, 2);
      expect(basket.getTotalTickets(), 3);
      expect(basket.getTotal(), 26.0);
    });

    test('removes a ticket by index', () {
      final BasketRepository basket = BasketRepository.instance;

      basket.addItem(const TicketItem(movie: testMovie1, quantity: 1));
      basket.removeItem(0);

      expect(basket.getItems().length, 0);
      expect(basket.getTotal(), 0.0);
    });

    test('ignores an invalid index when removing', () {
      final BasketRepository basket = BasketRepository.instance;

      basket.addItem(const TicketItem(movie: testMovie1, quantity: 1));
      basket.removeItem(5);

      expect(basket.getItems().length, 1);
    });

    test('clear empties the basket', () {
      final BasketRepository basket = BasketRepository.instance;

      basket.addItem(const TicketItem(movie: testMovie1, quantity: 3));
      basket.clear();

      expect(basket.getItems(), isEmpty);
    });
  });
}
