import 'dart:convert';

class Customer {
  final int id;
  final String name;

  Customer({required this.id, required this.name});

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}

class Order {
  final int orderId;
  final Customer customer;
  final double total;

  Order({
    required this.orderId,
    required this.customer,
    required this.total,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderId: json['orderId'] as int,
      customer: Customer.fromJson(json['customer'] as Map<String, dynamic>),
      total: (json['total'] as num).toDouble(), // asegura double
    );
  }

  Map<String, dynamic> toJson() => {
        'orderId': orderId,
        'customer': customer.toJson(),
        'total': total,
      };
}

