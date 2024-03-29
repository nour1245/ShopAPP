import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/home_model.dart';
import 'package:shop_app/shared/components/components.dart';

import '../../cubit/shopcubit/shopcubit_cubit.dart';
import '../../cubit/shopcubit/shopcubit_state.dart';

class DetailsScreen extends StatefulWidget {
  final Products model;
  const DetailsScreen({super.key, required this.model});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int selectedImageIndex = 0;
  double scale = 1.0;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopcubitStates>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 249, 249, 249),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 250,
                width: double.infinity,
                child: PageView.builder(
                  itemCount: widget.model.images!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => Dialog(
                            child: CachedNetworkImage(
                              imageUrl: widget.model.images![index],
                              fit: BoxFit.contain,
                            ),
                          ),
                        );
                      },
                      onScaleUpdate: (ScaleUpdateDetails details) {
                        setState(() {
                          scale = details.scale;
                        });
                      },
                      onScaleEnd: (_) {
                        setState(() {
                          scale = 1.0;
                        });
                      },
                      child: Transform.scale(
                        scale: scale,
                        child: CachedNetworkImage(
                          imageUrl: widget.model.images![index],
                          fit: BoxFit.contain,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  '${widget.model.name}',
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        '${widget.model.price} EGP',
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    if (widget.model.price != widget.model.oldPrice)
                      Text(
                        '${widget.model.oldPrice} EGP',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.lineThrough,
                        ),
                      )
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Description',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${widget.model.description}',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(225, 239, 54, 81),
          child: const Icon(Icons.add_shopping_cart),
          onPressed: () {
            ShopCubit.get(context).addToCart(widget.model.id);
            showToast(
                msg: '${ShopCubit.get(context).cartmodel!.message}',
                color: Colors.green);
          },
        ),
      ),
    );
  }
}
