import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phase3_screens/helpers/appcolors.dart';
import 'package:phase3_screens/helpers/screen_config.dart';
import 'package:phase3_screens/helpers/size_extension.dart';
import 'package:phase3_screens/helpers/sizedbox.dart';
import 'package:phase3_screens/screens/360_profile_dashboard/controller/profile360_controller.dart';
import 'package:phase3_screens/screens/360_profile_dashboard/widgets/item_card.dart';
import 'package:provider/provider.dart';

class Profile360withoutconsent extends StatefulWidget {
  const Profile360withoutconsent({super.key});

  @override
  State<Profile360withoutconsent> createState() =>
      _Profile360withoutconsentState();
}

class _Profile360withoutconsentState extends State<Profile360withoutconsent> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<Profile360Controller>();
    ScreenUtil.getInstance().init(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        elevation: 4,
        shadowColor: AppColors.grey,
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
                            color: AppColors.lightorange,
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
                    itemCount: provider.categorylistwithoutconsent.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        setState(() {
                          provider.selectedindexwithoutconsent = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration:
                            provider.selectedindexwithoutconsent == index
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
                            provider.categorylistwithoutconsent[index]
                                .toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.roboto(
                              color:
                                  provider.selectedindexwithoutconsent == index
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
              if (provider.selectedindexwithoutconsent == 0) ...[
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
              ] else if (provider.selectedindexwithoutconsent == 1) ...[
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
              ] else if (provider.selectedindexwithoutconsent == 2) ...[
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
