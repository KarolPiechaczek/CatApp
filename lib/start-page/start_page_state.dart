sealed class StartPageStates{}

class InitialState extends StartPageStates{}

class UpdateState extends StartPageStates{
  final bool isSignInButtonPressed;
  UpdateState(this.isSignInButtonPressed);
}