
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/searchcubit/search_cubit.dart';
import 'package:shop_app/cubit/searchcubit/search_state.dart';
import 'package:shop_app/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  var searchController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DefultTFF(
                        controrller: searchController,
                        label: 'search',
                        prefix: Icons.search,
                        keyboardtype: TextInputType.text,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'cant be empty';
                          }
                        },
                        onchange: (value) {
                          SearchCubit.get(context).searchData(text: value);
                        }),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  if (state is LoadingSearchState) const LinearProgressIndicator(),
                  if (state is SearchLoadState)
                    Expanded(
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemCount: SearchCubit.get(context).model!.data!.total!,
                        separatorBuilder: (BuildContext context, int index) {
                          return Container(
                            color: Colors.grey,
                            height: 1,
                            width: double.infinity,
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return buildListItem(
                              isOldPrice: false,
                              SearchCubit.get(context)
                                  .model!
                                  .data!
                                  .data?[index],
                              context);
                        },
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
