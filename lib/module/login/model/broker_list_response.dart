import 'package:xtrader_app/global/model/global_response.dart';

class BrokerListResponse {
  List<Broker>? data;
  GlobalResponse? globalResponse;

  BrokerListResponse({this.data, this.globalResponse});

  BrokerListResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Broker>[];
      json['data'].forEach((v) {
        data!.add(Broker.fromJson(v));
      });
    }
    globalResponse = GlobalResponse.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['code'] = globalResponse?.code;
    data['error'] = globalResponse?.error;
    data['message'] = globalResponse?.message;
    return data;
  }
}

class Broker {
  String? id;
  String? name;
  String? icon;

  Broker({this.id, this.name, this.icon});

  Broker.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['icon'] = this.icon;
    return data;
  }
}
