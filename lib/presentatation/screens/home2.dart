import 'package:flutter/material.dart';
import 'package:flutter_application_liked/commons/utils/app_images.dart';
import 'package:flutter_application_liked/logic/change_screen_provider.dart';
import 'package:flutter_application_liked/model/product_model.dart';
import 'package:flutter_application_liked/presentatation/screens/home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class TanlanganFoodItemlar extends StatelessWidget{

  final List<ProductModel> selectedItems;

  const TanlanganFoodItemlar({super.key,
  required this.selectedItems});
  @override
  Widget build(BuildContext context)
  {
    return Consumer<ChangeScreenProvider>(
      builder: (context, foodProvider, child) =>  Scaffold(
       body: Column(
         children: [

           Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 35, left: 35, top: 24),
                                child: GridView.builder(
                                  itemCount: selectedItems.length,
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
                                      info: selectedItems[index].description
                                          .toString(),
                                      title: selectedItems[index].name
                                          .toString(),
                                    );
                                  },
                                ),
                              ),
                            ),
         ],
       ),

      ),
    );
  }
}