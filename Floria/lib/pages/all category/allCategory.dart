import 'package:flutter/material.dart';
import 'package:project_test/data/data.dart' as data;

class AllCategory extends StatefulWidget {
  const AllCategory({Key? key}) : super(key: key);

  @override
  State<AllCategory> createState() => _AllCategoryState();
}

class _AllCategoryState extends State<AllCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "All Products",
          style: TextStyle(
              color: Color(0xffC33355),
              // fontFamily: "Yeseva One",
              fontWeight: FontWeight.bold),
        ),
        surfaceTintColor: Colors.transparent,
        leading: Padding(
          padding: EdgeInsets.only(left: 16),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xffC33355),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: GridView.builder(
        padding:
            const EdgeInsets.only(top: 45, left: 30, right: 30, bottom: 20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 13.0,
          mainAxisSpacing: 60,
        ),
        itemCount: data.allProduct.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Column(
              children: [
                SizedBox(
                  width: 120,
                  height: 110,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xFFF4E7EA),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: OverflowBox(
                      maxWidth: 160,
                      maxHeight: 160,
                      child: Transform.translate(
                        offset: Offset(5.0, -21.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/images/flower/" +
                                data.allProduct[index].image,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 10),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          data.allProduct[index].name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          data.allProduct[index].price.toString() + " Baht",
                          style: TextStyle(color: Color(0xffB1B1B1)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
