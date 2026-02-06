import 'package:evently_c17/fire_store/firebase.dart';
import 'package:evently_c17/model/event_dm.dart';
import 'package:evently_c17/model/user_dm.dart';
import 'package:evently_c17/ui/screens/details/details_screen.dart';
import 'package:evently_c17/ui/utils/app_colors.dart';
import 'package:evently_c17/ui/utils/app_styles.dart';
import 'package:evently_c17/ui/utils/constants.dart';
import 'package:evently_c17/ui/widgets/categories_tab_bar.dart';
import 'package:evently_c17/ui/widgets/event_widget.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          buildHeader(),
          StreamBuilder(
            stream: getEventsFromFirestore(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else if (snapshot.hasData) {
                events = snapshot.data!;
                filteredEvents = events;
                filterEventsByCategory(selectedCategory);
                return Expanded(
                  child: Column(
                    children: [buildCategoriesTabBar(), buildEventsList()],
                  ),
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }

  buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Text("Welcome Back ✨", style: AppTextStyles.grey14Regular),
            Spacer(),
            Icon(Icons.brightness_5, color: AppColors.blue, size: 24),
            SizedBox(width: 8),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                "En",
                style: TextStyle(color: AppColors.white, fontSize: 14),
              ),
            ),
          ],
        ),
        Text(
          "${UserDM.currentUser!.name}",
          textAlign: TextAlign.start,
          style: AppTextStyles.black20SemiBold,
        ),
      ],
    );
  }

  buildCategoriesTabBar() {
    return CategoriesTabBar(
      categories: AppConstants.allCategories,
      onChanged: (category) {
        selectedCategory = category;
        setState(() {});
      },
    );
  }

  List<EventDM> events = [];
  List<EventDM> filteredEvents = [];
  CategoryDM selectedCategory = AppConstants.all;

  // loadEvents() async{
  //   events = await getEventsFromFirestore();
  //   filteredEvents = events;
  //   setState(() {});
  // }

  buildEventsList() {
    return Expanded(
      child: ListView.builder(
        itemCount: filteredEvents.length,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(event: filteredEvents[index]),));
              },
              child: EventWidget(eventDM: filteredEvents[index]));
        },
      ),
    );
  }

  void filterEventsByCategory(CategoryDM category) {
    if (category != AppConstants.all) {
      filteredEvents = events.where((event) {
        return event.categoryDM.name == category.name;
      }).toList();
    } else {
      filteredEvents = events;
    }
    filteredEvents.sort((event1, event2){
      return event1.dateTime.compareTo(event2.dateTime);
    });
  }

}