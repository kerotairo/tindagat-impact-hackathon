import 'package:meta/meta.dart';

class StockImage {
  final String imageUrl;
  final String name;
  final String location;
  final String submitter;

  StockImage({@required this.imageUrl, @required this.name, 
    this.location, this.submitter});
}