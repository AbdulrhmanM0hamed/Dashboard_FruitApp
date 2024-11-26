import 'dart:io';
import 'package:dashboard/core/utils/common/custom_text_form_field.dart';
import 'package:dashboard/core/utils/common/elvated_button.dart';
import 'package:dashboard/core/utils/constants/colors.dart';
import 'package:dashboard/core/utils/constants/font_manger.dart';
import 'package:dashboard/core/utils/constants/styles_manger.dart';
import 'package:dashboard/features/add_product/domain/entities/add_product_entity.dart';
import 'package:dashboard/features/add_product/domain/entities/review_entity.dart';
import 'package:dashboard/features/add_product/presentation/controller/cubit/add_product_cubit.dart';
import 'package:dashboard/features/add_product/presentation/view/widgets/custom_check_box.dart';
import 'package:dashboard/features/add_product/presentation/view/widgets/image_pik_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductViewBody extends StatelessWidget {
  AddProductViewBody({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  late String productName, code, description;
  late num price   ;
  late int expiration , numberOfCalories , unitAmount ;  

  File? imageFile;
  bool isFeatured = false;
  bool isOrganic = false; // إضافة متغير لـ isOrganic

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        autovalidateMode: _autoValidateMode,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              // حقل اسم المنتج
              CustomTextFormField(
                onSaved: (value) {
                  productName = value!;
                },
                hintText: 'Product Name',
                suffixIcon: Icon(Icons.abc),
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 16),

              // حقل السعر
              CustomTextFormField(
                onSaved: (value) {
                  if (value != null && value.isNotEmpty) {
                    try {
                      price = num.parse(value);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: TColors.error,
                        content: Text('Please fill product price '),
                      ));
                    }
                  }
                },
                hintText: 'Price',
                suffixIcon: Icon(Icons.price_change_outlined),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),

              // حقل رمز المنتج
              CustomTextFormField(
                onSaved: (value) {
                  code = value!.toLowerCase();
                },
                hintText: 'Product Code',
                suffixIcon: Icon(Icons.numbers),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),

              // حقل وصف المنتج
              CustomTextFormField(
                onSaved: (value) {
                  description = value!;
                },
                hintText: 'Product Description',
                suffixIcon: Icon(Icons.description),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 16),

              // حقل تاريخ انتهاء الصلاحية
              CustomTextFormField(
                onSaved: (value) {
                  expiration = int.parse(value!); // تأكد من تحويله إلى Int
                },
                hintText: 'Expiration (Days)',
                suffixIcon: Icon(Icons.calendar_today),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),

              // حقل عدد السعرات الحرارية
              CustomTextFormField(
                onSaved: (value) {
                  numberOfCalories = int.parse(value!);
                },
                hintText: 'Number of Calories',
                suffixIcon: Icon(Icons.local_dining),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),

              // حقل مقدار الوحدة
              CustomTextFormField(
                onSaved: (value) {
                  unitAmount = int.parse(value!); // تأكد من تحويله إلى Int
                },
                hintText: 'Unit Amount',
                suffixIcon: Icon(Icons.format_list_numbered),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),

              // مربع اختيار المنتج المميز
              Row(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: CustomCheckBox(
                      onChanged: (value) {
                        isFeatured = value;
                      },
                    ),
                  ),
                  Text(
                    "Is Featured item? ",
                    style: getRegularStyle(
                      fontFamily: FontConstant.cairo,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              Row(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: CustomCheckBox(
                      onChanged: (value) {
                        isOrganic = value; // تعيين القيمة
                      },
                    ),
                  ),
                  Text(
                    "Is Organic item? ",
                    style: getRegularStyle(
                      fontFamily: FontConstant.cairo,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // حقل اختيار الصورة
              ImagePickWidget(
                onFileChanged: (image) {
                  imageFile = image; // تعيين الصورة
                },
              ),
              const SizedBox(height: 16),

              // زر إضافة المنتج
              CustomElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (imageFile != null) {
                      AddProductEntity addProductEntity = AddProductEntity(
                        reviews: [
                          ReviewEntity(
                            comment:"is good product",
                            date: DateTime.now().toIso8601String(),
                            ratting: 5,
                            image: "https://images.unsplash.com/photo-1521185496955-15097b20c5fe?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2F0fGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60",
                            name: "Ahmed",
                          ),
                           ReviewEntity(
                            comment:"is good product",
                            date: DateTime.now().toIso8601String(),
                            ratting: 5,
                            image: "https://images.unsplash.com/photo-1521185496955-15097b20c5fe?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2F0fGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60",
                            name: "Ahmed",
                          ),
                        ],
                        productName: productName,
                        code: code,
                        description: description,
                        price: price,
                        imageFile: imageFile!,
                        isFeatured: isFeatured,
                        expirtion: expiration,
                        numberOfCalories: numberOfCalories,
                        unitAmount: unitAmount,
                        isOrganic: isOrganic,
                      );

                      // إضافة المنتج إلى Cubit
                      context.read<AddProductCubit>().addProduct(addProductEntity);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please select an image'),
                        ),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: TColors.error,
                        content: Text('Please fill all fields correctly'),
                      ),
                    );
                  }
                },
                buttonText: 'Add Product',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
