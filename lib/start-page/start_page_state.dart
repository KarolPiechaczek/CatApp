sealed class StartPageStates{}

class InitialState extends StartPageStates{}

class ButtonPressedState extends StartPageStates{
  final bool isSignInButtonPressed;
  ButtonPressedState(this.isSignInButtonPressed);
}