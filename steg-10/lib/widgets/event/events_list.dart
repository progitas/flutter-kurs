import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progit_activity_booker/api/API.dart';
import 'package:progit_activity_booker/models/event.dart';
import 'package:progit_activity_booker/providers/activities_provider.dart';
import 'package:progit_activity_booker/providers/users_provider.dart';
import 'package:progit_activity_booker/widgets/common/loading_indicator.dart';
import 'package:progit_activity_booker/widgets/event/event_renderer.dart';

class EventsList extends ConsumerWidget {
  final title = 'Oppdateringer';

  const EventsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref
        .watch(UsersProvider.provider.select((usersState) => usersState.users));
    final activities = ref.watch(ActivitiesProvider.provider
        .select((activitiesState) => activitiesState.activities));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline1,
            ),
            StreamBuilder<List<Event>>(
                stream: API.event.listenToEvents(users, activities),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: ((context, index) => EventRenderer(
                            snapshot.data![index],
                          )),
                    );
                  }
                  if (snapshot.hasError) {
                    return const Text(
                        'Det skjedde en feil da vi lastet inn oppdateringer');
                  }
                  return const Center(child: LoadingIndicator());
                }),
          ],
        ),
      ),
    );
  }
}
