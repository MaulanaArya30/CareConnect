class ProfileModel {
  final String? id;
  final String name; //reporter name
  final String email; //reporter phone
  final String phone; //orphan name
  final String cardname; //orphan birth
  final String cardnumber; //orphan conditions
  final String securitycode;
  final String expiredate; //orphan location

  const ProfileModel({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.cardname,
    required this.cardnumber,
    required this.securitycode,
    required this.expiredate,
  });

  toJson() {
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "cardname": cardname,
      "cardnumber": cardnumber,
      "securitycode": securitycode,
      "expiredate": expiredate,
    };
  }
}
