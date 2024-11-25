import 'package:dashboard/core/services/service_locator.dart';
import 'package:dashboard/features/add_product/presentation/controller/cubit/add_product_cubit.dart';
import 'package:dashboard/features/add_product/presentation/view/widgets/add_product_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const String routeName = 'add-product';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductCubit(sl(), sl()),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add  Product"),
          centerTitle: true,
        ),
        body: AddProductViewBody(),
      ),
    );
  }
}
