import 'package:intl/intl.dart';

class Customer {
  final String id;
  final String name;
  final String email;
  final int age;
  final String creditCard;
  final DateTime validDate;

  Customer({
    required this.id,
    required this.name,
    required this.email,
    required this.age,
    required this.creditCard,
    required this.validDate,
  }) {
    if (!_isValidCreditCard(creditCard)) {
      throw ArgumentError('Invalid credit card number');
    }
    if (!_isValidDate(validDate)) {
      throw ArgumentError('Invalid valid date');
    }
  }

  // Metodă factory pentru a crea un obiect Customer dintr-un Map
  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      age: map['age'] as int,
      creditCard: map['creditCard'] as String,
      validDate: DateTime.parse(map['validDate'] as String),
    );
  }

  // Metodă pentru a converti obiectul Customer într-un Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'age': age,
      'creditCard': creditCard,
      'validDate': validDate.toIso8601String(),
    };
  }

  // Validare simplă pentru numărul de card de credit (exemplu: 16 cifre)
  bool _isValidCreditCard(String cc) {
    return cc.length == 16 && int.tryParse(cc) != null;
  }

  // Validare pentru data de valabilitate (să nu fie în trecut)
  bool _isValidDate(DateTime date) {
    return date.isAfter(DateTime.now());
  }

  // Suprascrierea metodei toString pentru o reprezentare mai bună a obiectului
  @override
  String toString() {
    final dateFormat = DateFormat('yyyy-MM-dd');
    return 'Customer(id: $id, name: $name, email: $email, age: $age, '
        'creditCard: ${_maskCreditCard(creditCard)}, '
        'validDate: ${dateFormat.format(validDate)})';
  }

  // Metoda pentru mascarea numărului de card de credit
  String _maskCreditCard(String cc) {
    if (cc.length < 4) return cc;
    return '*' * (cc.length - 4) + cc.substring(cc.length - 4);
  }
}