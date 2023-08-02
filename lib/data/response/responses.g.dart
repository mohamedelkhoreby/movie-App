// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse()
  ..status = json['status'] as int?
  ..message = json['message'] as String?;

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };

StoreResponse _$StoreResponseFromJson(Map<String, dynamic> json) =>
    StoreResponse(
      json['id'] as int?,
      json['Title'] as String?,
      json['Year'] as String?,
      json['Rated'] as String?,
      json['Released'] as String?,
      json['Images'] as String?,
    );

Map<String, dynamic> _$StoreResponseToJson(StoreResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'Title': instance.Title,
      'Year': instance.Year,
      'Rated': instance.Rated,
      'Released': instance.Released,
      'Images': instance.Images,
    };

HomeDataResponse _$HomeDataResponseFromJson(Map<String, dynamic> json) =>
    HomeDataResponse(
      (json['stores'] as List<dynamic>?)
          ?.map((e) => StoreResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeDataResponseToJson(HomeDataResponse instance) =>
    <String, dynamic>{
      'stores': instance.stores,
    };

HomeResponse _$HomeResponseFromJson(Map<String, dynamic> json) => HomeResponse(
      json['data'] == null
          ? null
          : HomeDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$HomeResponseToJson(HomeResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
