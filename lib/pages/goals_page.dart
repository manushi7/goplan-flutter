import 'dart:developer';

import 'package:flutter/material.dart';
import 'date_extension.dart';

class GoalScreen extends StatefulWidget {
  const GoalScreen({Key? key}) : super(key: key);

  @override
  State<GoalScreen> createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> {
  late final TextEditingController _descriptionController;
  late final TextEditingController _createDateController;
  late final TextEditingController _startDateController;
  late final TextEditingController _completeDateController;
  late final TextEditingController _reminderDateController;
  late bool setReminder;

  @override
  void initState() {
    setReminder = false;
    _descriptionController = TextEditingController();
    _createDateController = TextEditingController();
    _startDateController = TextEditingController();
    _completeDateController = TextEditingController();
    _reminderDateController = TextEditingController();

    super.initState();
  }

  Future<DateTime?> pickDate() async {
    try {
      final pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101),
      );
      return pickedDate;
    } catch (e) {
      log('$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            'Today',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: const Color(0xffC77FE6)),
          ),
          trailing: const Icon(
            Icons.add,
            color: Color(0xffC77FE6),
          ),
        ),
        ListTile(
          title: Text(
            'Tomorrow',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: const Color(0xffC77FE6)),
          ),
          trailing: const Icon(
            Icons.add,
            color: Color(0xffC77FE6),
          ),
        ),
        ListTile(
          title: Text(
            'Upcoming',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: const Color(0xffC77FE6)),
          ),
          trailing: const Icon(
            Icons.add,
            color: Color(0xffC77FE6),
          ),
        ),
        ListTile(
          title: Text(
            'View all GoalScreens',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: const Color(0xffC77FE6)),
          ),
          trailing: const Icon(
            Icons.add,
            color: Color(0xffC77FE6),
          ),
        ),
        const Spacer(),
        Center(
          child: InkWell(
            onTap: () {
              showSheet(context);
            },
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffC77FE6),
              ),
              child: const Icon(
                Icons.add,
                size: 40,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: kBottomNavigationBarHeight,
        ),
      ],
    );
  }

  void showSheet(BuildContext context) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      isDismissible: false,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: StatefulBuilder(
            builder: (context, state) => Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, right: 10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _descriptionController.clear();
                            _createDateController.clear();
                            _startDateController.clear();
                            setReminder = false;
                            _completeDateController.clear();
                            _reminderDateController.clear();
                          });

                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _descriptionController,
                      decoration:
                          const InputDecoration(hintText: 'Enter description'),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      final date = await pickDate();
                      if (date != null) {
                        setState(() {
                          _createDateController.text = date.formatDate;
                        });
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        enabled: false,
                        readOnly: true,
                        controller: _createDateController,
                        decoration: const InputDecoration(
                            hintText: 'Enter create date'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _startDateController,
                      decoration:
                          const InputDecoration(hintText: 'Enter start date'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('To set a reminder'),
                        Checkbox(
                            value: setReminder,
                            onChanged: (value) {
                              setState(() {
                                setReminder = value ?? false;
                              });
                            })
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _completeDateController,
                      decoration: const InputDecoration(
                          hintText: 'Enter to complete date'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _reminderDateController,
                      decoration: const InputDecoration(
                          hintText: 'Enter to reminder date'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Submit',
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
