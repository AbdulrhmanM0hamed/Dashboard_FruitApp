import 'package:dashboard/features/add_product/presentation/view/widgets/add_product_view_body.dart';
import 'package:flutter/material.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const String routeName = 'add-product';


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Add  Product"),
        centerTitle: true,
      ),
      body: AddProductViewBody(),
    );
  }
}