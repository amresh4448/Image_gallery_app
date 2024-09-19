import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/img/local_images.dart';
import '../../../widgets/custome_search_text_filed.dart';
import '../controllers/home_controller.dart';
import 'widget/phone_view.dart';
import 'widget/web_view.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
  final Width = MediaQuery.of(context).devicePixelRatio;
    return Scaffold(

appBar: AppBar(
toolbarHeight: 300,
  flexibleSpace:   SizedBox(
            width: double.infinity,
            child: Image.asset(
              LocalImages.roadImg, 
              fit: BoxFit.cover,
            ),
          ),
    title:  Column(
    children: [

  Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center, // Ensure text alignment
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Stunning royalty-free images & royalty-free stock",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Over 5 million+ high-quality stock images, videos, and music shared by our talented community. ${controller.totlaPhotos.value}",
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.amber
                  ),
                 child: Obx(() => 
                  
                Text(
                    "Total Photos ${controller.totlaPhotos.value} & Total Hits ${controller.totalHits.value}",
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                 ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage(LocalImages.logo),
                        backgroundColor: Colors.deepOrange,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CustomTextFormField(
                          borderRadius: BorderRadius.circular(30),
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.search, size: 30),
                          ),
                          onChanged: (value) =>
                              controller.searchQuery.value = value,
                          hintText: 'Search...',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      
    ],
  ),
),
body: 

        LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              return  WebView(); 
            } else {
              return  PhoneView();
            }
          },
        ),
 

    );
  }
}






