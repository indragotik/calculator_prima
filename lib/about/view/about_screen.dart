import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:test_calculator/util/palette.dart';
import 'package:test_calculator/widget/StandarText.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    return Scaffold(
        body: SingleChildScrollView(
          padding: scaler.getPaddingLTRB(3, 2, 3, 1),
          child: Column(
            children: [
              Container(
                child: Stack(
                  children: [
                    Container(
                      width: scaler.getWidth(100),
                      margin: scaler.getMarginLTRB(2, 15, 2, 0),
                      padding: scaler.getPaddingLTRB(1, 5, 1, 3),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Column(
                        children: [
                          StandarText.labelCenter("Muhammad Indra Permana", scaler.getTextSize(12), Palette.primary1),
                          SizedBox(height: 5,),
                          StandarText.labelCustom("indra.starts.permana@gmail.com", scaler.getTextSize(11), fontWeight: FontWeight.normal),
                        ],
                      ),
                    ),
                    
                    Positioned(
                      top: 50.0,
                      left: 110.0,
                      child: Container(
                        width: scaler.getWidth(25),
                        height: scaler.getWidth(25),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                            image: AssetImage("assets/images/profile.jpg"),
                            fit: BoxFit.cover
                          )
                        ),
                      )
                    )
                  ],
                ),
              ),

              Container(
                width: scaler.getWidth(100),
                margin: scaler.getMarginLTRB(2, 2, 2, 0),
                padding: scaler.getPaddingLTRB(2, 2, 2, 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StandarText.label("Data Diri", scaler.getTextSize(12), Palette.primary1),

                    Container(
                      width: scaler.getWidth(100),
                      margin: scaler.getMarginLTRB(0, 1, 0, 0),
                      padding: scaler.getPaddingLTRB(1, 0, 1, 1),
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.black12))
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StandarText.labelCustom("Email", scaler.getTextSize(11)),
                          StandarText.labelCustom("indra.starts.permana@gmail.com", scaler.getTextSize(10), fontWeight: FontWeight.normal)
                        ],
                      )
                    ),

                    Container(
                      width: scaler.getWidth(100),
                      margin: scaler.getMarginLTRB(0, 1, 0, 0),
                      padding: scaler.getPaddingLTRB(1, 0, 1, 1),
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.black12))
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StandarText.labelCustom("No Hp", scaler.getTextSize(11)),
                          StandarText.labelCustom("087887772233", scaler.getTextSize(10), fontWeight: FontWeight.normal)
                        ],
                      )
                    ),
                    
                    Container(
                      width: scaler.getWidth(100),
                      margin: scaler.getMarginLTRB(0, 1, 0, 0),
                      padding: scaler.getPaddingLTRB(1, 0, 1, 1),
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.black12))
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StandarText.labelCustom("Alamat", scaler.getTextSize(11)),
                          StandarText.labelCustom("Komp. Permata Hijau D.89 RT 03 RW 18 Kel. Jelegong Kec. Rancaekek Kab. Bandung", scaler.getTextSize(10), fontWeight: FontWeight.normal)
                        ],
                      )
                    ),
                  ],
                ),
              ),

              Container(
                width: scaler.getWidth(100),
                margin: scaler.getMarginLTRB(2, 2, 2, 0),
                padding: scaler.getPaddingLTRB(2, 2, 2, 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StandarText.label("Sosial Media", scaler.getTextSize(12), Palette.primary1),

                    Container(
                      width: scaler.getWidth(100),
                      margin: scaler.getMarginLTRB(0, 1, 0, 0),
                      padding: scaler.getPaddingLTRB(1, 0, 1, 1),
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.black12))
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StandarText.labelCustom("Github", scaler.getTextSize(11)),
                          InkWell(
                            onTap: () async {
                              const url = 'https://github.com/indragotik';
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            child: StandarText.labelCustom("https://github.com/indragotik", scaler.getTextSize(10), color: Palette.primary2, fontWeight: FontWeight.normal),
                          )
                        ],
                      )
                    ),

                    Container(
                      width: scaler.getWidth(100),
                      margin: scaler.getMarginLTRB(0, 1, 0, 0),
                      padding: scaler.getPaddingLTRB(1, 0, 1, 1),
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.black12))
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StandarText.labelCustom("GitLab", scaler.getTextSize(11)),
                          InkWell(
                            onTap: () async {
                              const url = 'https://gitlab.com/indrapermana';
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            child: StandarText.labelCustom("https://gitlab.com/indrapermana", scaler.getTextSize(10), color: Palette.primary2, fontWeight: FontWeight.normal),
                          )
                        ],
                      )
                    ),
                    
                    Container(
                      width: scaler.getWidth(100),
                      margin: scaler.getMarginLTRB(0, 1, 0, 0),
                      padding: scaler.getPaddingLTRB(1, 0, 1, 1),
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.black12))
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StandarText.labelCustom("Linkedin", scaler.getTextSize(11)),
                          InkWell(
                            onTap: () async {
                              const url = 'https://www.linkedin.com/in/indra-permana-02644485';
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            child: StandarText.labelCustom("https://www.linkedin.com/in/indra-permana-02644485/", scaler.getTextSize(10), color: Palette.primary2, fontWeight: FontWeight.normal),
                          )
                        ],
                      )
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