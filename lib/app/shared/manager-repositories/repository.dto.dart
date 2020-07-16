class RepositoryDto {
  int statusCode;
  String statusMessage;
  Object data;

  RepositoryDto({this.statusCode, this.statusMessage, this.data});

  RepositoryDto.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    statusMessage = json['statusMessage'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['statusMessage'] = this.statusMessage;
    data['data'] = this.data;
    return data;
  }
}