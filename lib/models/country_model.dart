class CountryModel {
  String? name;
  List<String>? tld;
  String? cca2;
  String? ccn3;
  String? cca3;
  String? cioc;
  bool? independent;
  String? status;
  bool? unMember;
  List<String>? capital;
  Flags? flags;
  Maps? maps;
  final List<double>? latlng;
  final Currencies? currencies;
  // Add other fields from the API response as per your requirement

  CountryModel({
    this.name,
    this.tld,
    this.cca2,
    this.ccn3,
    this.cca3,
    this.cioc,
    this.independent,
    this.status,
    this.unMember,
    this.capital,
    this.flags,
    this.maps,
    this.latlng,
    this.currencies,

    // Add other fields from the API response as per your requirement
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      name: json['name'] != null ? json['name']['common'] : null,
      tld: json['tld'] != null ? List<String>.from(json['tld']) : null,
      capital: json['capital']!=null? List<String>.from(json['capital']):null,
      flags: json['flags']!=null? Flags.fromJson(json['flags']):null,
      maps: json['maps']!=null? Maps.fromJson(json['maps']):null,
      latlng: json['latlng'] != null ? List<double>.from(json['latlng']) : null,
      currencies: json['currencies']!=null? Currencies.fromJson(json['currencies']):null,
      cca2: json['cca2'],
      ccn3: json['ccn3'],
      cca3: json['cca3'],
      cioc: json['cioc'],
      independent: json['independent'],
      status: json['status'],
      unMember: json['unMember'],
      // Add other fields from the API response as per your requirement
    );
  }



}


class Flags{

  String? png;
  String? svg;
  String? alt;

  Flags({this.png,this.svg,this.alt});

  factory Flags.fromJson(Map<String,dynamic> json){
    return Flags(
      png: json['png'],
      svg: json['svg'],
      alt: json['alt']
    );
  }

}

class Maps{
  String? googleMaps;
  String? openStreetMaps;

  Maps({this.googleMaps,this.openStreetMaps});

  factory Maps.fromJson(Map<String,dynamic> json){
    return Maps(
      googleMaps: json['googleMaps'],
      openStreetMaps: json['openStreetMaps']
    );
  }

}
class Currencies {
  JOD? jOD;

  Currencies({this.jOD});

  Currencies.fromJson(Map<String, dynamic> json) {
    jOD = json['JOD'] != null ? new JOD.fromJson(json['JOD']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.jOD != null) {
      data['JOD'] = this.jOD!.toJson();
    }
    return data;
  }
}

class JOD {
  String? name;
  String? symbol;

  JOD({this.name, this.symbol});

  JOD.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    symbol = json['symbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['symbol'] = this.symbol;
    return data;
  }
}

