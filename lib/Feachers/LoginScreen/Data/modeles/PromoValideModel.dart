class PromoValid {
  bool promoValid =false;

  PromoValid({required this.promoValid});

  PromoValid.fromJson(Map<String, dynamic> json) {
    promoValid = json['promo_valid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['promo_valid'] = this.promoValid;
    return data;
  }
}
