import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/shopcubit/shopcubit_cubit.dart';
import 'package:shop_app/cubit/shopcubit/shopcubit_state.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/network/remote/paypal.dart';
import '../../models/get_cart.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopcubitStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is! GetCartLoaded,
          builder: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
          fallback: (context) => ConditionalBuilder(
            condition:
                ShopCubit.get(context).getcartmodel!.data!.cartItems!.isEmpty,
            builder: (context) =>
                const Center(child: Text('You dont have any items yet')),
            fallback: (context) => Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemCount: ShopCubit.get(context)
                        .getcartmodel!
                        .data!
                        .cartItems!
                        .length,
                    separatorBuilder: (BuildContext context, int index) {
                      return Container(
                        color: Colors.grey,
                        height: 1,
                        width: double.infinity,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return buildlistItem(
                          ShopCubit.get(context).getcartmodel!.data!.cartItems!,
                          context,
                          index);
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Total: ${ShopCubit.get(context).getcartmodel!.data!.total}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.08,
                    color: Colors.green,
                    child: MaterialButton(
                      onPressed: () {
                        navigatTO(context, CheckoutPage());
                      },
                      child: const Text(
                        'Check out',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildlistItem(List<CartItems> model, context, index) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CachedNetworkImage(
              width: 70,
              height: 70,
              fit: BoxFit.cover,
              imageUrl: ('${model[index].product!.image}'),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '${model[index].product!.name}',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FittedBox(
                          child: Text(
                            'quantity : ${model[index].quantity}',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        FittedBox(
                          child: Text(
                            'price : ${model[index].product!.price}',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        ShopCubit.get(context)
                            .addToCart(model[index].product!.id);
                        ShopCubit.get(context).getcart();
                      },
                      icon: const Icon(Icons.delete))
                ],
              ),
            ),
          ],
        ),
      );
}
