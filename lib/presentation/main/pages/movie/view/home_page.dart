
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../app/dependency_injection.dart';
import '../../../../../domin/model/model.dart';
import '../../../../common/state_renderer/state_renderer_impl.dart';
import '../../../../resources/colors_manager.dart';
import '../../../../resources/style_manager.dart';
import '../../../../resources/values_manager.dart';
import '../view_model/home_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}
class HomePageState extends State<HomePage>
with SingleTickerProviderStateMixin {

   final HomeViewModel _viewModel = instance<HomeViewModel>();

  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

   @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: StreamBuilder<FlowState>(
            stream: _viewModel.outputState,
            builder: (context, snapshot) {
              return snapshot.data
                      ?.getScreenWidget(context, _getContentWidget(), () {
                    _viewModel.start();
                  }) ??
                  _getContentWidget();
            }),
      ),
    );
  }

Widget _getContentWidget() {
    double screenHeight = MediaQuery.of(context).size.height;
    return StreamBuilder<HomeViewObject>(
        stream: _viewModel.outputHomeData,
        builder: (context, snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _getStoresWidget(snapshot.data?.stores, screenHeight),
            ],
          );
        });
  }
  Widget _getStoresWidget(List<Store>? stores, screenHeight) {
    if (stores != null) {
      return Column(
        children: [
          GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 0.6,
              crossAxisSpacing: 5,
              mainAxisSpacing: 1,
              primary: false,
              padding: const EdgeInsets.only(left: 10, right: 10),
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              children: List.generate(stores.length, (index) {
                return Column(children: [
                   Container(
                        height: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: NetworkImage(stores[index].images),
                          fit: BoxFit.cover,
                        )),
                      ),
                  SizedBox(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                stores[index].title + stores[index].Year,
                                style: getRegularStyle(
                                    color: ColorManager.black,
                                    fontSize: AppSize.s8),
                              ), Text(stores[index].Released + stores[index].Rated,
                                  style: getBoldStyle(
                                      color: ColorManager.black,
                                      fontSize: AppSize.s8)),
                            ]),
                      ],
                    ),
                  ),
                ]);
              })),
          const SizedBox(
            height: 110,
          )
        ],
      );
    } else {
      return Container();
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}