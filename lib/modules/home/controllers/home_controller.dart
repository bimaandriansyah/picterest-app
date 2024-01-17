import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picterest_app/modules/home/models/image_item.dart';
import 'package:picterest_app/services/service_controller.dart';
import 'package:picterest_app/services/service_provider.dart';

class HomeController extends GetxController with ServiceController {
  ScrollController scrollController = ScrollController();
  var imageList = <ImageItem>[].obs;
  var isLoadingImage = false.obs;
  var isMoreImages = true.obs;
  int page = 1;

  Future<void> getImageList() async {
    imageList.clear();
    page = 1;
    isLoadingImage.value = true;
    var response = await ServiceProvider.getData(
      'list?page=$page&limit=16',
    ).catchError(handleErrorya);

    if (response == null) return;

    if (response != null) {
      List<ImageItem> images =
          (response.data as List).map((x) => ImageItem.fromJson(x)).toList();
      page++;
      if (images.length != 16) {
        isMoreImages.value = false;
      }
      imageList.value = images;
      isLoadingImage.value = false;
    }
  }

  Future<void> getImageListPagination() async {
    var response = await ServiceProvider.getData(
      'list?page=$page&limit=16',
    ).catchError(handleErrorya);

    if (response == null) return;

    if (response != null) {
      List<ImageItem> images =
          (response.data as List).map((x) => ImageItem.fromJson(x)).toList();
      page++;
      if (images.length != 16) {
        isMoreImages.value = false;
      }
      imageList.addAll(images);
    }
  }

  @override
  void onInit() {
    getImageList();
    scrollController.addListener(() async {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        if (isMoreImages.value) {
          getImageListPagination();
        }
      }
    });
    super.onInit();
  }
}
