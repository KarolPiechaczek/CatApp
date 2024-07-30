sealed class DetailPageEvent{}

class FetchCatDetailsEvent extends DetailPageEvent{
  final String catId;

  FetchCatDetailsEvent(this.catId);

  String getCatId(){
    return catId;
  }
}
