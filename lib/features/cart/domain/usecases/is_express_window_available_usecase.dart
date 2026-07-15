import 'package:injectable/injectable.dart';

@injectable
class IsExpressWindowAvailableUsecase {
  static const _startHour = 10;
  static const _endHour = 16;

  bool call({DateTime? now}) {
    final hour = (now ?? DateTime.now()).hour;
    return hour >= _startHour && hour < _endHour;
  }
}
