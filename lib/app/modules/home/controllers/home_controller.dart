import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class HomeController extends GetxController {
 var images = [].obs;
  var isLoading = false.obs;
  var searchQuery = ''.obs;
  final RxString totlaPhotos = ''.obs;
  final RxString totalHits = ''.obs;


  int page = 1;
  ScrollController scrollController = ScrollController();
  
  @override
  void onInit() {
    super.onInit();
    fetchImages();
    debounce(searchQuery, (_) => fetchImages(reset: true), time: const Duration(milliseconds: 800));

    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent && !isLoading.value) {
        fetchImages();
      }
    });
  }

  Future<void> fetchImages({bool reset = false}) async {
    if (reset) {
      page = 1;
      images.clear();
    }

    isLoading(true);
    var apiKey = 'add here your api key';
    var url = Uri.parse('https://pixabay.com/api/?key=$apiKey&q=${searchQuery.value}&image_type=photo&page=$page');
    
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
      totlaPhotos.value = data['total'].toString();
    totalHits.value = data['totalHits'].toString();
        images.addAll(data['hits']);
        page++;
      }
    } finally {
      isLoading(false);
    }
  }











  
}
