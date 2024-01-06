// ignore_for_file: must_be_immutable, unnecessary_this

part of 'started_screen_bloc.dart';

enum HomeStatus { initial, success, failure }

final class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.initial,
    this.accounts = const <AccModel>[],
  });

  final HomeStatus status;
  final List<AccModel> accounts;

  HomeState copyWith({
    HomeStatus? status,
    List<AccModel>? accounts,
  }) {
    return HomeState(
      status: status ?? this.status,
      accounts: accounts ?? this.accounts,
    );
  }

  @override
  List<Object> get props => [status, accounts];
}
