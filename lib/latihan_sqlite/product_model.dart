class ProductModel {
  final int? id;
  final String? name;
  final String? category, createdAt, updatedAt;

  ProductModel(
      {this.id, this.name, this.category, this.createdAt, this.updatedAt});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
