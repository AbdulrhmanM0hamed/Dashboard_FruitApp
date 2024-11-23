import 'package:dashboard/core/utils/common/custom_text_form_field.dart';
import 'package:dashboard/features/add_product/presentation/view/widgets/image_pik_widget.dart';
import 'package:flutter/material.dart';


class AddProductViewBody extends StatelessWidget {
  AddProductViewBody({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        autovalidateMode: _autoValidateMode,
        child:const Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
               CustomTextFormField(
                hintText: 'Product Name',
                suffixIcon: Icon(Icons.abc),
                keyboardType: TextInputType.name,
              ),
               SizedBox(height: 20),
               CustomTextFormField(
                hintText: 'Price',
                suffixIcon: Icon(Icons.price_change_outlined),
                keyboardType: TextInputType.number,
              ),
               SizedBox(height: 20),
               CustomTextFormField(
                hintText: 'Product Code',
                suffixIcon: Icon(Icons.numbers),
                keyboardType: TextInputType.number,
              ),
               SizedBox(height: 20),
               CustomTextFormField(
                hintText: 'Product Description',
                suffixIcon: Icon(Icons.description),
                keyboardType: TextInputType.text,
              ),
               SizedBox(height: 20),
              ImagePickWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

