import 'package:dashboard/features/add_product/presentation/view/add_product_view.dart';
import 'package:dashboard/features/dashboard/presentation/view/dashboard.dart';

import 'package:flutter/material.dart';

Route<dynamic> onGenratedRoutes(RouteSettings settings) 
{

  switch (settings.name) {
 
    case DashboardView.routeName:
    return MaterialPageRoute(
      builder: (context) => const DashboardView(),
    );
    case AddProductView.routeName:
    return MaterialPageRoute(
      builder: (context) => const AddProductView(),
    );
     
    default:
    return MaterialPageRoute(
      builder: (context) => const Scaffold(),
    );


  
  }
}