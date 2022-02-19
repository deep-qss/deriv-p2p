// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

Future<Advert> newsModelFromJson(String str) async =>
    Advert.fromJson(json.decode(str));

Future<String> newsModelToJson(Advert data) async => json.encode(data.toJson());

/// Advert Model class

class Advert {
  ///Initializer
  Advert({
    this.echoReq,
    this.msgType,
    this.p2PAdvertList,
  });

  EchoReq? echoReq;
  String? msgType;
  P2PAdvertList? p2PAdvertList;

  factory Advert.fromJson(Map<String, dynamic> json) => Advert(
        echoReq: EchoReq.fromJson(json['echo_req']),
        msgType: json['msg_type'],
        p2PAdvertList: P2PAdvertList.fromJson(json['p2p_advert_list']),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq?.toJson(),
        'msg_type': msgType,
        'p2p_advert_list': p2PAdvertList?.toJson(),
      };
}

/// Echo request class

class EchoReq {
  ///Initializer
  EchoReq({
    this.counterpartyType,
    this.p2PAdvertList,
  });

  String? counterpartyType;
  int? p2PAdvertList;

  factory EchoReq.fromJson(Map<String, dynamic> json) => EchoReq(
        counterpartyType: json['counterparty_type'],
        p2PAdvertList: json['p2p_advert_list'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'counterparty_type': counterpartyType,
        'p2p_advert_list': p2PAdvertList,
      };
}

/// P2P Advert list model class
class P2PAdvertList {
  ///Initializer
  P2PAdvertList({
    this.list,
  });

  List<ListElement>? list;

  factory P2PAdvertList.fromJson(Map<String, dynamic> json) => P2PAdvertList(
        list: List<ListElement>.from(
            json['list'].map((dynamic x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'list': List<dynamic>.from(
            list!.map<Map<String, dynamic>>((x) => x.toJson())),
      };
}

/// Element List class Model

class ListElement {
  ///Initializer
  ListElement({
    this.accountCurrency,
    this.advertiserDetails,
    this.counterpartyType,
    this.country,
    this.createdTime,
    this.description,
    this.id,
    this.isActive,
    this.isVisible,
    this.localCurrency,
    this.maxOrderAmountLimit,
    this.maxOrderAmountLimitDisplay,
    this.minOrderAmountLimit,
    this.minOrderAmountLimitDisplay,
    this.paymentMethod,
    this.price,
    this.priceDisplay,
    this.rate,
    this.rateDisplay,
    this.type,
  });

  String? accountCurrency;
  AdvertiserDetails? advertiserDetails;
  String? counterpartyType;
  String? country;
  int? createdTime;
  String? description;
  String? id;
  int? isActive;
  int? isVisible;
  String? localCurrency;
  int? maxOrderAmountLimit;
  String? maxOrderAmountLimitDisplay;
  int? minOrderAmountLimit;
  String? minOrderAmountLimitDisplay;
  String? paymentMethod;
  double? price;
  String? priceDisplay;
  double? rate;
  String? rateDisplay;
  String? type;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        accountCurrency: json['account_currency'],
        advertiserDetails:
            AdvertiserDetails.fromJson(json['advertiser_details']),
        counterpartyType: json['counterparty_type'],
        country: json['country'],
        createdTime: json['created_time'],
        description: json['description'],
        id: json['id'],
        isActive: json['is_active'],
        isVisible: json['is_visible'],
        localCurrency: json['local_currency'],
        maxOrderAmountLimit: json['max_order_amount_limit'],
        maxOrderAmountLimitDisplay: json['max_order_amount_limit_display'],
        minOrderAmountLimit: json['min_order_amount_limit'],
        minOrderAmountLimitDisplay: json['min_order_amount_limit_display'],
        paymentMethod: json['payment_method'],
        price: json['price'].toDouble(),
        priceDisplay: json['price_display'],
        rate: json['rate'].toDouble(),
        rateDisplay: json['rate_display'],
        type: json['type'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'account_currency': accountCurrency,
        'advertiser_details': advertiserDetails?.toJson(),
        'counterparty_type': counterpartyType,
        'country': country,
        'created_time': createdTime,
        'description': description,
        'id': id,
        'is_active': isActive,
        'is_visible': isVisible,
        'local_currency': localCurrency,
        'max_order_amount_limit': maxOrderAmountLimit,
        'max_order_amount_limit_display': maxOrderAmountLimitDisplay,
        'min_order_amount_limit': minOrderAmountLimit,
        'min_order_amount_limit_display': minOrderAmountLimitDisplay,
        'payment_method': paymentMethod,
        'price': price,
        'price_display': priceDisplay,
        'rate': rate,
        'rate_display': rateDisplay,
        'type': type,
      };
}

/// Advertiser details model class

class AdvertiserDetails {
  /// Initializer
  AdvertiserDetails({
    this.completedOrdersCount,
    this.firstName,
    this.id,
    this.lastName,
    this.name,
    this.totalCompletionRate,
  });

  int? completedOrdersCount;
  String? firstName;
  String? id;
  String? lastName;
  String? name;
  dynamic totalCompletionRate;

  factory AdvertiserDetails.fromJson(Map<String, dynamic> json) =>
      AdvertiserDetails(
        completedOrdersCount: json['completed_orders_count'],
        firstName: json['first_name'] == null ? null : json['first_name'],
        id: json['id'],
        lastName: json['last_name'] == null ? null : json['last_name'],
        name: json['name'],
        totalCompletionRate: json['total_completion_rate'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'completed_orders_count': completedOrdersCount,
        'first_name': firstName,
        'id': id,
        'last_name': lastName,
        'name': name,
        'total_completion_rate': totalCompletionRate,
      };
}

/// total completion rate class model
class TotalCompletionRateClass {
  ///Initializer
  TotalCompletionRateClass();

  factory TotalCompletionRateClass.fromJson(Map<String, dynamic> json) =>
      TotalCompletionRateClass();

  Map<String, dynamic> toJson() => <String, dynamic>{};
}
