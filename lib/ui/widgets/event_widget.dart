import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_c17/firebase_utils/firestore_utils.dart';
import 'package:evently_c17/ui/model/event_dm.dart';
import 'package:evently_c17/ui/model/user_dm.dart';
import 'package:evently_c17/ui/utils/app_colors.dart';
import 'package:evently_c17/ui/utils/app_styles.dart';
import 'package:flutter/material.dart';

class EventWidget extends StatefulWidget {
  final EventDM eventDM;

  const EventWidget({super.key, required this.eventDM});

  @override
  State<EventWidget> createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  @override
  Widget build(BuildContext context) {
    print(" UserDM.currentUser!.favoriteEventIds = ${ UserDM.currentUser!.favoriteEventIds}");
    return Container(
      height: MediaQuery.of(context).size.height * .24,
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              widget.eventDM.categoryDM.imagePath,
              fit: BoxFit.fill,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [buildDateContainer(), buildTitleContainer()],
          ),
        ],
      ),
    );
  }

  buildDateContainer() {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.blue,
        ),
        child: Text(
          "${widget.eventDM.dateTime.day} Jan",
          textAlign: TextAlign.start,
          style: AppTextStyles.white18Medium,
        ),
      ),
    );
  }

  buildTitleContainer() => Container(
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: AppColors.blue,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            widget.eventDM.title,
            style: AppTextStyles.white18Medium,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        StreamBuilder(
          stream: FirebaseFirestore.instance.collection(UserDM.collectionName).doc(UserDM.currentUser!.id).snapshots(),
          builder: (context, snapshot){
            return  InkWell(
              onTap: () {
                if (UserDM.currentUser!.favoriteEventIds.contains(widget.eventDM.id)) {
                  removeEventFromFavorite(widget.eventDM.id, UserDM.currentUser!);
                } else {
                  addEventToFavorite(widget.eventDM.id, UserDM.currentUser!);
                }
              },
              child: Icon(
                UserDM.currentUser!.favoriteEventIds.contains(widget.eventDM.id)
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: AppColors.white,
              ),
            );
          },
        ),
      ],
    ),
  );
}
