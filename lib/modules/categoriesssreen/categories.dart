import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/shopcubit/shopcubit_cubit.dart';
import 'package:shop_app/cubit/shopcubit/shopcubit_state.dart';
import 'package:shop_app/models/shop_models.dart';
import 'package:shop_app/models/shop_models.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopcubitStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ListView.separated(
          scrollDirection: Axis.vertical,
          itemCount: ShopCubit.get(context).categegoryModel!.data!.data!.length,
          separatorBuilder: (BuildContext context, int index) {
            return Container(
              color: Colors.grey,
              height: 1,
              width: double.infinity,
            );
          },
          itemBuilder: (BuildContext context, int index) {
            return buildlistItem(
                ShopCubit.get(context).categegoryModel!.data!.data![index]);
          },
        );
      },
    );
  }

  Widget buildlistItem(DataModel model) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CachedNetworkImage(
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              imageUrl: ('${model.image}'),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              '${model.name}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward,
            ),
          ],
        ),
      );
}
