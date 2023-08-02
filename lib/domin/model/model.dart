// home model
class Store{
  int id;
  String Title;
  String Year; 
  String Rated;
  String Released;
  String Images;
  Store(this.id, this.Title,this.Year,this.Released,this.Rated, this.Images);
}

class HomeData {
  List<Store> stores;
  HomeData(this.stores);
}

class HomeObject {
  HomeData data;
  HomeObject(this.data);
}