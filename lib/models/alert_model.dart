class AlertModel {
  final String rname; //reporter name
  final String rphone; //reporter phone
  final String oname; //orphan name
  final String obirth; //orphan birth
  final String oconditions; //orphan conditions
  final String olocation; //orphan location

  const AlertModel({
    required this.rname,
    required this.rphone,
    required this.oname,
    required this.obirth,
    required this.oconditions,
    required this.olocation,
  });

  toJson() {
    return {
      "rname": rname,
      "rphone": rphone,
      "oname": oname,
      "obirth": obirth,
      "oconditions": oconditions,
      "olocation": olocation,
    };
  }
}
