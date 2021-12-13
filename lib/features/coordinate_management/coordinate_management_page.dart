import 'package:flutter/material.dart';
import 'package:tracking/auto_export.dart';
import 'package:tracking/components/button.dart';
import 'package:tracking/components/time_of_day_picker.dart';
import 'package:tracking/features/coordinate_management/coordinate_management_controller.dart';
import 'package:tracking/mixins/alertable.dart';
import 'package:tracking/resources/failures.dart';

class CoordinateManagementPage extends StatefulWidget {

  final CoordinateManagementController _controller;
  
  const CoordinateManagementPage(this._controller);

  @override
  _CoordinateManagementPageState createState() => _CoordinateManagementPageState();

}

class _CoordinateManagementPageState extends State<CoordinateManagementPage> with Alertable {

  Future<void> _saveChanges() async {
    final result = await widget._controller.saveTrackingTimes();
    result.fold(
      (failure) => _errorAlert(failure),
      (success) => success ? _successAlert() : _errorAlert(UnknownErrorCommunicatingWithServer())
    );
  }

  _successAlert() => showSimpleDialog(
    context,
    AppStrings.updatedInformations,
    [ Text(AppStrings.newTrackingTimes) ]
  );

  _errorAlert(Failure failure) => showSimpleDialog(
    context,
    AppStrings.errorUpdatingTrackingTimes,
    [ Text(failure.message) ]
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.coordinatesManagementTitle),
        centerTitle: true
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              child: Text(
                AppStrings.explanation,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.justify
              ),
              padding: EdgeInsets.only(top: 80),
            ),
            _builTimeSelection(
              AppStrings.coordinatesCollectionTime,
              widget._controller.coordinatesCollectionTime.value,
              (timeOfDay) => widget._controller.coordinatesCollectionTime.value = timeOfDay,
              "first_time_selector"
            ),
            _builTimeSelection(
              AppStrings.timeForSendingCoordinatesToTheServer,
              widget._controller.timeForSendingCoordinatesToServer.value,
              (timeOfDay) => widget._controller.timeForSendingCoordinatesToServer.value = timeOfDay,
              "second_time_selector"
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Button(
                AppStrings.saveButtonTitle,
                _saveChanges,
                key: Key("save_button")
              ),
            )
          ]
        ),
      ),
    );
  }

  Widget _builTimeSelection(String title, TimeOfDay initialTime, Function onSelectTimeOfDay, String key) => Padding(
    padding: const EdgeInsets.only(top: 20),
    child: Column( children: [ 
      Text(title),
      Padding(
        padding: EdgeInsets.only(top: 15),
        child: TimeOfDayPicker(initialTime, onSelectTimeOfDay, key: Key(key)),
      )
    ]),
  );

}