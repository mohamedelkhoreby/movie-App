// home model
class Store{
  int id;
  String title;
  String Year; 
  String Rated;
  String Released;
  String images;
  Store(this.id, this.title,this.Year,this.Released,this.Rated, this.images);
}

class HomeData {
  List<Store> stores;
  HomeData(this.stores);
}

class HomeObject {
  HomeData data;
  HomeObject(this.data);
}