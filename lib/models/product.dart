class Product {
  final int id;
  final String name;
  final String tagline;
  final String description;
  final String price;
  final String currency;
  final String image;
  final Map<String, dynamic> specs; 

  Product({
    required this.id,
    required this.name,
    required this.tagline,
    required this.description,
    required this.price,
    required this.currency,
    required this.image,
    required this.specs, 
  });

  
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      tagline: json['tagline'] ?? '', 
      description: json['description'] ?? '',
      price: json['price'].toString(), 
      currency: json['currency'] ?? 'USD',
      image: json['image'] ?? '',
      specs: json['specs'] is Map<String, dynamic>
          ? Map<String, dynamic>.from(json['specs'])
          : {}, 
    );
  }

  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'tagline': tagline,
      'description': description,
      'price': price,
      'currency': currency,
      'image': image,
      'specs': specs,
    };
  }
}