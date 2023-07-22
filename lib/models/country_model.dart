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
  CoatOfArms? coatOfArms;
  Maps? maps;
  final List<double>? latlng;
  final Currencies? currencies;
  final Map<String, String>? languages;
  final Translations? translations;
  final int? population;
  final String? fifa;
  final List<String>? timeZones;
  final List<String>? continents;
  double? area;

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
    this.languages,
    this.translations,
    this.population,
    this.fifa,
    this.timeZones,
    this.continents,
    this.coatOfArms,
    this.area,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      name: json['name'] != null ? json['name']['common'] : null,
      tld: json['tld'] != null ? List<String>.from(json['tld']) : null,
      capital:
          json['capital'] != null ? List<String>.from(json['capital']) : null,
      flags: json['flags'] != null ? Flags.fromJson(json['flags']) : null,
      coatOfArms: json['coatOfArms'] != null
          ? CoatOfArms.fromJson(json['coatOfArms'])
          : null,
      maps: json['maps'] != null ? Maps.fromJson(json['maps']) : null,
      latlng: json['latlng'] != null ? List<double>.from(json['latlng']) : null,
      currencies: json['currencies'] != null
          ? Currencies.fromJson(json['currencies'])
          : null,
      cca2: json['cca2'],
      ccn3: json['ccn3'],
      cca3: json['cca3'],
      cioc: json['cioc'],
      independent: json['independent'],
      status: json['status'],
      unMember: json['unMember'],
      languages: json['languages'] != null
          ? Map<String, String>.from(json['languages'])
          : null,
      translations: json['translations'] != null
          ? Translations.fromJson(json['translations'])
          : null,
      population: json['population'] ?? "",
      fifa: json['fifa'] ?? "",
      timeZones: json['timezones'] != null
          ? List<String>.from(json['timezones'])
          : null,
      continents: json['continents'] != null
          ? List<String>.from(json['continents'])
          : null,
      area: json['area'] ?? "",
    );
  }
}

class Flags {
  String? png;
  String? svg;
  String? alt;

  Flags({this.png, this.svg, this.alt});

  factory Flags.fromJson(Map<String, dynamic> json) {
    return Flags(png: json['png'], svg: json['svg'], alt: json['alt']);
  }
}

class CoatOfArms {
  String? png;
  String? svg;

  CoatOfArms({this.png, this.svg});
  factory CoatOfArms.fromJson(Map<String, dynamic> json) {
    return CoatOfArms(png: json['png'], svg: json['svg']);
  }
}

class Maps {
  String? googleMaps;
  String? openStreetMaps;

  Maps({this.googleMaps, this.openStreetMaps});

  factory Maps.fromJson(Map<String, dynamic> json) {
    return Maps(
        googleMaps: json['googleMaps'], openStreetMaps: json['openStreetMaps']);
  }
}

class Currencies {
  JOD? jOD;

  Currencies({this.jOD});

  Currencies.fromJson(Map<String, dynamic> json) {
    jOD = json['JOD'] != null ? JOD.fromJson(json['JOD']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = this.name;
    data['symbol'] = this.symbol;
    return data;
  }
}

class Translations {
  Map<String, Translation>? translations;

  Translations({this.translations});

  factory Translations.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> jsonTranslations = json;
    Map<String, Translation> translations = {};

    jsonTranslations.forEach((key, value) {
      translations[key] = Translation.fromJson(value);
    });

    return Translations(
      translations: translations,
    );
  }
}

class Translation {
  String? official;
  String? common;

  Translation({this.official, this.common});

  factory Translation.fromJson(Map<String, dynamic> json) {
    return Translation(
      official: json['official'],
      common: json['common'],
    );
  }
}
