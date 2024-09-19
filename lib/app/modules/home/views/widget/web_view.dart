import 'package:flutter/material.dart';
import 'package:gapopa_gallary_app/app/modules/home/controllers/home_controller.dart';
import 'package:gapopa_gallary_app/app/widgets/loading_widget.dart';
import 'package:get/get.dart';
import '../../../../widgets/full_screen_images';

class WebView extends StatelessWidget {
  WebView({super.key});
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return 
       Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value && controller.images.isEmpty) {
                  return CPI();
                }
                return GridView.builder(
                  padding: const EdgeInsets.only(left: 32, right:32),
                  shrinkWrap: true,
                  controller: controller.scrollController,
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: (MediaQuery.of(context).size.width ~/ 300),
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: controller.images.length,
                  itemBuilder: (context, index) {
                    var image = controller.images[index];
                    return GestureDetector(
                      onTap: () => Get.to(() => ImageViewer(
                          src: image['largeImageURL'], title: image['tags'])),
                      child: GridTile(
                        footer: GridTileBar(
                          backgroundColor: Colors.black54,
                          title: Text("${image['likes']} Likes"),
                          subtitle: Text("${image['views']} Views"),
                          trailing: Text("${image['']}"),
                        ),
                        child: Hero(
                          tag: image['largeImageURL'],
                          child: Image.network(
                            image['previewURL'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
            Obx(() => controller.isLoading.value
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CPI(),
                  )
                : const SizedBox()),
      
          ],
        ),
      
    );
  }
}
