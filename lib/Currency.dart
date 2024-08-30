// To parse this JSON data, do
//
//     final currency = currencyFromJson(jsonString);

import 'dart:convert';

Currency currencyFromJson(String str) => Currency.fromJson(json.decode(str));

String currencyToJson(Currency data) => json.encode(data.toJson());

class Currency {
  String? aed;
  String? afn;
  String? all;
  String? amd;
  String? ang;
  String? aoa;
  String? ars;
  String? aud;
  String? awg;
  String? azn;
  String? bam;
  String? bbd;
  String? bdt;
  String? bgn;
  String? bhd;
  String? bif;
  String? bmd;
  String? bnd;
  String? bob;
  String? brl;
  String? bsd;
  String? btc;
  String? btn;
  String? bwp;
  String? byn;
  String? bzd;
  String? cad;
  String? cdf;
  String? chf;
  String? clf;
  String? clp;
  String? cnh;
  String? cny;
  String? cop;
  String? crc;
  String? cuc;
  String? cup;
  String? cve;
  String? czk;

  Currency({
    this.aed,
    this.afn,
    this.all,
    this.amd,
    this.ang,
    this.aoa,
    this.ars,
    this.aud,
    this.awg,
    this.azn,
    this.bam,
    this.bbd,
    this.bdt,
    this.bgn,
    this.bhd,
    this.bif,
    this.bmd,
    this.bnd,
    this.bob,
    this.brl,
    this.bsd,
    this.btc,
    this.btn,
    this.bwp,
    this.byn,
    this.bzd,
    this.cad,
    this.cdf,
    this.chf,
    this.clf,
    this.clp,
    this.cnh,
    this.cny,
    this.cop,
    this.crc,
    this.cuc,
    this.cup,
    this.cve,
    this.czk,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        aed: json["AED"],
        afn: json["AFN"],
        all: json["ALL"],
        amd: json["AMD"],
        ang: json["ANG"],
        aoa: json["AOA"],
        ars: json["ARS"],
        aud: json["AUD"],
        awg: json["AWG"],
        azn: json["AZN"],
        bam: json["BAM"],
        bbd: json["BBD"],
        bdt: json["BDT"],
        bgn: json["BGN"],
        bhd: json["BHD"],
        bif: json["BIF"],
        bmd: json["BMD"],
        bnd: json["BND"],
        bob: json["BOB"],
        brl: json["BRL"],
        bsd: json["BSD"],
        btc: json["BTC"],
        btn: json["BTN"],
        bwp: json["BWP"],
        byn: json["BYN"],
        bzd: json["BZD"],
        cad: json["CAD"],
        cdf: json["CDF"],
        chf: json["CHF"],
        clf: json["CLF"],
        clp: json["CLP"],
        cnh: json["CNH"],
        cny: json["CNY"],
        cop: json["COP"],
        crc: json["CRC"],
        cuc: json["CUC"],
        cup: json["CUP"],
        cve: json["CVE"],
        czk: json["CZK"],
      );

  Map<String, dynamic> toJson() => {
        "AED": aed,
        "AFN": afn,
        "ALL": all,
        "AMD": amd,
        "ANG": ang,
        "AOA": aoa,
        "ARS": ars,
        "AUD": aud,
        "AWG": awg,
        "AZN": azn,
        "BAM": bam,
        "BBD": bbd,
        "BDT": bdt,
        "BGN": bgn,
        "BHD": bhd,
        "BIF": bif,
        "BMD": bmd,
        "BND": bnd,
        "BOB": bob,
        "BRL": brl,
        "BSD": bsd,
        "BTC": btc,
        "BTN": btn,
        "BWP": bwp,
        "BYN": byn,
        "BZD": bzd,
        "CAD": cad,
        "CDF": cdf,
        "CHF": chf,
        "CLF": clf,
        "CLP": clp,
        "CNH": cnh,
        "CNY": cny,
        "COP": cop,
        "CRC": crc,
        "CUC": cuc,
        "CUP": cup,
        "CVE": cve,
        "CZK": czk,
      };
}
