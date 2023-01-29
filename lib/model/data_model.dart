class DataModel {
  final String name;
  final String description;
  final int price;
  final int stars;
  final int people;
  final int selectedPeople;
  final String images;
  final String location;

  DataModel({
    required this.name,
    required this.description,
    required this.price,
    required this.stars,
    required this.people,
    required this.selectedPeople,
    required this.images,
    required this.location,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      name: json['name'],
      description: json['description'],
      price: json['price'],
      stars: json['stars'],
      people: json['people'],
      selectedPeople: json['selected_people'],
      images: json['img'],
      location: json['location'],
    );
  }
}
