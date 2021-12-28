import 'package:flutter/material.dart';

class CardDesign extends StatefulWidget {
  const CardDesign({
    Key? key,
  }) : super(key: key);

  @override
  State<CardDesign> createState() => _CardDesignState();
}

class _CardDesignState extends State<CardDesign> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.9),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.white,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Achievements',
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  ListTile(
                    leading: Image.asset(
                      'lib/reward.png',
                      height: 30,
                    ),
                    contentPadding: const EdgeInsets.all(0),
                    minLeadingWidth: 0,
                    minVerticalPadding: 0,
                    title: Text(
                      'Logged 15 miles in a week',
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(
                      'lib/reward.png',
                      height: 30,
                    ),
                    contentPadding: const EdgeInsets.all(0),
                    minLeadingWidth: 0,
                    minVerticalPadding: 0,
                    title: Text(
                      'Walked 10 miles in a day',
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    subtitle: Text(
                      'Sept, 30, 2019',
                      style: Theme.of(context).textTheme.subtitle2?.copyWith(
                          fontWeight: FontWeight.w500, color: Colors.grey),
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(
                      'lib/reward.png',
                      height: 30,
                    ),
                    contentPadding: const EdgeInsets.all(0),
                    minLeadingWidth: 0,
                    minVerticalPadding: 0,
                    title: Text(
                      'Logged you first five miles.',
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}