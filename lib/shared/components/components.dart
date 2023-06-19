import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/cubit/shopcubit/shopcubit_cubit.dart';

Widget DefultButtn({
  var height = 50.0,
  var color = Colors.green,
  var width = double.infinity,
  required String text,
  required Function function,
  var fontweight = FontWeight.bold,
  bool isUperCase = true,
}) =>
    Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Text(
          isUperCase ? text.toUpperCase() : text,
          style: TextStyle(
            fontWeight: fontweight,
          ),
        ),
      ),
    );

Widget DefultTFF({
  required TextEditingController controrller,
  required String label,
  required IconData prefix,
  required TextInputType keyboardtype,
  required Function validate,
  bool isPassword = false,
  IconData? suffix,
  Function? ontap,
  Function? onchange,
  Function? onfield,
  Function? onsubmit,
  Function? suffixpresed,
  isclickable = true,
  var style,
}) =>
    TextFormField(
      style: style,
      enabled: isclickable,
      onChanged: onchange != null
          ? (value) {
              onchange(value);
            }
          : null,
      onTap: ontap != null
          ? () {
              ontap();
            }
          : null,
      onFieldSubmitted: onsubmit != null ? (value) => onsubmit() : null,
      obscureText: isPassword,
      controller: controrller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                icon: Icon(suffix),
                onPressed: () {
                  suffixpresed!();
                },
              )
            : null,
      ),
      keyboardType: keyboardtype,
      validator: (value) {
        return validate(value);
      },
    );

void navigatTO(context, Widget) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Widget,
    ),
  );
}

void navigatAndReplace(context, Widget) {
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => Widget,
      ),
      (route) => false);
}

void showToast({
  required msg,
  required color,
}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0);
}

Widget buildListItem(model, context, {bool isOldPrice = true}) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: 120,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 120,
              height: 120,
              child: Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(
                      '${model.image}',
                    ),
                    width: 120,
                    height: 120,
                  ),
                  model.discount != 0 && isOldPrice
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
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${model.name}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  Expanded(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 90,
                            child: Text(
                              '${model.price}',
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.blue,
                              ),
                              maxLines: 1,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          model.discount != 0 && isOldPrice
                              ? SizedBox(
                                  width: 90,
                                  child: Text(
                                    '${model.oldPrice}',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      decoration: TextDecoration.lineThrough,
                                    ),
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
                                ShopCubit.get(context)
                                    .ChangeFavorites(model.id);
                              },
                              icon: const Icon(
                                Icons.favorite_border_outlined,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
