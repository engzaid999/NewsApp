import 'package:news_app/modal/category_modal.dart';

List<CategoryModal> getCategories (){

  List<CategoryModal> myCategories = []; // List is empty
  CategoryModal objectCategory ; // create object from categoryModal class

  //1
  objectCategory = CategoryModal();    //object from CategoryModal class
  objectCategory.categoryName='Business';
  objectCategory.imageUrl='assets/images/bussiness.jpg';
  myCategories.add(objectCategory);  //add item to myCategories list

  //2
  objectCategory = CategoryModal();
  objectCategory.categoryName ='Entertainment';
  objectCategory.imageUrl ='assets/images/Enteraniment.jpg';
  myCategories.add(objectCategory);

  //3
  objectCategory = CategoryModal();
  objectCategory.categoryName='General';
  objectCategory.imageUrl='assets/images/general.jpg';
  myCategories.add(objectCategory);

  //4
  objectCategory = CategoryModal();
  objectCategory.categoryName='Health';
  objectCategory.imageUrl='assets/images/Health.jpeg';
  myCategories.add(objectCategory);

  //5
  objectCategory = CategoryModal();
  objectCategory.categoryName='Science';
  objectCategory.imageUrl='assets/images/science.jpg';
  myCategories.add(objectCategory);

  //6
  objectCategory = CategoryModal();
  objectCategory.categoryName='Sports';
  objectCategory.imageUrl='assets/images/Sport.jpg';
  myCategories.add(objectCategory);

  //7
  objectCategory = CategoryModal();
  objectCategory.categoryName='Technology';
  objectCategory.imageUrl='assets/images/tech.jpg';
  myCategories.add(objectCategory);

  return myCategories; // more important this line (لاعادة القائمة مع العناصر)

}
