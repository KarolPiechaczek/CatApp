sealed class DetailPageEvent {}

class OnInit extends DetailPageEvent{
    String catId;

    OnInit(this.catId);
}
