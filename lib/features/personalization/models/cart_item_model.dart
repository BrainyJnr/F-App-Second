
class CartItemModel {
  String productId;
  String title;
  double price;
  String? image;
  int quantity;
  // int totalAmount;
  String variationId;
  String? brandName;
  Map<String, String>? selectedVariation;

  /// Controller
  CartItemModel({
    required this.productId,
    required this.quantity,
    //required this.totalAmount,
    this.variationId = "",
    this.image,
    this.price = 0.0,
    this.title = "",
    this.brandName,
    this.selectedVariation,
  });

  /// Calculate Total Amount
  String get totalAmount => (price * quantity).toStringAsFixed(1);

  /// Empty Cart
  static CartItemModel empty() => CartItemModel(productId: "", quantity: 0,);


  /// Convert a CartItem to a JSON Map
  Map<String, dynamic> toJson() {
    return {
      "productId": productId,
      "title": title,
      "price": price,
      "image": image,
      //"totalAmount": totalAmount,
      "quantity": quantity,
      "variationId": variationId,
      "brandName": brandName,
      "selectedVariation": selectedVariation,
    };
  }

  /// Create a CartItem from a JSON Map
  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productId: json["productId"],
      title: json["title"],
      price: json["price"]?.toDouble(),
      image: json["image"] ,
      quantity: json["quantity"],
      //totalAmount: json["totalAmount"],
      variationId: json["variationId"],
      brandName: json["brandName"],
      selectedVariation: json["selectedVariation"] != null ? Map<String, String>.from(json["selectedVariation"]) : null,
    );
  }
}
