class ProductLayout {
  final String name;
  final String img;
  final double price;
  final double prevPrice;
  bool isFavourite = false;
  int quantity;

  ProductLayout(this.name, this.img, this.price, this.prevPrice,
      this.isFavourite, this.quantity);
}
