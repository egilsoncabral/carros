import 'package:carros/drawer_list.dart' show DrawerList;
import 'package:carros/pages/carro/carros_api.dart';
import 'package:carros/pages/carro/carros_listview.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin<HomePage>{

  TabController _tabController;

  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.index = 1;
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Carros"),
          bottom: TabBar(
            controller: _tabController,
            tabs: <Widget>[
              Tab(
                text: "Clássicos",
              ),
              Tab(
                text: "Esportivos",
              ),
              Tab(
                text: "Luxo",
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
          CarrosListView(TipoCarro.classicos),
          CarrosListView(TipoCarro.esportivos),
          CarrosListView(TipoCarro.luxo),
        ],),
        drawer: DrawerList(),
    );
  }
}
