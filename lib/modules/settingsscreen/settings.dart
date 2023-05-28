import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/shopcubit/shopcubit_cubit.dart';
import 'package:shop_app/cubit/shopcubit/shopcubit_state.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/components/constants.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var namecontroller = TextEditingController();
    var emailcontroller = TextEditingController();
    var phonecontroller = TextEditingController();
    var formkey3 = GlobalKey<FormState>();
    return BlocConsumer<ShopCubit, ShopcubitStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = ShopCubit.get(context).usermodel;
        namecontroller.text = model!.data!.name!;
        emailcontroller.text = model.data!.email!;
        phonecontroller.text = model.data!.phone!;

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formkey3,
              child: Column(
                children: [
                  state is LoadingUserDataUpdate
                      ? const LinearProgressIndicator()
                      : const Text(''),
                  CircleAvatar(
                    radius: 55,
                    child: CachedNetworkImage(
                      imageUrl: ('${model.data?.image}'),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DefultTFF(
                    controrller: namecontroller,
                    label: 'Name',
                    prefix: Icons.person,
                    keyboardtype: TextInputType.text,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'name cant be empty';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DefultTFF(
                    controrller: emailcontroller,
                    label: 'Email',
                    prefix: Icons.email,
                    keyboardtype: TextInputType.emailAddress,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'email cant be empty';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DefultTFF(
                    controrller: phonecontroller,
                    label: 'phone',
                    prefix: Icons.phone_outlined,
                    keyboardtype: TextInputType.number,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'phone cant be empty';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DefultButtn(
                    function: () {
                      signOut(context);
                    },
                    text: 'LOG OUT',
                  ),
                  const SizedBox(height: 12),
                  DefultButtn(
                      text: 'UPDATE',
                      function: () {
                        if (formkey3.currentState!.validate()) {
                          ShopCubit.get(context).updateUserData(
                            name: namecontroller.text,
                            email: emailcontroller.text,
                            phone: phonecontroller.text,
                          );
                        }
                      }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
