import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/shopcubit/shopcubit_cubit.dart';
import '../../cubit/shopcubit/shopcubit_state.dart';
import '../../shared/components/components.dart';

class CatD extends StatefulWidget {
  CatD({super.key, this.id});
  final id;

  @override
  State<CatD> createState() => _CatDState();
}

class _CatDState extends State<CatD> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ShopCubit>(context).getCategoriesD(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<ShopCubit, ShopcubitStates>(
        listener: (context, state) {},
        builder: (context, state) => ConditionalBuilder(
            condition: state is LoadSuccessCategoriesDState,
            builder: (BuildContext context) {
              return ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount:
                    ShopCubit.get(context).categegoryDModel!.data!.data!.length,
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
                          .categegoryDModel!
                          .data!
                          .data![index],
                      context);
                },
              );
            },
            fallback: (BuildContext context) {
              return const Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
