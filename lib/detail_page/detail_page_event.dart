sealed class DetailPageEvent {}

class FetchCatDetailsEvent extends DetailPageEvent {
  String catId;

  FetchCatDetailsEvent(this.catId);

  String getCatId() {
    return catId;
  }
}

class ResetStateEvent extends DetailPageEvent{}
