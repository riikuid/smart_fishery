import 'package:flutter/material.dart';
import 'package:smart_fishery/core.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget dateSuhu() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
          color: whiteColor,
          boxShadow: [
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 24,
              offset: Offset(0, 7),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sunday, 20 February 2023",
              style: primaryTextStyle.copyWith(
                fontWeight: bold,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Image.asset(
                  "assets/image_termo.png",
                  height: 30,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "15 - 18 C",
                  style: primaryTextStyle.copyWith(
                    color: successColor,
                    fontWeight: bold,
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }

    Widget layananKami() {
      return SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Column(
              children: [
                LayoutBuilder(
                  builder: (context, constraint) {
                    List menus = [
                      {
                        "icon": "assets/icon_monitoring.png",
                        "label": "Monitoring",
                        "onTap": () {
                          Navigator.pushNamed(context, '/monitoring');
                        },
                      },
                      {
                        "icon": "assets/icon_kolam.png",
                        "label": "Kolam",
                        "onTap": () {
                          Navigator.pushNamed(context, '/sign-in');
                        },
                      },
                      {
                        "icon": "assets/icon_harga_udang.png",
                        "label": "Harga Udang",
                        "onTap": () {
                          Navigator.pushNamed(context, '/harga-udang');
                        },
                      },
                      {
                        "icon": "assets/icon_belajar.png",
                        "label": "Belajar",
                        "onTap": () {
                          Navigator.pushNamed(context, '/belajar');
                        },
                      },
                      {
                        "icon": "assets/icon_konsultasi.png",
                        "label": "Konsultasi",
                        "onTap": () {
                          Navigator.pushNamed(context, '/konsultasi');
                        },
                      },
                    ];

                    return Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 15,
                      runSpacing: 20,
                      children: List.generate(
                        menus.length,
                        (index) {
                          var item = menus[index];
                          var size = constraint.biggest.width / 3.5;

                          return Column(
                            children: [
                              Container(
                                width: size,
                                height: size,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    foregroundColor: Colors.transparent,
                                    animationDuration:
                                        const Duration(milliseconds: 1000),
                                    backgroundColor: Color(0xFFB4FFFC),
                                    splashFactory: InkSplash.splashFactory,
                                    shadowColor:
                                        Colors.black26.withOpacity(0.5),
                                    elevation: 4,
                                  ),
                                  onPressed: () => item["onTap"](),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        item["icon"],
                                        width: 60,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "${item["label"]}",
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: primaryTextStyle.copyWith(
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.035, //14
                                  fontWeight: medium,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget dashboard() {
      return Container(
        // height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffF6F6F6),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        padding: EdgeInsets.symmetric(
            horizontal: 30,
            vertical: MediaQuery.of(context).size.height * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Dashboard",
              style: primaryTextStyle.copyWith(
                fontWeight: bold,
                fontSize: 16,
              ),
            ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.02,
            // ),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: bannerColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 10,
                        offset: Offset(0, 9),
                      ),
                    ],
                  ),
                  height: MediaQuery.of(context).size.width * 0.3,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cara Budidaya Udang",
                        style: primaryTextStyle.copyWith(
                          fontWeight: bold,
                          fontSize: MediaQuery.of(context).size.width * 0.035,
                          color: bannerTextColor,
                        ),
                      ),
                      Text(
                        "Tambak Kalisogo",
                        style: primaryTextStyle.copyWith(
                          fontWeight: bold,
                          fontSize: MediaQuery.of(context).size.width * 0.035,
                          color: bannerTextColor,
                        ),
                      )
                    ],
                  ),
                ),
                Image.asset(
                  'assets/image_dashboard.png',
                  width: MediaQuery.of(context).size.width * 0.4,
                )
              ],
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color(0xFFFFFFFFF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset("assets/bg_top_home.png"),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Selamat Datang,",
                            style: primaryTextStyle.copyWith(
                              fontWeight: medium,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "Marsya",
                            style: primaryTextStyle.copyWith(
                              fontWeight: bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),
                          dateSuhu(),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),
                          Text(
                            "Layanan Kami",
                            style: primaryTextStyle.copyWith(
                              fontWeight: bold,
                              fontSize: 16,
                            ),
                          ),
                          layananKami(),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),
                        ],
                      ),
                    ),
                    dashboard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
