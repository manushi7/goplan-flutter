import 'package:flutter/material.dart';

class Goal extends StatefulWidget {
  const Goal({Key? key}) : super(key: key);

  @override
  State<Goal> createState() => _GoalState();
}

class _GoalState extends State<Goal> {
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Column(
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
              'View all goals',
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
      ),
    );
  }

  void showSheet(BuildContext context) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _descriptionController,
                  decoration:
                      const InputDecoration(hintText: 'Enter description'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _createDateController,
                  decoration:
                      const InputDecoration(hintText: 'Enter create date'),
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
                  decoration:
                      const InputDecoration(hintText: 'Enter to complete date'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _reminderDateController,
                  decoration:
                      const InputDecoration(hintText: 'Enter to reminder date'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}