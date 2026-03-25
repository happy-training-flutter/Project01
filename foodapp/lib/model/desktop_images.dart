/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';


DesktopImages desktopImagesFromJson(String str) => DesktopImages.fromJson(json.decode(str));

String desktopImagesToJson(DesktopImages data) => json.encode(data.toJson());

class DesktopImages {
    DesktopImages({
        required this.author,
        required this.width,
        required this.downloadUrl,
        required this.id,
        required this.url,
        required this.height,
    });

    String author;
    int width;
    String downloadUrl;
    String id;
    String url;
    int height;

    factory DesktopImages.fromJson(Map<dynamic, dynamic> json) => DesktopImages(
        author: json["author"],
        width: json["width"],
        downloadUrl: json["download_url"],
        id: json["id"],
        url: json["url"],
        height: json["height"],
    );

    Map<dynamic, dynamic> toJson() => {
        "author": author,
        "width": width,
        "download_url": downloadUrl,
        "id": id,
        "url": url,
        "height": height,
    };
}
