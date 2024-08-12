sealed class DetailPageEvent {}

class FetchCatDetails extends DetailPageEvent {
  String catId;

  FetchCatDetails(this.catId);

  String getCatId() {
    return catId;
  }
}

class OnInit extends DetailPageEvent{}
