// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:find_mentor/core/constants/core.dart';

class OnSearchBodyList extends StatelessWidget {
  const OnSearchBodyList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext contex, intex) {
        return Column(
          children: <Widget>[
            Material(
              color: Colors.white,
              elevation: 4,
              shadowColor: Colors.black26,
              borderRadius: BorderRadius.circular(6),
              child: InkWell(
                borderRadius: BorderRadius.circular(6),
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Find Mentor',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.colorPrimary,
                        size: 18,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
