class VideoList {
  int? status;
  String? message;
  int? more;
  int? offset;
  String? limit;
  int? count;
  List<Data>? data;

  VideoList(
      {this.status,
      this.message,
      this.more,
      this.offset,
      this.limit,
      this.count,
      this.data});

  VideoList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    more = json['more'];
    offset = json['offset'];
    limit = json['limit'];
    count = json['count'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['more'] = this.more;
    data['offset'] = this.offset;
    data['limit'] = this.limit;
    data['count'] = this.count;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? image;
  int? id;
  String? title;
  String? videoSlug;
  String? message;
  int? userId;
  int? parentCategoryId;
  String? parentCategoryName;
  int? subCategoryId;
  String? subCategoryName;
  int? childCategoryId;
  String? childCategoryName;
  String? videoUrl;
  String? youtubeVideoId;
  String? videoDuration;
  String? tags;
  String? videoPublishedDate;
  String? createdAt;
  int? isFavorite;
  int? labelId;

  Data(
      {this.image,
      this.id,
      this.title,
      this.videoSlug,
      this.message,
      this.userId,
      this.parentCategoryId,
      this.parentCategoryName,
      this.subCategoryId,
      this.subCategoryName,
      this.childCategoryId,
      this.childCategoryName,
      this.videoUrl,
      this.youtubeVideoId,
      this.videoDuration,
      this.tags,
      this.videoPublishedDate,
      this.createdAt,
      this.isFavorite,
      this.labelId});

  Data.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    id = json['id'];
    title = json['title'];
    videoSlug = json['videoSlug'];
    message = json['message'];
    userId = json['userId'];
    parentCategoryId = json['parentCategoryId'];
    parentCategoryName = json['parentCategoryName'];
    subCategoryId = json['subCategoryId'];
    subCategoryName = json['subCategoryName'];
    childCategoryId = json['childCategoryId'] ?? 0;
    childCategoryName = json['childCategoryName'];
    videoUrl = json['videoUrl'];
    youtubeVideoId = json['youtubeVideoId'];
    videoDuration = json['videoDuration'];
    tags = json['tags'];
    videoPublishedDate = json['videoPublishedDate'];
    createdAt = json['created_at'];
    isFavorite = json['isFavorite'];
    labelId = json['labelId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['id'] = this.id;
    data['title'] = this.title;
    data['videoSlug'] = this.videoSlug;
    data['message'] = this.message;
    data['userId'] = this.userId;
    data['parentCategoryId'] = this.parentCategoryId;
    data['parentCategoryName'] = this.parentCategoryName;
    data['subCategoryId'] = this.subCategoryId;
    data['subCategoryName'] = this.subCategoryName;
    data['childCategoryId'] = this.childCategoryId;
    data['childCategoryName'] = this.childCategoryName;
    data['videoUrl'] = this.videoUrl;
    data['youtubeVideoId'] = this.youtubeVideoId;
    data['videoDuration'] = this.videoDuration;
    data['tags'] = this.tags;
    data['videoPublishedDate'] = this.videoPublishedDate;
    data['created_at'] = this.createdAt;
    data['isFavorite'] = this.isFavorite;
    data['labelId'] = this.labelId;
    return data;
  }
}


