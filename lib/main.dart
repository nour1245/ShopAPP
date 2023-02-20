import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/blocobserver.dart';
import 'package:shop_app/cubit/shopcubit/shopcubit_cubit.dart';
import 'package:shop_app/layout/shoplayout.dart';
import 'package:shop_app/modules/loginscreen/loginscreen.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/network/local/cash_helper.dart';
import 'package:shop_app/shared/network/remote/diohelper.dart';
import 'package:shop_app/shared/styels/theme.dart';
import 'modules/onbordingscreen/onboardscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  token = CacheHelper.getData(key: 'token');
  Widget widget;
  if (onBoarding != null) {
    if (token != null) {
      widget = ShopLayout();
    } else {
      widget = LoginScreen();
    }
  } else {
    widget = OnboardScreen();
  }

  runApp(MyApp(
    startwidget: widget,
  ));
}

class MyApp extends StatefulWidget {
  final Widget startwidget;

  const MyApp({super.key, required this.startwidget});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ShopCubit()
            ..getHomeData()
            ..getCategories()
            ..getUserFavorites()
            ..getUserData(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        home: widget.startwidget,
      ),
    );
  }
}
