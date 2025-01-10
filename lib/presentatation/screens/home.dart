// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_liked/commons/utils/app_images.dart';
import 'package:flutter_application_liked/logic/change_screen_provider.dart';
import 'package:flutter_application_liked/model/datajson.dart';
import 'package:flutter_application_liked/model/product_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ChangeScreenProvider>().getProduct();
    return Consumer<ChangeScreenProvider>(
      builder: (context, foodProvider, child) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: Icon(Icons.back_hand),
          title: Text("Best seller"),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
          ],
        ),
        body:foodProvider.products.isNotEmpty?  Column(
          children: [
            Text("Discover our most popular dishes!"),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                  itemCount: 10,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.h,
                      mainAxisSpacing: 10.w),
                  itemBuilder: (context, index) {
                    return CustomCard(
                      imagePath: AppImages.rasm1Png,
                      info: foodProvider.products[index].description.toString(),
                      title: foodProvider.products[index].name.toString(),
                    );
                  },
                ),
              ),
            )
          ],
        ):Center(child: Text("No products found"),)
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String info;
  const CustomCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment
        .start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
            ),
            child: Stack(
              children:[

              ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
                            ),
              ],
            ),
          ),
          Text(
            title,
          ),
          Text(info),
        ],
      ),
    );
  }
}
