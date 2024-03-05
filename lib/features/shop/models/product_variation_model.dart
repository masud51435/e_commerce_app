class ProductVariationModel {
  ProductVariationModel({
    required this.id,
    this.sku = '',
    this.image = '',
    this.description = '',
    this.price = 0.0,
    this.salePrice = 0.0,
    this.stack = 0,
    required this.attributeValue,
  });

  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double salePrice;
  int stack;
  Map<String, String> attributeValue;

  // Create empty function for clean code
  static ProductVariationModel empty() => ProductVariationModel(
        id: '',
        attributeValue: {},
      );

  // convert to json format
  toJson() {
    return {
      'Id': id,
      'Image': image,
      'Price': price,
      'SalePrice': salePrice,
      'Stack': stack,
      'Description': description,
      'SKU': sku,
      'AttributesValue': attributeValue,
    };
  }

  // Map json oriented document snapshot from Firebase to model
  factory ProductVariationModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) {
      return ProductVariationModel.empty();
    }
    return ProductVariationModel(
      id: data['Id'] ?? '',
      attributeValue: Map<String, String>.from(data['AttributesValue']),
      price: double.parse((data['Price'] ?? 0.0).toString()),
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      sku: data['SKU'] ?? '',
      stack: data['Stack'] ?? 0,
      image: data['Image'] ?? '',
      description: data['Description'] ?? '',
    );
  }
}
