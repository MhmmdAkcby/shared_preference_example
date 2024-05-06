import 'package:flutter/material.dart';
import 'package:shared_preference_example/cache/shared_manager.dart';
import 'package:shared_preference_example/screen/home/home_screen.dart';

abstract class HomeScreenState extends State<HomeScreen> {
  String currentValue = '';
  bool isLoading = false;
  late final SharedManager manager;

  @override
  void initState() {
    super.initState();
    manager = SharedManager();
    initilaze();
  }

  Future<void> initilaze() async {
    changeLoading();
    await manager.init();
    changeLoading();

    _defaltValue();
  }

  Future<void> _defaltValue() async {
    changeCurrentValue(manager.getString(SharedKey.action) ?? '');
  }

  void changeCurrentValue(String value) {
    setState(() {
      currentValue = value;
    });
  }

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
