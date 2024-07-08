import 'dart:convert';


class Items {
  final String? name;
  final String? description;
  final String? uniqueId;

  final bool? isAvailable;
  final String? imageUrl;
  final String? currentPrice;

  Items({required this.name, required this.description, required this.uniqueId, required this.isAvailable, required this.imageUrl, required this.currentPrice});

 

  @override
  String toString() {
    return 'Items(name: $name, description: $description, uniqueId: $uniqueId, isAvailable: $isAvailable, imageUrl: $imageUrl, currentPrice: $currentPrice)';
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'uniqueId': uniqueId,
      'isAvailable': isAvailable,
      'imageUrl': imageUrl,
      'currentPrice': currentPrice,
    };
  }

  factory Items.fromMap(Map<String, dynamic> map) {
    return Items(
  name: map['name'],
          description: map['description'],
          uniqueId: map['uniqueId'],
          isAvailable: map['isAvailable'],
          imageUrl: map['photos'][0]['url'],
          currentPrice: map['current_price'][0]['NGN'][0].toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Items.fromJson(String source) => Items.fromMap(json.decode(source));
}
