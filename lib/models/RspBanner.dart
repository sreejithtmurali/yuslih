class RspBanner {
  RspBanner({
      required this.image,});

 late String image;

  factory RspBanner.fromJson(Map<String, dynamic> json) => RspBanner(image: json["image"],
  );
  Map<String, dynamic> toJson() => {
    "image": image,
  };
}







