part of 'splash_cubit.dart';

final class SplashState extends Equatable {
  final bool startAnimation;
  final bool navigateNext;
  final bool isLoading;

  const SplashState({
    this.startAnimation = false,
    this.navigateNext = false,
    this.isLoading = false,
  });

  @override
  List<Object> get props => [startAnimation, navigateNext, isLoading];

  SplashState copyWith({
    bool? startAnimation,
    bool? navigateNext,
    bool? isLoading,
  }) {
    return SplashState(
      startAnimation: startAnimation ?? this.startAnimation,
      navigateNext: navigateNext ?? this.navigateNext,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

final class SplashInitial extends SplashState {}
