class IceCream {
  String flavor = "unknown";
  double price = 6.99;
  bool surgarFree = false;
  String size = "small";

  void charge() {
    print("El precio de un helado de sabor $flavor y de tamaño $size es: \$$price");
  }
}