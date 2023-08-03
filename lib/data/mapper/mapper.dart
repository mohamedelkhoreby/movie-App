import 'package:movie/app/extenstion.dart';

import '../../domin/model/model.dart';
import '../response/responses.dart';

const EMPTY = "";
const ZERO = 0;

extension StoreResponseMapper on StoreResponse? {
  Store toDomain() {
    return Store(
      this?.id?.orZero() ?? ZERO,
      this?.Title?.orEmpty() ?? EMPTY,
      this?.Year?.orEmpty() ?? EMPTY,
      this?.Rated?.orEmpty() ?? EMPTY,
      this?.Released?.orEmpty() ?? EMPTY,
      this?.Images?.orEmpty() ?? EMPTY,
    );
  }
}

extension HomeResponseMapper on HomeResponse? {
  HomeObject toDomain() {
    List<Store> mappedStores =
        (this?.data?.stores?.map((store) => store.toDomain()) ??
                const Iterable.empty())
            .cast<Store>()
            .toList();
    var data = HomeData(mappedStores);
    return HomeObject(data);
  }
}
