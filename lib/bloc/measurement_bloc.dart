import 'package:bloc/bloc.dart';
import 'package:measurement_book_ui/models/measure.dart';
import 'package:measurement_book_ui/models/measurement.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

part 'measurement_event.dart';
part 'measurement_state.dart';

class MeasurementBloc extends Bloc<MeasurementEvent, MeasurementState> {
  MeasurementBloc() : super(MeasurementState()) {
    on<MeasurementEvent>((event, emit) {
      // TODO: implement event handler event,
    });

    Measure addMeasure(Map<String, dynamic> formData) {
      Measure measure = Measure(
        targetId: formData['measure']['targetId'] as String,
        length: num.parse(formData['measure']['length']),
        breadth: num.parse(formData['measure']['breadth']),
        height: num.parse(formData['measure']['height']),
        numItems: num.parse(formData['measure']['numItems']),
        currentValue: num.parse(formData['measure']['currentValue']),
        cumulativeValue: num.parse(formData['measure']['cumulativeValue']),
        isActive: formData['isActive'] == "true" ? true : false,
        comments: formData['measure']['comments'] as String,
      );
      return measure;
    }

    Measurement mapMeasurement(Map<String, dynamic> formData) {
      Measurement measurement = Measurement(
          tenantId: formData['tenantId'] as String,
          referenceId: formData['referenceId'] as String,
          measurementNumber: formData['measurementNumber'] as String,
          physicalRefNumber: formData['physicalRefNumber'] as String,
          isActive: formData['isActive'] == "true" ? true : false,
          measures: [addMeasure(formData)]);
      return measurement;
    }

    void _onSubmit(onSubmit event, Emitter<MeasurementState> emit) async {
      // emit(MeasurementState(isLoading: true));
      emit(IsLoading());
      Map<String, dynamic> formData = event.formData;
      Measurement measurement = mapMeasurement(formData);

      var body = {
        "RequestInfo": {
          "apiId": "Rainmaker",
          "authToken": "be6484be-e495-4ddb-8645-e70c2ea9e5f9",
          "userInfo": {
            "id": 1552,
            "uuid": "0477b319-7cd3-4b5e-98ec-dc7ed140b623",
            "userName": "DEV_GUIDE",
            "name": "dev guide",
            "mobileNumber": "9925363638",
            "emailId": "workbenchadmin@gmail.com",
            "locale": null,
            "type": "EMPLOYEE",
            "roles": [
              {
                "name": "Super User",
                "code": "SUPERUSER",
                "tenantId": "pb.jalandhar,dwss"
              },
              {
                "name": "Citizen",
                "code": "CITIZEN",
                "tenantId": "pb.jalandhar,dwss"
              },
              {
                "name": "MDMS Admin",
                "code": "MDMS_ADMIN",
                "tenantId": "pb.jalandhar,dwss"
              },
              {
                "name": "Localisation admin",
                "code": "LOC_ADMIN",
                "tenantId": "pb.jalandhar,dwss"
              },
              {
                "name": "Employee",
                "code": "EMPLOYEE",
                "tenantId": "pb.jalandhar,dwss"
              }
            ],
            "active": true,
            "tenantId": "pb.jalandhar,dwss",
            "permanentCity": null
          },
          "msgId": "1714055068243|en_MZ",
          "plainAccessRequest": {}
        },
        "measurements": [measurement.toJson()]
      };

      try {
        var response = await Dio().post(
            "http://localhost:8080/measurement-book/measurement/v1/_create",
            data: body,
            options: Options(headers: {"Accept": "application/json"}));
        emit(LoadedSuccessfully());
      } catch (e) {
        print(e);
        emit(ErrorLoading());
      }

      emit(MeasurementState(measurement: measurement));
    }

    on<onSubmit>(_onSubmit);
  }
}
