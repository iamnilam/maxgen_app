import 'package:flutter/material.dart';
import 'package:maxgen_app/model/finanace_home_model.dart';
import 'package:maxgen_app/utils/app_color.dart';

class FinanaceHomeWidget extends StatelessWidget {
  FinanaceHomeWidget({
    super.key,
    required this.financeHomeModel,
  });
  FinanceHomeModel financeHomeModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Spacer(),
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              SizedBox(
                width: 5,
              ),
              Text(financeHomeModel.totalRating == 0
                  ? "( No Reviews )"
                  : "${financeHomeModel.rating}(${financeHomeModel.totalRating} Reviews)"),
              SizedBox(
                width: 10,
              ),
              if(financeHomeModel.saved==true)
              Row(
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                    SizedBox(
                width: 5,
              ),
              Text("Saved"),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: AppColors.greyColor,
                    child: Center(child: Text("${financeHomeModel.imgUrl}")),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      "${financeHomeModel.category}",
                      style: TextStyle(
                        color: AppColors.blackColor,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${financeHomeModel.name}",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "${financeHomeModel.description}",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.blackColor,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "${financeHomeModel.about}",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.blackColor,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.message,
                        color: AppColors.primaryColor,
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Speaks ${financeHomeModel.languageKnown!.join(', ')}",
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.blackColor,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: AppColors.primaryColor,
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        " ${financeHomeModel.location!.join(', ')}",
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(
              financeHomeModel.knownCategoryTypes!.length,
              (index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade600,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(
                        "${financeHomeModel.knownCategoryTypes![index]}",
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.greyColor,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 1, left: 5),
                        child: Text(
                          "Starting From",
                          style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "₹ 1 /Session",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                    child: Text(
                  "Book Call",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ))
            ],
          )
        ],
      ),
    );
  }
}
