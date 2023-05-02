import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shop_app/cubit/shopcubit/shopcubit_cubit.dart';
import 'package:shop_app/cubit/shopcubit/shopcubit_state.dart';
import 'package:shop_app/modules/categoriesssreen/categoriess_d.dart';
import 'package:shop_app/modules/product_details/product_details_screen.dart';

import 'package:shop_app/shared/components/components.dart';

import '../../models/cat_model.dart';
import '../../models/home_model.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopcubitStates>(
      listener: (context, state) {
        if (state is LoadSuccessFavoritesState) {
          if (!state.model!.status!) {
            showToast(
              msg: state.model!.message,
              color: Colors.red,
            );
          } else {
            showToast(msg: state.model!.message, color: Colors.green);
          }
        }
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: ShopCubit.get(context).homeModel != null &&
              ShopCubit.get(context).categegoryModel != null,
          builder: (context) => HomeBuilder(ShopCubit.get(context).homeModel,
              ShopCubit.get(context).categegoryModel, context),
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget HomeBuilder(HomeModel? model, CategoriesModel? c_model, context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
            items: model?.data?.banners!
                .map(
                  (e) => CachedNetworkImage(
                    imageUrl: ('${e.image}'),
                    width: double.infinity,
                    fit: BoxFit.cover,
                    useOldImageOnUrlChange: true,
                  ),
                )
                .toList(),
            options: CarouselOptions(
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(
                seconds: 3,
              ),
              autoPlayAnimationDuration: const Duration(seconds: 1),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
              viewportFraction: 1.0,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Categories',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: 120,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: c_model!.data!.data!.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 4,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return bulidCatItem(c_model.data!.data![index], context);
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'New Products',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            color: Colors.grey,
            child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                childAspectRatio: 1 / 1.57,
                children: List.generate(
                    model!.data!.products.length,
                    (index) =>
                        GridViewItem(model.data!.products[index], context))),
          ),
        ],
      ),
    );
  }

  Widget GridViewItem(Products model, context) => InkWell(
        onTap: () => navigatTO(context, DetailsScreen(model: model)),
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  CachedNetworkImage(
                    imageUrl: (model.image!),
                    width: double.infinity,
                    height: 200,
                  ),
                  model.discount != 0
                      ? Container(
                          color: Colors.red,
                          child: const Text(
                            'DISCOUNT',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      : const Text(''),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.name!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          model.price!.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        model.discount != 0
                            ? Text(
                                model.oldPrice!.toString(),
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              )
                            : const Text(''),
                        const Spacer(),
                        CircleAvatar(
                          backgroundColor:
                              ShopCubit.get(context).favorites[model.id]!
                                  ? Colors.blue
                                  : Colors.grey,
                          child: IconButton(
                            onPressed: () {
                              ShopCubit.get(context).ChangeFavorites(model.id);
                              print(ShopCubit.get(context).favorites);
                            },
                            icon: const Icon(
                              Icons.favorite_border_outlined,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget bulidCatItem(DataModel? model, context) => InkWell(
        onTap: () {
          navigatTO(context, CatD(id: model!.id));
        },
        child: Container(
          width: 90,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                backgroundColor: Colors.black.withOpacity(0.1),
                radius: 40,
                child: CachedNetworkImage(
                  imageUrl: ('${model?.image}'),
                ),
              ),
              Text(
                textAlign: TextAlign.center,
                '${model?.name}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      );
}
