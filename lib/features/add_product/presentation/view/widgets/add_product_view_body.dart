import 'dart:io';
import 'package:dashboard/core/utils/common/custom_text_form_field.dart';
import 'package:dashboard/core/utils/common/elvated_button.dart';
import 'package:dashboard/core/utils/constants/colors.dart';
import 'package:dashboard/core/utils/constants/font_manger.dart';
import 'package:dashboard/core/utils/constants/styles_manger.dart';
import 'package:dashboard/features/add_product/domain/entities/add_product_entity.dart';
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
  late num price;
  File? imageFile;
  bool isFeatured = false;

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
              CustomTextFormField(
                onSaved: (value) {
                  productName = value!;
                },
                hintText: 'Product Name',
                suffixIcon: Icon(Icons.abc),
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 16),
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
              CustomTextFormField(
                onSaved: (value) {
                  code = value!.toLowerCase();
                },
                hintText: 'Product Code',
                suffixIcon: Icon(Icons.numbers),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  description = value!;
                },
                hintText: 'Product Description',
                suffixIcon: Icon(Icons.description),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 16),
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
                        fontFamily: FontConstant.cairo, fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ImagePickWidget(
                onFileChanged: (image) {
                  imageFile = image; // No change needed
                },
              ),
              const SizedBox(height: 16),
              CustomElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (imageFile != null) {

                      AddProductEntity addProductEntity = AddProductEntity(
                        productName: productName,
                        code: code,
                        description: description,
                        price: price,
                        imageFile: imageFile!,
                        isFeatured: isFeatured,
                      );
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
