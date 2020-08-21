
import 'package:flutter/material.dart';
import 'package:negai_frontend_main/app/viewmodels/viewmodel.dart';

class ItemPanelViewModel implements ViewModel {
  
  bool isExpanded;
  String header;
  Widget body;
  IconData iconpic;
  
  ItemPanelViewModel({this.isExpanded, this.header, this.body, this.iconpic});

  ItemPanelViewModel.fromJson(Map<String, dynamic> json) {
    isExpanded = json['isExpanded'];
    header = json['header'];
    body = json['body'];
    iconpic = json['iconpic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isExpanded'] = this.isExpanded;
    data['header'] = this.header;
    data['body'] = this.body;
    data['iconpic'] = this.iconpic;
    return data;
  }
}