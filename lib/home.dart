import 'package:flutter/material.dart';
import 'package:weathertime/utilities/TextWidget.dart';
import 'package:weathertime/utilities/Widgets/todo.dart';
import 'package:weathertime/utilities/model/todoModel.dart';
import 'package:weathertime/utilities/screens/Colors/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todolist = ToDo.ToDoList();
  List<ToDo> _found = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    _found = todolist;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.BlackBackground,
        appBar: _buildAppBar(),
        body: Stack(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                children: [
                  SearchBox(),
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          // ignore: prefer_const_constructors
                          padding: EdgeInsets.only(
                            top: 15,
                          ),
                          margin: const EdgeInsets.only(top: 30, bottom: 15),
                          child: TextWidget(
                            text: "ToDo",
                            size: 30,
                            color: AppColors.AppWhite,
                          ),
                        ),
                        for (ToDo i in _found.reversed)
                          ToDoItems(
                            todo: i,
                            onDelete: _handleOnDelete,
                            onToDoChange: _handleChange,
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      margin: const EdgeInsets.only(
                          bottom: 20, right: 20, left: 20),
                      decoration: BoxDecoration(
                          color: AppColors.AppWhite,
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.myGrey,
                                offset: const Offset(0, 0),
                                blurRadius: 10.0,
                                spreadRadius: 0.0)
                          ],
                          borderRadius: BorderRadius.circular(15)),
                      child: TextField(
                        controller: _todoController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.wb_incandescent),
                            hintText: 'Add new ToDo',
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20, right: 15),
                    child: ElevatedButton(
                      onPressed: () {
                        _addToDo(_todoController.text);
                      },
                      child: const Icon(Icons.add),
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(45, 50), elevation: 0),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }

  void _handleOnDelete(String id) {
    setState(() {
      todolist.removeWhere((item) => item.id == id);
    });
  }

  void _handleChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _addToDo(String add) {
    setState(() {
      if (add.isEmpty) {
        Null;
      } else {
        todolist.add(ToDo(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            ToDoText: add));
        print(DateTime.now().millisecondsSinceEpoch.toString());
      }
    });
    _todoController.clear();
  }

  void _runFilter(String keyword) {
    List<ToDo> result = [];

    if (keyword.isEmpty) {
      result = todolist;
    } else {
      result = todolist
          .where((item) =>
              item.ToDoText!.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _found = result;
    });
  }

  Widget SearchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      decoration: BoxDecoration(
          color: AppColors.AppWhite, borderRadius: BorderRadius.circular(25)),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(1),
            prefixIcon: Icon(
              Icons.search,
              color: AppColors.BlackBackground,
            ),
            prefixIconConstraints:
                const BoxConstraints(maxHeight: 20, minWidth: 25),
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(
                color: AppColors.BlackBackground, fontWeight: FontWeight.w200)),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: AppColors.BlackBackground,
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        IconButton(
          color: AppColors.AppWhite,
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        Container(
          height: 40,
          width: 40,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'Assets/67D16603-D371-45D8-B5C6-3EBF2F8A5FE9_1_102_a.jpeg',
                fit: BoxFit.cover,
              )),
          // decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(20), color: Colors.black),
        )
      ]),
    );
  }
}
