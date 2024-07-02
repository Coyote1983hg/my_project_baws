class Customer {
  final String id;
  final String name;
  final String email;
  final String address;

  Customer({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
  });

  // Metoda factory pentru crearea unui Customer dintr-un Map
  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      address: map['address'] as String,
    );
  }

  // Metoda pentru convertirea unui Customer într-un Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'address': address,
    };
  }
}
