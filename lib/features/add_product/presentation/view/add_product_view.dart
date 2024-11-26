import 'package:dashboard/core/services/service_locator.dart';
import 'package:dashboard/core/utils/common/cusom_progress_hud.dart';
import 'package:dashboard/core/utils/constants/colors.dart';
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
        body: AddProductViewBodyBlocConsumer(),
      ),
    );
  }
}

class AddProductViewBodyBlocConsumer extends StatelessWidget {
  const AddProductViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: TColors.success,
              content: Text("Product added successfully"),
            ),
          );
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
            inLoading: state is AddProductLoading, child: AddProductViewBody());
      },
    );
  }
}
