part of 'measurement_bloc.dart';

class MeasurementState extends Equatable {
  final Measurement? measurement;

  MeasurementState({this.measurement});

  @override
  List<Object?> get props => [measurement];
}

class IsLoading extends MeasurementState {}

class LoadedSuccessfully extends MeasurementState {}

class ErrorLoading extends MeasurementState {}
