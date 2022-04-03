class Weather{
  String? city;
  double? temp;
  double? tempMax;
  double? tempMin;
  String? image;
  String? status;

  Weather({this.city, this.temp, this.tempMax, this.tempMin, this.image, this.status});

  Weather.fromJson(Map<String, dynamic> json){
    city = json["name"];
    temp = json["main"]["temp"];
    tempMax = json["main"]["temp_max"];
    tempMin = json["main"]["temp_min"];
    image = json["weather"][0]["icon"];
    status = json["weather"][0]["main"];
  }
}