import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class TimerState extends Equatable {
  final int duration;

  const TimerState(this.duration);
}

class Ready extends TimerState {
  const Ready(int duration) : super(duration);

  @override
  String toString() => 'Ready { duration: $duration }';

  @override
  List<Object?> get props => [duration];
}

class Paused extends TimerState {
  const Paused(int duration) : super(duration);

  @override
  String toString() => 'Paused { duration: $duration }';

  @override
  List<Object?> get props => [duration];
}

class Running extends TimerState {
  const Running(int duration) : super(duration);

  @override
  String toString() => 'Running { duration: $duration }';

  @override
  List<Object?> get props => [duration];
}

class Finished extends TimerState {
  const Finished() : super(0);

  @override
  String toString() => 'Finished';

  @override
  List<Object?> get props => [];
}
