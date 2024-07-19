class Customer {
  final String id;
  final String name;
  final String email;
  final String address;
  final String creditcard;
  final String validdates;
  Customer({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.creditcard,
    required this.validdates,
  });

  // Metoda factory pentru crearea unui Customer dintr-un Map
  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      address: map['address'] as String,
      creditcard: map['creditcard'] as String,
      validdates: map['validdates'] as String,
    );
  }

  // Metoda pentru convertirea unui Customer într-un Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'address': address,
      'creditcard':creditcard,
      'validdates': validdates,
    };
  }
}
