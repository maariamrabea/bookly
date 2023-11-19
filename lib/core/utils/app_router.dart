import 'package:booklyapp/core/utils/service_locator.dart';
import 'package:booklyapp/feature/home/data/models/book_model/book_model.dart';
import 'package:booklyapp/feature/home/data/repos/Home_repo_imple.dart';
import 'package:booklyapp/feature/home/presentation/manger/smila_book_cubit/similar_book_cubit.dart';
import 'package:booklyapp/feature/search/presentation/views/search_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../feature/Splash/presentation/views/SplashView.dart';
import '../../feature/home/presentation/views/BookDetailsview.dart';
import '../../feature/home/presentation/views/home View.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(routes: <RouteBase>[
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        }),
    GoRoute(
        path: '/homeView',
        builder: (BuildContext context, GoRouterState state) {
          return const Homeview();
        }),
    GoRoute(
        path: '/BookDetailsView',
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
              create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
              child: BookDetailsView(
                bookModel: state.extra as BookModel,
              ));
        }),
    GoRoute(
        path: '/SearchView',
        builder: (BuildContext context, GoRouterState state) {
          return const SearchView();
        }),
  ]);
}
