import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:picterest_app/constant/colors_constant.dart';
import 'package:picterest_app/constant/texts_contstant.dart';
import 'package:picterest_app/modules/home/controllers/home_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:picterest_app/modules/home/models/image_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeC = Get.find();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 58.w,
        backgroundColor: Colors.transparent,
        elevation: 1,
        title: Text(
          "Picterest App",
          style: AppTextStyles.text16Bold.copyWith(color: AppColors.whiteColor),
        ),
        actions: [
          SizedBox(width: 16.w),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.secondaryColor,
              AppColors.darkBlackColor,
              AppColors.darkBlackColor
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Obx(
          () => GridView.builder(
            controller: homeC.scrollController,
            padding: EdgeInsets.only(
              top: 84.w,
              left: 4.w,
              right: 4.w,
              bottom: 4.w,
            ),
            itemCount: homeC.imageList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4.w,
              mainAxisSpacing: 4.w,
            ),
            itemBuilder: (context, index) {
              var data = homeC.imageList[index];
              var onClick = false.obs;
              return GestureDetector(
                onTap: () {
                  onClick.value = true;
                  Future.delayed(Duration(milliseconds: 100), () {
                    onTapImage(data);
                    onClick.value = false;
                  });
                },
                child: Obx(
                  () => Transform.scale(
                    filterQuality: FilterQuality.high,
                    scale: onClick.value ? 0.9 : 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4.w),
                      child: Hero(
                        tag: data.id!,
                        child: CachedNetworkImage(
                          imageUrl: "https://picsum.photos/id/${data.id}/400",
                          placeholder: (context, url) => Image.network(
                            "https://picsum.photos/id/${data.id}/400/?blur",
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  onTapImage(ImageItem data) {
    var isSwipe = false.obs;
    var bottomA = 0.0.obs;
    DraggableScrollableController scrollControllera =
        DraggableScrollableController();
    scrollControllera.addListener(
      () {
        if (scrollControllera.pixels > 80.w) {
          isSwipe.value = true;
        } else {
          isSwipe.value = false;
        }
        if (scrollControllera.pixels <= Get.height / 2) {
          bottomA.value = scrollControllera.pixels;
        }
      },
    );
    Get.dialog(
      Dialog.fullscreen(
        backgroundColor: AppColors.darkBlackColor,
        insetAnimationDuration: Duration(milliseconds: 400),
        child: Stack(
          children: [
            Obx(
              () => Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: bottomA.value,
                child: GestureDetector(
                  onVerticalDragUpdate: (details) {
                    if (details.delta.direction >= 0) {
                      Get.back();
                    }
                  },
                  child: InteractiveViewer(
                    child: CachedNetworkImage(
                      width: Get.width,
                      height: Get.width,
                      imageUrl: "https://picsum.photos/id/${data.id}/400",
                      placeholder: (context, url) => Image.network(
                        "https://picsum.photos/id/${data.id}/400/?blur",
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
              ),
            ),
            DraggableScrollableSheet(
              controller: scrollControllera,
              initialChildSize: 70.w / Get.height,
              maxChildSize: 1,
              minChildSize: 70.w / Get.height,
              expand: true,
              snap: true,
              snapSizes: [
                70.w / Get.height,
                0.5,
              ],
              builder: (context, scrollController) {
                return CustomScrollView(
                  controller: scrollController,
                  slivers: [
                    Obx(
                      () => SliverToBoxAdapter(
                        child: AnimatedCrossFade(
                          crossFadeState: isSwipe.value
                              ? CrossFadeState.showSecond
                              : CrossFadeState.showFirst,
                          secondChild: SizedBox(height: 70.w),
                          firstChild: SizedBox(
                            height: 70.w,
                            width: Get.width,
                            child: Column(
                              children: [
                                Icon(Icons.arrow_upward_sharp,
                                    color: AppColors.whiteColor),
                                SizedBox(height: 8.w),
                                Text(
                                  "Swipe Up For Details",
                                  style: AppTextStyles.text12SemiBold
                                      .copyWith(color: AppColors.whiteColor),
                                )
                              ],
                            ),
                          ),
                          duration: Duration(milliseconds: 100),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        padding: EdgeInsets.all(24.w),
                        height: Get.height,
                        decoration: BoxDecoration(
                            color: AppColors.darkBlackColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24.w),
                              topRight: Radius.circular(24.w),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.shadowColor.withOpacity(0.2),
                                blurRadius: 12.w,
                              )
                            ]),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 48.w,
                                height: 6.w,
                                decoration: BoxDecoration(
                                  color: AppColors.bgInputColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6.w)),
                                ),
                              ),
                            ),
                            SizedBox(height: 14.w),
                            Text(
                              "Title",
                              style: AppTextStyles.text12
                                  .copyWith(color: AppColors.whiteColor),
                            ),
                            SizedBox(height: 8.w),
                            Text(
                              "Image ${data.id}",
                              style: AppTextStyles.text14Bold
                                  .copyWith(color: AppColors.whiteColor),
                            ),
                            SizedBox(height: 14.w),
                            Text(
                              "Author",
                              style: AppTextStyles.text12
                                  .copyWith(color: AppColors.whiteColor),
                            ),
                            SizedBox(height: 8.w),
                            Text(
                              data.author!,
                              style: AppTextStyles.text14Bold
                                  .copyWith(color: AppColors.whiteColor),
                            ),
                            SizedBox(height: 14.w),
                            Text(
                              "Size",
                              style: AppTextStyles.text12
                                  .copyWith(color: AppColors.whiteColor),
                            ),
                            SizedBox(height: 8.w),
                            Text(
                              "${data.width}x${data.height} px",
                              style: AppTextStyles.text14Bold
                                  .copyWith(color: AppColors.whiteColor),
                            ),
                            SizedBox(height: 14.w),
                            Text(
                              "Description",
                              style: AppTextStyles.text12
                                  .copyWith(color: AppColors.whiteColor),
                            ),
                            SizedBox(height: 8.w),
                            Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                              style: AppTextStyles.text14Bold
                                  .copyWith(color: AppColors.whiteColor),
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      useSafeArea: false,
    );
  }
}
