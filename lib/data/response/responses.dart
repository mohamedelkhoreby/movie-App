import 'package:json_annotation/json_annotation.dart';
part 'responses.g.dart';
@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;
}

@JsonSerializable()
class StoreResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'Title')
  String? Title;
  @JsonKey(name: 'Year')
  String? Year;
  @JsonKey(name: 'Rated')
  String? Rated;
  @JsonKey(name: 'Released')
  String? Released;
  @JsonKey(name: 'Images')
  String? Images;
 
  StoreResponse(this.id, this.Title,this.Year,this.Rated,this.Released,this.Images);

// toJson
  Map<String, dynamic> toJson() => _$StoreResponseToJson(this);

//fromJson
  factory StoreResponse.fromJson(Map<String, dynamic> json) =>
      _$StoreResponseFromJson(json);
}

@JsonSerializable()
class HomeDataResponse {
  @JsonKey(name: 'stores')
  List<StoreResponse>? stores;


  HomeDataResponse(this.stores);

// toJson
  Map<String, dynamic> toJson() => _$HomeDataResponseToJson(this);

//fromJson
  factory HomeDataResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeDataResponseFromJson(json);
}

@JsonSerializable()
class HomeResponse extends BaseResponse {
  @JsonKey(name: 'data')
  HomeDataResponse? data;

  HomeResponse(this.data);

// toJson
  Map<String, dynamic> toJson() => _$HomeResponseToJson(this);
//fromJson
  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);
}
