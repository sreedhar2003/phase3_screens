import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phase3_screens/helpers/appcolors.dart';
import 'package:phase3_screens/helpers/screen_config.dart';
import 'package:phase3_screens/helpers/size_extension.dart';
import 'package:phase3_screens/helpers/sizedbox.dart';
import 'package:phase3_screens/screens/360_profile_dashboard/controller/profile360_controller.dart';
import 'package:phase3_screens/screens/360_profile_dashboard/widgets/item_card.dart';
import 'package:provider/provider.dart';

class Profile360Withconsent extends StatefulWidget {
  const Profile360Withconsent({super.key});

  @override
  State<Profile360Withconsent> createState() => _Profile360WithconsentState();
}

class _Profile360WithconsentState extends State<Profile360Withconsent> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<Profile360Controller>();
    ScreenUtil.getInstance().init(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
            color: AppColors.black,
          ),
        ),
        title: Center(
          child: Text(
            "Patient Profile",
            style: GoogleFonts.roboto(
              color: AppColors.black,
              fontSize: 17.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 37,
                  backgroundImage: AssetImage(
                    "assets/images/patient_profile.png",
                  ),
                ),
              ),
              sizedBoxWithHeight(10),
              Text(
                "Meera Sharma",
                style: GoogleFonts.roboto(
                  color: AppColors.green,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              sizedBoxWithHeight(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Native City: ",
                    style: GoogleFonts.roboto(
                      color: AppColors.grey,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "Bengaluru",
                    style: GoogleFonts.roboto(
                      color: AppColors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  sizedBoxWithWidth(5),
                  Container(height: 22, width: 1, color: AppColors.green),
                  sizedBoxWithWidth(5),
                  Text(
                    "Current City: ",
                    style: GoogleFonts.roboto(
                      color: AppColors.grey,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "Mumbai",
                    style: GoogleFonts.roboto(
                      color: AppColors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              sizedBoxWithHeight(10),
              Center(
                child: Text.rich(
                  TextSpan(
                    text: 'Allergies: ',
                    style: GoogleFonts.roboto(
                      color: AppColors.grey,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      TextSpan(
                        text: 'No Known Allergies',
                        style: GoogleFonts.roboto(
                          color: AppColors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              sizedBoxWithHeight(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(color: AppColors.green),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppColors.lightblue,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/age_icon.png",
                                height: 25,
                                width: 24,
                                fit: BoxFit.contain,
                              ),
                              sizedBoxWithHeight(5),
                              Text(
                                "AGE",
                                style: GoogleFonts.roboto(
                                  color: AppColors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        sizedBoxWithHeight(5),
                        Text(
                          "36",
                          style: GoogleFonts.roboto(
                            color: AppColors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(color: AppColors.green),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppColors.lightred,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/blood_icon.png",
                                height: 25,
                                width: 24,
                                fit: BoxFit.contain,
                              ),
                              sizedBoxWithHeight(5),
                              Text(
                                "BLOOD",
                                style: GoogleFonts.roboto(
                                  color: AppColors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        sizedBoxWithHeight(5),
                        Text(
                          "B+",
                          style: GoogleFonts.roboto(
                            color: AppColors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(color: AppColors.green),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppColors.greencontainer,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/height_icon.png",
                                height: 25,
                                width: 24,
                                fit: BoxFit.contain,
                              ),
                              sizedBoxWithHeight(5),
                              Text(
                                "HEIGHT",
                                style: GoogleFonts.roboto(
                                  color: AppColors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        sizedBoxWithHeight(5),
                        Center(
                          child: Text.rich(
                            TextSpan(
                              text: '175',
                              style: GoogleFonts.roboto(
                                color: AppColors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              children: [
                                TextSpan(
                                  text: 'cm',
                                  style: GoogleFonts.roboto(
                                    color: AppColors.grey,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(color: AppColors.green),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppColors.orangecontainer,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/weight_icon.png",
                                height: 25,
                                width: 24,
                                fit: BoxFit.contain,
                              ),
                              sizedBoxWithHeight(5),
                              Text(
                                "WEIGHT",
                                style: GoogleFonts.roboto(
                                  color: AppColors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        sizedBoxWithHeight(5),
                        Center(
                          child: Text.rich(
                            TextSpan(
                              text: '75',
                              style: GoogleFonts.roboto(
                                color: AppColors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              children: [
                                TextSpan(
                                  text: 'kg',
                                  style: GoogleFonts.roboto(
                                    color: AppColors.grey,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              sizedBoxWithHeight(20),
              Center(
                child: SizedBox(
                  height: 36,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: provider.categorylistwithconsent.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        setState(() {
                          provider.selectedindexwithconsent = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: provider.selectedindexwithconsent == index
                            ? BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.green,
                                border: Border.all(color: AppColors.green),
                              )
                            : BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.white,
                                border: Border.all(color: AppColors.grey),
                              ),
                        child: Center(
                          child: Text(
                            provider.categorylistwithconsent[index].toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.roboto(
                              color: provider.selectedindexwithconsent == index
                                  ? AppColors.white
                                  : AppColors.green,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              sizedBoxWithHeight(20),
              if (provider.selectedindexwithconsent == 0) ...[
                // overview Section
                Column(
                  children: [
                    ItemCard(
                      image: "assets/images/triage_icon.png",
                      item: "Triage Notes",
                      ontap: () {
                        //navigation
                      },
                    ),
                    sizedBoxWithHeight(10),
                    ItemCard(
                      image: "assets/images/allergies_icon.png",
                      item: "Allergies",
                      ontap: () {
                        //navigation
                      },
                    ),
                    sizedBoxWithHeight(10),
                    ItemCard(
                      image: "assets/images/medicationadherence_icon.png",
                      item: "Medication Adherence",
                      ontap: () {
                        //navigation
                      },
                    ),
                    sizedBoxWithHeight(10),
                    ItemCard(
                      image: "assets/images/currentlyaddedmedications_icon.png",
                      item: "Currently Added Medications",
                      ontap: () {
                        //navigation
                      },
                    ),
                    sizedBoxWithHeight(10),
                    ItemCard(
                      image: "assets/images/healthconditions_icon.png",
                      item: "Health  Conditions",
                      ontap: () {
                        //navigation
                      },
                    ),
                    sizedBoxWithHeight(10),
                    ItemCard(
                      image: "assets/images/triage_icon.png",
                      item: "Pre-visit Triage",
                      ontap: () {
                        //navigation
                      },
                    ),
                    sizedBoxWithHeight(10),
                    ItemCard(
                      image: "assets/images/waterconsumption_icon.png",
                      item: "Water Consumption",
                      ontap: () {
                        //navigation
                      },
                    ),
                    sizedBoxWithHeight(10),
                    ItemCard(
                      image: "assets/images/calorietracker_icon.png",
                      item: "Calorie Tracker",
                      ontap: () {
                        //navigation
                      },
                    ),
                  ],
                ),
              ] else if (provider.selectedindexwithconsent == 1) ...[
                // Vitals Section
                Column(
                  children: [
                    ItemCard(
                      image: "assets/images/viewvitals_icon.png",
                      item: "View vitals",
                      ontap: () {
                        //navigation
                      },
                    ),
                  ],
                ),
              ] else if (provider.selectedindexwithconsent == 2) ...[
                // Encounter Section
                Column(
                  children: [
                    ItemCard(
                      image: "assets/images/addclinicalnotes_icon.png",
                      item: "Add Clinical notes",
                      ontap: () {
                        //navigation
                      },
                    ),
                    sizedBoxWithHeight(10),
                    ItemCard(
                      image: "assets/images/medications_icon.png",
                      item: "Medications",
                      ontap: () {
                        //navigation
                      },
                    ),
                    sizedBoxWithHeight(10),
                    ItemCard(
                      image: "assets/images/clinicalnotes_icon.png",
                      item: "Clinical Notes",
                      ontap: () {
                        //navigation
                      },
                    ),
                    sizedBoxWithHeight(10),
                    ItemCard(
                      image: "assets/images/triage_icon.png",
                      item: "Pre-visit Triage",
                      ontap: () {
                        //navigation
                      },
                    ),
                    sizedBoxWithHeight(10),
                    ItemCard(
                      image: "assets/images/notes_icon.png",
                      item: "Notes",
                      ontap: () {
                        //navigation
                      },
                    ),
                    sizedBoxWithHeight(10),
                    ItemCard(
                      image: "assets/images/recentactivity_icon.png",
                      item: "Recent  Activity",
                      ontap: () {
                        //navigation
                      },
                    ),
                  ],
                ),
              ] else if (provider.selectedindexwithconsent == 3) ...[
                // Triage Section
                Column(
                  children: [
                    ItemCard(
                      image: "assets/images/triage_icon.png",
                      item: "Triage",
                      ontap: () {
                        //navigation
                      },
                    ),
                  ],
                ),
              ] else if (provider.selectedindexwithconsent == 4) ...[
                // Treatment History Section
                Column(
                  children: [
                    ItemCard(
                      image: "assets/images/treatmenthistory_icon.png",
                      item: "Treatment History",
                      ontap: () {
                        //navigation
                      },
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
