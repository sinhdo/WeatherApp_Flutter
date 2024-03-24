import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/apps/utils/const.dart';
import 'package:weather_app/models/weather.dart';

class DetailBody extends StatelessWidget {
  const DetailBody({super.key,required this.listData});
  final List<WeatherDetail> listData;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(16.0),
      itemBuilder: (context, index) {
        DateTime dateTime = DateTime.parse(listData[index].dt_txt);
        String fomatDay  = DateFormat('EEEE').format(dateTime);
        String fomatTime  = DateFormat('HH:MM').format(dateTime);
        return Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white30,
              borderRadius: BorderRadius.circular(15)
          ),
          child: Row(
            children: [
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      createTemp(listData[index].main.temp, size: 30),
                      SizedBox(width: 10),
                      Text(
                        listData[index].weather.main,
                        style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(fomatDay,style: TextStyle(fontSize: 16,color: Colors.blue),),
                  SizedBox(height: 10),
                  Text(fomatTime,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
                ],
              )),
              Container(
                width: MediaQuery.sizeOf(context).width / 4,
                child: Image.asset(
                  AssetCustom.getLinking(listData[index].weather.main),
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        );
      },
      separatorBuilder: (context, _) => SizedBox(
        height: 15,
      ),
      itemCount: 20,
    );
  }
}
