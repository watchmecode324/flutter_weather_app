import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/constants/colors.dart';
import 'package:weather_app/providers/weather_data_provider.dart';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [gradient1, gradient2, gradient3],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 10,
              right: 10,
              bottom: 20,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  child: TextField(
                    onSubmitted: (value) {
                      Provider.of<WeatherDataProvider>(context, listen: false)
                          .fetchData(value);
                    },
                    style: const TextStyle(
                      color: primaryTextColor,
                      fontSize: 15,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: borderColor1,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: borderColor1,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      contentPadding: const EdgeInsets.only(left: 20),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          Provider.of<WeatherDataProvider>(context,
                                  listen: false)
                              .fetchData("Colombo");
                        },
                        child: const Icon(
                          Icons.search,
                          color: borderColor1,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Flexible(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: (Provider.of<WeatherDataProvider>(context)
                                    .weatherInfo
                                    ?.icon) ==
                                null
                            ? Container()
                            : Image.network(
                                Provider.of<WeatherDataProvider>(context)
                                    .weatherInfo!
                                    .icon),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      "${(Provider.of<WeatherDataProvider>(context).weatherInfo?.currentTemp == null) ? 0 : Provider.of<WeatherDataProvider>(context).weatherInfo!.currentTemp.toStringAsFixed(0)}",
                                  style: const TextStyle(
                                      fontSize: 70, color: primaryTextColor),
                                ),
                                const TextSpan(
                                  text: "°",
                                  style: TextStyle(
                                    fontSize: 70,
                                    color: primaryTextColor,
                                    fontFeatures: [FontFeature.superscripts()],
                                  ),
                                ),
                                const TextSpan(
                                  text: "C",
                                  style: TextStyle(
                                      fontSize: 40, color: primaryTextColor),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      "Feels like ${(Provider.of<WeatherDataProvider>(context).weatherInfo?.feelsLike == null) ? 0 : Provider.of<WeatherDataProvider>(context).weatherInfo!.feelsLike.toStringAsFixed(0)}",
                                  style: const TextStyle(
                                    color: secondaryTextColor,
                                    fontSize: 15,
                                  ),
                                ),
                                const TextSpan(
                                  text: "°",
                                  style: TextStyle(
                                    color: secondaryTextColor,
                                    fontSize: 15,
                                    fontFeatures: [FontFeature.superscripts()],
                                  ),
                                ),
                                const TextSpan(
                                  text: "c",
                                  style: TextStyle(
                                    color: secondaryTextColor,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: boredrColor2,
                            width: 5,
                          ),
                          color: secondaryBgColor),
                      child: Center(
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            ListTile(
                              leading: const BoxedIcon(
                                WeatherIcons.strong_wind,
                                color: primaryTextColor,
                              ),
                              title: const Text(
                                "Wind Speed",
                                style: TextStyle(
                                    fontSize: 15, color: primaryTextColor),
                              ),
                              trailing: Text(
                                "${(Provider.of<WeatherDataProvider>(context).weatherInfo?.windSpeed == null) ? 0 : Provider.of<WeatherDataProvider>(context).weatherInfo!.windSpeed} m/s",
                                style: const TextStyle(
                                  color: primaryTextColor,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            ListTile(
                              leading: const BoxedIcon(WeatherIcons.humidity,
                                  color: primaryTextColor),
                              title: const Text(
                                "Humidity",
                                style: TextStyle(
                                    fontSize: 15, color: primaryTextColor),
                              ),
                              trailing: Text(
                                "${(Provider.of<WeatherDataProvider>(context).weatherInfo?.humidity == null) ? 0 : Provider.of<WeatherDataProvider>(context).weatherInfo!.humidity}%",
                                style: const TextStyle(
                                  color: primaryTextColor,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            ListTile(
                              leading: const BoxedIcon(
                                WeatherIcons.cloud,
                                color: primaryTextColor,
                              ),
                              title: const Text(
                                "Clouds",
                                style: TextStyle(
                                    fontSize: 15, color: primaryTextColor),
                              ),
                              trailing: Text(
                                "${(Provider.of<WeatherDataProvider>(context).weatherInfo?.clouds == null) ? 0 : Provider.of<WeatherDataProvider>(context).weatherInfo!.clouds}%",
                                style: const TextStyle(
                                  color: primaryTextColor,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
