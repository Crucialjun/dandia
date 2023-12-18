abstract class INavigationService {
  Future<T?>? navigateToNamed<T extends Object?>(String routeName,
      {Object? arguments});
}
