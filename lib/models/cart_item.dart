class CartItem {
  final int productId;
  final int productPrice;
  int qty;
  int productTotal;

  CartItem(
      {required this.productId,
      required this.productPrice,
      required this.qty,
      required this.productTotal});
}
