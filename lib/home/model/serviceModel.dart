
import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceModel {
  final String? name;
  final String? ownername;
  final String? address;
  final String? area;
  final String? city;
  final String? state;
  final String? email;
  final int? contact;
  final int? rent;

  const ServiceModel(
      {this.name,
      this.ownername,
      this.address,
      this.area,
      this.city,
      this.state,
      this.email,
      this.contact,
      this.rent});
  toJson() {
    return {
      "Name": name,
      "ownername": ownername,
      "address": address,
      "area": area,
      "city": city,
      "state": state,
      "email": email,
      "rent": rent,
      "contact": contact
    };
  }

  factory ServiceModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    Map<String,dynamic>? data = documentSnapshot.data();
    return ServiceModel(
        name: data?["name"] ,
        ownername: data?["ownername"] ,
        address: data?["address"],
        area:data?["area"] ,
        city:data?["city"] ,
        state: data?["state"],
        rent: data?["rent"],
        contact: data?["contact"]
        );
  }
}
