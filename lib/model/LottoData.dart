class LottoData {
  final int id;
  final int lottoNumber1;
  final int lottoNumber2;
  final int lottoNumber3;
  final int lottoNumber4;
  final int lottoNumber5;
  final int lottoNumber6;
  final String createdAt;

  LottoData({
    this.id,
    this.lottoNumber1,
    this.lottoNumber2,
    this.lottoNumber3,
    this.lottoNumber4,
    this.lottoNumber5,
    this.lottoNumber6,
    this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'lottoNumber1': lottoNumber1,
      'lottoNumber2': lottoNumber2,
      'lottoNumber3': lottoNumber3,
      'lottoNumber4': lottoNumber4,
      'lottoNumber5': lottoNumber5,
      'lottoNumber6': lottoNumber6,
      'createdAt': createdAt
    };
  }
}
