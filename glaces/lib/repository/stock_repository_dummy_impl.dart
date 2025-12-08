import 'package:glaces/data/ice.dart';
import 'package:glaces/repository/stock_repository.dart';

class StockRepositoryDummyImpl implements StockRepository {
  @override
  List<Ice> icecream = [
    Ice("Chocolat", 1),
    Ice("Vanilla", 2),
    Ice("Pistachio", 0)
  ];
}