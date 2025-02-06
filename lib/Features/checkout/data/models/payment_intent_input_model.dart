class PaymentIntentInputModel {
  final String amount, currency;

  PaymentIntentInputModel({required this.amount, required this.currency});

  toJson() {
    return {
      'amount': '${amount}00',
      'currency': currency,
    };
  }
}
