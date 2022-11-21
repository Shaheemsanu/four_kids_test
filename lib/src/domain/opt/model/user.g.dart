// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      name: json['name'] as String?,
      address: json['address'],
      phone: json['phone'] as String?,
      active: json['active'] as int?,
      contactPerson: json['contact_person'] as String?,
      approvel: json['approvel'] as int?,
      email: json['email'] as String?,
      locationLatitude: (json['location_latitude'] as num?)?.toDouble(),
      locationLongitude: (json['location_longitude'] as num?)?.toDouble(),
      whatsappNumber: json['whatsapp_number'] as String?,
      wholesaleUser: json['wholesale_user'] as int?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'phone': instance.phone,
      'active': instance.active,
      'contact_person': instance.contactPerson,
      'approvel': instance.approvel,
      'email': instance.email,
      'location_latitude': instance.locationLatitude,
      'location_longitude': instance.locationLongitude,
      'whatsapp_number': instance.whatsappNumber,
      'wholesale_user': instance.wholesaleUser,
      'image': instance.image,
    };
