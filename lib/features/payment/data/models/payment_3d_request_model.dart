class Payment3DRequestModel {
  String cardHolderName;
  String cardNumber;
  String expire;
  int cvc;
  String name;
  String lastName;
  String phone;
  String mail;
  String identityNumber;
  String city;
  String country;
  String address;

  Payment3DRequestModel({
    this.address,
    this.cardHolderName, this.cardNumber,
    this.cvc, this.expire,
    this.city, this.country,
    this.identityNumber, this.lastName,
    this.mail, this.name, this.phone
  });

  factory Payment3DRequestModel.fromJson(Map<String, dynamic> json){
    return Payment3DRequestModel(
      address: json['address'] as String,
      cardHolderName: json['cardHolderName'] as String,
      cardNumber: json['cardNumber'] as String,
      city: json['city'] as String,
      country: json['country'] as String,
      cvc: json['cvc'] as int,
      expire: json['expire'] as String,
      identityNumber: json['identity_number'] as String,
      lastName: json['last_name'] as String,
      mail: json['mail'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String
    );
  }


  Map<String, dynamic> toJson(){
    return {
      'address' : address,
      'cardHolderName': cardHolderName,
      'cardNumber': cardNumber,
      'cvc': cvc,
      'expire': expire,
      'city': city,
      'country': country,
      'mail': mail,
      'phone': phone,
      'identity_number': identityNumber,
      'name': name,
      'last_name': lastName
    };
  }
}