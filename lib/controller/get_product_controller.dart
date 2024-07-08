// import 'package:dio/dio.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:simple_shop_app2/controller/repository/get_product_repo.dart';

// class GetProductsNotifier extends AsyncNotifier<AsyncValue> {
//   late GetProductsRepoImpl getProductsRepoImpl;
//   @override
//   FutureOr<AsyncValue> build() {
//     getProductsRepoImpl = ref.watch(getProductsRepoProvider);
//     return const AsyncLoading();
//   }

//   void getProducts() async{
//     state = const AsyncLoading();
//     try {
//       var res = await getProductsRepoImpl.getProducts(
//           apiKey: '772c265692864543b5945af1b15c793920240707003444771199',
//           appId: 'JJNKSU9WM2EWG54',
//           organisationId: '0d01c17fe70640c19527531a64f28d7d');
      
//     }on DioException catch (e) {
//       return
//     }
//   }
// }
