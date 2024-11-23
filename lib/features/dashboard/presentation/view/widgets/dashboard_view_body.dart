import 'package:dashboard/core/utils/common/custom_text_form_field.dart';
import 'package:dashboard/core/utils/common/elvated_button.dart';
import 'package:dashboard/features/add_product/presentation/view/add_product_view.dart';
import 'package:flutter/material.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          CustomElevatedButton(onPressed: () {  
            Navigator.pushNamed(context, AddProductView.routeName);
          }, buttonText: 'اضافة منتج'),
        ],
      ),
    );
  }
}