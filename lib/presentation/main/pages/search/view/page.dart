import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movie/presentation/resources/colors_manager.dart';
import 'package:movie/presentation/resources/strings_manager.dart';

import '../../../../../app/dependency_injection.dart';
import '../../../../../domin/model/model.dart';
import '../../../../common/state_renderer/state_renderer_impl.dart';
import '../../../../resources/font_manager.dart';
import '../../../../resources/values_manager.dart';
import '../../movie/view_model/home_viewmodel.dart';

class SPage extends StatefulWidget {
  const SPage({Key? key}) : super(key: key);

  @override
  SPageState createState() => SPageState();
}

class SPageState extends State<SPage> {
  final HomeViewModel _viewModel = instance<HomeViewModel>();
  final _debouncer = DeBouncer();

  List<Store> userLists = [];
  List<Store> ulist = [];

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
    return StreamBuilder<HomeViewObject>(
        stream: _viewModel.outputHomeData,
        builder: (context, snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _getStoresWidget(snapshot.data?.stores),
            ],
          );
        });
  }

  // Search Bar to List of typed Store
  Widget _getStoresWidget(List<Store>? stores) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: TextField(
            textInputAction: TextInputAction.search,
            style: TextStyle(color: ColorManager.black),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSize.s20),
                borderSide: BorderSide(
                  color: ColorManager.lightGrey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSize.s20),
                borderSide: BorderSide(
                  color: ColorManager.black,
                ),
              ),
              suffixIcon: InkWell(
                child: Icon(Icons.search, color: ColorManager.black),
              ),
              contentPadding: const EdgeInsets.all(AppSize.s14),
              hintText: AppStrings.movieTitle,
            ),
            onChanged: (string) {
              _debouncer.run(() {
                setState(() {
                  userLists = stores!
                      .where((u) => (u.Title.toLowerCase().contains(
                            string.toLowerCase(),
                          )))
                      .toList();
                });
              });
            },
          ),
        ),
        // list to show the result of search
          SizedBox(
            height:MediaQuery.of(context).size.height,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.all(AppPadding.p5),
              itemCount: userLists.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSize.s20),
                    side: BorderSide(
                      color: ColorManager.black,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(AppPadding.p5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            userLists[index].Title,
                            style: TextStyle(
                                fontSize: FontSize.s16, color: ColorManager.black),
                          ),
                          subtitle: Text(
                            userLists[index].Year,
                            style: TextStyle(
                                fontSize: FontSize.s16, color: ColorManager.black),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}

// prevents an Action from executing "too many times" or "too frequently."
class DeBouncer {
  int? milliseconds;
  VoidCallback? action;
  Timer? timer;

  run(VoidCallback action) {
    if (null != timer) {
      timer!.cancel();
    }
    timer = Timer(
      const Duration(milliseconds: Duration.millisecondsPerSecond),
      action,
    );
  }
}
