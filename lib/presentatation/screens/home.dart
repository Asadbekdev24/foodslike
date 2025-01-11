// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:flutter_application_liked/commons/utils/app_images.dart';
import 'package:flutter_application_liked/logic/change_screen_provider.dart';
import 'package:flutter_application_liked/model/datajson.dart';
import 'package:flutter_application_liked/model/product_model.dart';
import 'package:flutter_application_liked/presentatation/screens/home2.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ChangeScreenProvider>().getProduct();
    return Consumer<ChangeScreenProvider>(
      builder: (context, foodProvider, child) => Scaffold(
          backgroundColor: Color(0xffF5CB58),
          // appBar: AppBar(
          //   centerTitle: true,
          //   leading: Icon(Icons.arrow_back),
          //   title: Text("Best seller"),
          //   actions: [
          //     IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
          //   ],
          // ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 100.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xffF5CB58),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 36, right: 36),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.arrow_back,
                              color: Color(0xffE95322),
                            ),
                            Text(
                              "Best Seller",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 28.sp),
                            ),
                            IconButton(
                                onPressed: () {
                                  foodProvider.toggleLike();
                                  if (foodProvider.isLiked) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              TanlanganFoodItemlar(
                                            selectedItems:
                                                foodProvider.tanlangan,
                                          ),
                                        ));
                                  }
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xffF8F8F8),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24.r),
                          topRight: Radius.circular(24.r))),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 34.h,
                      ),
                      Text(
                        "Discover our most popular dishes!",
                        style: TextStyle(
                            color: Color(0xffE95322), fontSize: 20.sp),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 35, left: 35, top: 24),
                          child: GridView.builder(
                            itemCount: 10,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisExtent: 280.h,
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10.w,
                                    mainAxisSpacing: 24.h),
                            itemBuilder: (context, index) {
                              return CustomCard(
                                itemIndex: index,
                                imagePath: AppImages.rasm1Png,
                                info: foodProvider.products[index].description
                                    .toString(),
                                title: foodProvider.products[index].name
                                    .toString(),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

class CustomCard extends StatelessWidget {

  final String imagePath;
  final String title;
  final String info;
  final int itemIndex;
  const CustomCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.info,
    required this.itemIndex,
  });

  @override
  Widget build(BuildContext context) {

    //context.read<ChangeScreenProvider>().getProduct();
    return Expanded(
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 158.h,
                width: 141.w,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                ),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: Stack(
                      children: [
                        Image.asset(AppImages.rasm1Png),
                        Positioned(
                            left: 8,
                            top: 8,
                            child: Container(
                              height: 40.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle),
                              child: SvgPicture.asset(
                                AppImages.botSvg,
                                fit: BoxFit.cover,
                              ),
                            )),
                        Positioned(
                            right: 8,
                            top: 3,
                            child: Center(
                              child: Container(
                                //alignment: Alignment.center,
                                // height: 30.h,
                                width: 40.w,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                child: Consumer<ChangeScreenProvider>(
                                  builder: (context, provider, child) => IconButton(
                                      onPressed: () {
                                        provider.itemLike(itemIndex);

                                        // provider.itemLike();
                                        // if (provider.itemLiked) {
                                        //   provider.tanlanganFoodlar(
                                        //       provider.products[itemIndex]);
                                        // } else {
                                        //   provider.ochirilganFoodItem(
                                        //       provider.products[itemIndex]);
                                        // }

                                        if(provider.products[itemIndex].isFavorite)
                                        {
                                           provider.tanlanganFoodlar(provider.products[itemIndex]);
                                        } else
                                        {
                                           provider.ochirilganFoodItem(
                                           provider.products[itemIndex]);
                                        }


                                      },
                                      icon: Icon(
                                        provider.products[itemIndex].isFavorite
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: provider.products[itemIndex].isFavorite
                                            ? Colors.red
                                            : Colors.grey,

                                      )),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 14.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              info,
              style: TextStyle(fontSize: 12.sp),
            ),
          ],
        ),
      ),
    );
  }
}
