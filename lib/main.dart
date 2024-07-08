import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:simple_shop_app2/controller/bloc/bloc_observer.dart';
import 'package:simple_shop_app2/controller/repository/get_product_repo.dart';

import 'controller/bloc/products_bloc.dart';
import 'view/pages/product_page.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  Bloc.observer = const GetProductsBlocObserver();
  runApp(RepositoryProvider(
    create: (context) => GetProductsRepoImpl(),
    child: BlocProvider(
      create: (context) => ProductsBloc(
        getProductsRepoImpl: RepositoryProvider.of(context),
      ),
      child: const MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Products'),
          backgroundColor: Colors.purpleAccent.shade100,
          centerTitle: true,
        ),
        body: const ProductPage(),
      ),
    );
  }
}
