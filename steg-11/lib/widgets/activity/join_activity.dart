import 'package:flutter/material.dart';
import 'package:progit_activity_booker/api/API.dart';
import 'package:progit_activity_booker/models/activity.dart';
import 'package:progit_activity_booker/models/sign_up.dart';
import 'package:progit_activity_booker/widgets/common/chip_button.dart';
import 'package:progit_activity_booker/widgets/common/show_error_dialog.dart';

class JoinActivity extends StatefulWidget {
  late ACTIVITY_STATUS activityStatus;
  final DateTime answerBy;
  final String activityId;

  JoinActivity({
    required this.answerBy,
    required this.activityId,
    required String currentUserId,
    required int numberOfSignups,
    required int numberOfSlots,
    required Map<String, SignUp> signUps,
    required Map<String, SignUp> waitingList,
    Key? key,
  }) : super(key: key) {
    if (answerBy.isBefore(DateTime.now())) {
      activityStatus = ACTIVITY_STATUS.TIME_IS_OUT;
    } else if (signUps.containsKey(currentUserId)) {
      activityStatus = ACTIVITY_STATUS.USER_HAVE_BOOKED;
    } else if (waitingList.containsKey(currentUserId)) {
      activityStatus = ACTIVITY_STATUS.USER_IS_ON_WAITING_LIST;
    } else if (numberOfSignups >= numberOfSlots) {
      activityStatus = ACTIVITY_STATUS.WAITING_LIST;
    } else {
      activityStatus = ACTIVITY_STATUS.FREE_SPOTS;
    }
  }

  @override
  State<JoinActivity> createState() => _JoinActivityState();
}

class _JoinActivityState extends State<JoinActivity> {
  var _loading = false;

  JoinActivityLabelsAndAction getActivityLabels(
      BuildContext context, ACTIVITY_STATUS status, DateTime answerBy) {
    final labelsAndAction = labelMap[status];
    if (labelsAndAction == null) {
      return JoinActivityLabelsAndAction(
        textLabel: 'Her skjedde det noe rart. Prøv å gå fram og tilbake.',
        buttonLabel: 'Gå tilbake',
        action: (_) => Navigator.of(context).pushReplacementNamed('/'),
      );
    }
    return labelsAndAction;
  }

  @override
  Widget build(BuildContext context) {
    final joinActivityLabelsAndActions =
        getActivityLabels(context, widget.activityStatus, widget.answerBy);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          joinActivityLabelsAndActions.textLabel,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 30,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: ChipButton(
              loading: _loading,
              large: true,
              label: joinActivityLabelsAndActions.buttonLabel,
              onClick: () async {
                if (joinActivityLabelsAndActions.action == null) {
                  Navigator.of(context).pop();
                  return;
                }
                setState(() {
                  _loading = true;
                });
                try {
                  await joinActivityLabelsAndActions.action!(widget.activityId);
                } catch (e) {
                  showErrorDialog(context, e.toString());
                }
                setState(() {
                  _loading = false;
                });
              }),
        )
      ],
    );
  }
}

Map<ACTIVITY_STATUS, JoinActivityLabelsAndAction> labelMap = {
  ACTIVITY_STATUS.FREE_SPOTS: JoinActivityLabelsAndAction(
      textLabel: 'Bli med?',
      buttonLabel: 'Blir med',
      action: API.activity.signUpForActivity),
  ACTIVITY_STATUS.USER_HAVE_BOOKED: JoinActivityLabelsAndAction(
      textLabel: 'Du er påmeldt',
      buttonLabel: 'Meld av',
      action: API.activity.removeSignUp),
  ACTIVITY_STATUS.WAITING_LIST: JoinActivityLabelsAndAction(
      textLabel: 'Ingen ledige plasser',
      buttonLabel: 'Venteliste',
      action: API.activity.signUpForActivity),
  ACTIVITY_STATUS.USER_IS_ON_WAITING_LIST: JoinActivityLabelsAndAction(
      textLabel: 'Du er på venteliste',
      buttonLabel: 'Meld av',
      action: API.activity.removeSignUp),
  ACTIVITY_STATUS.TIME_IS_OUT: JoinActivityLabelsAndAction(
    textLabel: 'Tidsfristen har gått ut',
    buttonLabel: 'Tilbake',
  ),
};

class JoinActivityLabelsAndAction {
  final String textLabel;
  final String buttonLabel;
  final Future<void> Function(String activityId)? action;

  JoinActivityLabelsAndAction({
    required this.textLabel,
    required this.buttonLabel,
    this.action,
  });
}
