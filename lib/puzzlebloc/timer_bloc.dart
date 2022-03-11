import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:my_puzzle_game/puzzlebloc/timer_event.dart';
import 'package:my_puzzle_game/puzzlebloc/timer_state.dart';

import '../models/ticker.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  late final Ticker ticker;
  late final int duration;

  late StreamSubscription<int> tickerSubscription;

  TimerBloc(TimerState initialState) : super(initialState);

  @override
  void onTransition(Transition<TimerEvent, TimerState> transition) {
    super.onTransition(transition);
    print(transition);
  }

  Stream<TimerState> mapEventToState(
    TimerEvent event,
  ) async* {
    if (event is Start) {
      yield* _mapStartToState(event);
    } else if (event is Pause) {
      yield* _mapPauseToState(event);
    } else if (event is Resume) {
      yield* _mapResumeToState(event);
    } else if (event is Reset) {
      yield* _mapResetToState(event);
    } else if (event is Tick) {
      yield* _mapTickToState(event);
    }
  }

  void dispose() {
    tickerSubscription.cancel();
    super.close();
  }

  Stream<TimerState> _mapStartToState(Start start) async* {
    yield Running(start.duration);
    tickerSubscription.cancel();
    tickerSubscription = ticker.tick(ticks: start.duration).listen(
      (duration) {
        (Tick(duration: duration));
      },
    );
  }

  Stream<TimerState> _mapPauseToState(Pause pause) async* {
    final state = this.state;
    if (state is Running) {
      tickerSubscription.pause();
      yield Paused(state.duration);
    }
  }

  Stream<TimerState> _mapResumeToState(Resume pause) async* {
    final state = this.state;
    if (state is Paused) {
      tickerSubscription.resume();
      yield Running(state.duration);
    }
  }

  Stream<TimerState> _mapResetToState(Reset reset) async* {
    tickerSubscription.cancel();
    yield Ready(duration);
  }

  Stream<TimerState> _mapTickToState(Tick tick) async* {
    yield tick.duration > 0 ? Running(tick.duration) : const Finished();
  }
}
