import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tiktok_flutter/data/demo_data.dart';
import 'package:tiktok_flutter/data/video.dart';
import 'package:tiktok_flutter/utils/dummyVideos.dart';

class VideosAPI {
  List<Video> listVideos = List<Video>();

  VideosAPI() {
    load();
  }

  void load() async {
    listVideos = await getVideoList();
  }

  Future<List<Video>> getVideoList() async {
//    var data = await FirebaseFirestore.instance.collection("Videos").get();

    var videoList = <Video>[];
    var videos;

//    if (data.docs.length == 0) {
//      await addDemoData();
//      videos = (await FirebaseFirestore.instance.collection("Videos").get());
//    } else {
//      videos = data;
//    }
    videos = dummyVideos;
    videos.forEach((element) {
      Video video = Video.fromJson(element);
      videoList.add(video);
    });

    return videoList;
  }

  Future<Null> addDemoData() async {
    for (var video in data) {
      await FirebaseFirestore.instance.collection("Videos").add(video);
    }
  }
}
