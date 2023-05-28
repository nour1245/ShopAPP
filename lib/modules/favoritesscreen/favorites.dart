import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/shopcubit/shopcubit_cubit.dart';
import 'package:shop_app/cubit/shopcubit/shopcubit_state.dart';
import 'package:shop_app/shared/components/components.dart';

class FavouritsScreen extends StatelessWidget {
  const FavouritsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopcubitStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
            condition: state is! LoadUserFavoritesState,
            builder: (BuildContext context) {
              return ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: ShopCubit.get(context)
                    .userfavoritesmodel!
                    .data!
                    .data!
                    .length,
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    color: Colors.grey,
                    height: 1,
                    width: double.infinity,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return buildListItem(
                      ShopCubit.get(context)
                          .userfavoritesmodel!
                          .data!
                          .data![index]
                          .product,
                      context);
                },
              );
            },
            fallback: (BuildContext context) {
              return const Center(child: CircularProgressIndicator());
            });
      },
    );
  }
}
