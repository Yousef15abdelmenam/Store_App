class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String image;
  final String category;
  final RatingModel rating;

  ProductModel(
      {required this.id,
      required this.description,
      required this.image,
      required this.price,
      required this.title,
      required this.rating,
      required this.category});

  factory ProductModel.fromjson(jsondata) {
    return ProductModel(
      id: jsondata['id'],
      description: jsondata['description'],
      image: jsondata['image'],
      price: jsondata['price'] is num
          ? (jsondata['price'] as num).toDouble()
          : double.tryParse(jsondata['price'].toString()) ?? 0.0,
      title: jsondata['title'],
      category: jsondata['category'],
      rating: RatingModel.fromjson(jsondata['rating']),
    );
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.count, required this.rate});

  factory RatingModel.fromjson(jsondata) {
    // You should be sure that the data ( json data ) is not equall == Null or Empty
    if (jsondata == null) {
      return RatingModel(count: 0, rate: 0);
    }
    return RatingModel(
      count: jsondata['count'],
      rate: jsondata['rate'].toDouble(),
    );
  }
}
