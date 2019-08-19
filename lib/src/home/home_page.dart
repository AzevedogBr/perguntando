import 'package:flutter/material.dart';
import 'package:perguntando/src/home/home_module.dart';
import 'package:perguntando/src/home/pages/event/event_module.dart';
import 'package:perguntando/src/shared/card/card_widget.dart';
import 'package:perguntando/src/shared/components/drawer/custom_drawer.dart';
import 'package:perguntando/src/shared/models/event/event_model.dart';
import 'package:perguntando/src/shared/models/event_model.dart';

import 'appbar/appbar_widget.dart';
import 'background/background_widget.dart';
import 'bottom/bottom_widget.dart';
import 'home_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _bloc = HomeModule.to.getBloc<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      body: Stack(
        children: <Widget>[
          BackgroundWidget(),
          StreamBuilder<List<EventModel>>(
              stream: _bloc.eventsStream,
              builder: (context, snapshot) {
                if (!snapshot.hasData || snapshot == null) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return ListView.separated(
                  padding: EdgeInsets.fromLTRB(
                    40,
                    60 + MediaQuery.of(context).viewPadding.top,
                    40,
                    80 + MediaQuery.of(context).viewPadding.bottom,
                  ),
                  itemCount: snapshot.data.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (_,index){
                      return CardWidget(
                      title: "Flutter Talks Brasil",
                      subtitle: "São Paulo/SP",
                      date: "Hoje",
                      imageUrl:
                          "https://eventostech.com.br/wp-content/uploads/2019/06/flutter-talks-br-eventostech-800x450.jpg",
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return EventModule();
                        }));
                      },
                    );
                  },
                  separatorBuilder: (_, index){
                      return  SizedBox(height: 25);
                  },                
                );
              }),
          Positioned(
            bottom: 0,
            child: BottomWidget(),
          ),
          AppbarWidget(),
        ],
      ),
    );
  }
}
