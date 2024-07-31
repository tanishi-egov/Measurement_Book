part of 'measurement_bloc.dart';

sealed class MeasurementEvent extends Equatable {
  const MeasurementEvent();

  @override
  List<Object> get props => [];
}

final class onSubmit extends MeasurementEvent {
  final Map<String, dynamic> formData;
  const onSubmit({required this.formData});

  @override
  List<Object> get props => [formData];
}
