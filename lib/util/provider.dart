import 'package:flutter/material.dart';
import 'package:offer_show/asset/data.dart';
import 'package:offer_show/components/salary.dart';
import 'package:offer_show/components/tip.dart';
import 'package:offer_show/util/interface.dart';
import 'package:provider/provider.dart';

class MainProvider extends ChangeNotifier {
  int curNum = 0;
  add() {
    curNum++;
    notifyListeners();
  }

  minus() {
    curNum--;
    notifyListeners();
  }
}

//搜索
class SearchProvider extends ChangeNotifier {
  TextEditingController searchController = new TextEditingController();
  bool getDone = false;
  Widget column = new Column();

  getSearchSalary() async {
    final res = await Api().webapi_v2_search_salary(param: {
      "content": searchController.text,
      "education": "全部",
      "ordertype": 2,
      "part_school": "",
      "search_priority": 1,
      "year": "",
    });
    final tmp = toLocalSalary(res['info']);
    List<Widget> tmpWidget = [];
    tmp.forEach((element) {
      tmpWidget.add(OSSalary(
        data: new SalaryData(
          company: element["company"].toString(),
          city: element["city"].toString(),
          confidence: element["confidence"].toString(),
          education: element["education"].toString(),
          money: element["money"].toString(),
          job: element["job"].toString(),
          remark: element["remark"].toString(),
          look: element["look"].toString(),
          salaryLow: element["salaryLow"].toString(),
          salaryHigh: element["salaryHigh"].toString(),
          time: element["time"].toString(),
          industry: element["industry"].toString(),
          type: element["type"].toString(),
          salaryId: element["salaryId"].toString(),
        ),
      ));
    });
    column = Column(children: tmpWidget);
    getDone = true;
    notifyListeners();
  }

  search() {
    getSearchSalary();
    print(searchController.text);
    notifyListeners();
  }

  getInput() {
    notifyListeners();
  }

  clearInput() {
    searchController.clear();
    getDone = false;
    column = new Column();
    notifyListeners();
  }
}

//首页实习数据管理员
class HomePartSalarys extends ChangeNotifier {
  bool getDone = false;
  List<SalaryData> salarys = [];
  Widget column = new Column();

  Future<Widget> getPartSalary(BuildContext context) async {
    final res = await Api().webapi_v2_offers_4_lr(
      param: {
        "xueli": "",
        "salarytype": "实习",
        "hangye": "",
        "limit": 50,
      },
    );
    final tmp = toLocalSalary(res['info']);
    List<Widget> tmpWidget = [];
    tmp.forEach((element) {
      tmpWidget.add(OSSalary(
        data: new SalaryData(
          company: element["company"].toString(),
          city: element["city"].toString(),
          confidence: element["confidence"].toString(),
          education: element["education"].toString(),
          money: element["money"].toString(),
          job: element["job"].toString(),
          remark: element["remark"].toString(),
          look: element["look"].toString(),
          salaryLow: element["salaryLow"].toString(),
          salaryHigh: element["salaryHigh"].toString(),
          time: element["time"].toString(),
          industry: element["industry"].toString(),
          type: element["type"].toString(),
          salaryId: element["salaryId"].toString(),
        ),
      ));
    });
    column = Column(children: tmpWidget);
    getDone = true;
    notifyListeners();
    return Container();
  }
}

//首页校招数据管理员
class HomeSchoolSalarys extends ChangeNotifier {
  bool getDone = false;
  List<SalaryData> salarys = [];
  Widget column = new Column();

  Future<Widget> getHomeSalary(BuildContext context) async {
    FilterSchool provider = Provider.of<FilterSchool>(context, listen: false);
    final edu = education[provider.tipIndex2] == "全部"
        ? ""
        : education[provider.tipIndex2];
    final ind = industry[provider.tipIndex1] == "全部"
        ? ""
        : industry[provider.tipIndex1];
    final res = await Api().webapi_v2_offers_4_lr(
      param: {
        "xueli": edu,
        "salarytype": "校招",
        "hangye": ind,
        "limit": 50,
      },
    );
    final tmp = toLocalSalary(res['info']);
    List<Widget> tmpWidget = [];
    tmp.forEach((element) {
      tmpWidget.add(OSSalary(
        data: new SalaryData(
          company: element["company"].toString(),
          city: element["city"].toString(),
          confidence: element["confidence"].toString(),
          education: element["education"].toString(),
          money: element["money"].toString(),
          job: element["job"].toString(),
          remark: element["remark"].toString(),
          look: element["look"].toString(),
          salaryLow: element["salaryLow"].toString(),
          salaryHigh: element["salaryHigh"].toString(),
          time: element["time"].toString(),
          industry: element["industry"].toString(),
          type: element["type"].toString(),
          salaryId: element["salaryId"].toString(),
        ),
      ));
    });
    column = Column(children: tmpWidget);
    getDone = true;
    notifyListeners();
    return Container();
  }

  List<Widget> buildSalary() {}
}

class FilterSchool extends ChangeNotifier {
  bool isOpen = false;
  int mainIndex = 0;
  int tipIndex1 = 0;
  int tipIndex2 = 0;

  show() {
    print("mainIndex:${mainIndex},tipIndex:${tipIndex1},${tipIndex2}");
  }

  setMainIndex(index) {
    mainIndex = index;
    notifyListeners();
  }

  setTipIndex1(index) {
    tipIndex1 = index;
    notifyListeners();
  }

  setTipIndex2(index) {
    tipIndex2 = index;
    notifyListeners();
  }

  open() {
    isOpen = true;
    notifyListeners();
  }

  close() {
    isOpen = false;
    notifyListeners();
  }
}

class HomeTabIndex extends ChangeNotifier {
  PageController controller = new PageController(initialPage: 0);
  int tabIndex = 0;
  setIndex(int index) {
    tabIndex = index;
    notifyListeners();
  }

  switchTab(int index) {
    tabIndex = index;
    controller.animateToPage(
      tabIndex,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }
}

class KeyBoard extends ChangeNotifier {
  bool isOpen = false;
  bool isFocus = false;
  TextEditingController editingController = new TextEditingController();
  String nowSalaryId;
  FocusNode focusNode = new FocusNode();

  foucs(context) {
    focusNode.requestFocus();
    notifyListeners();
  }

  unfocus() {
    focusNode.unfocus();
    notifyListeners();
  }

  setNowSalaryId(String t) {
    nowSalaryId = t;
    notifyListeners();
  }

  getNowSalaryId() {
    return nowSalaryId;
  }

  open() {
    isOpen = true;
    notifyListeners();
  }

  close() {
    isOpen = false;
    notifyListeners();
  }
}