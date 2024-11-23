import 'package:dashboard/features/dashboard/presentation/view/dashboard.dart';

import 'package:flutter/material.dart';

Route<dynamic> onGenratedRoutes(RouteSettings settings) 
{

  switch (settings.name) {
 
    case DashboardView.routeName:
    return MaterialPageRoute(
      builder: (context) => const DashboardView(),
    );
     
    default:
    return MaterialPageRoute(
      builder: (context) => const Scaffold(),
    );


  
  }
}