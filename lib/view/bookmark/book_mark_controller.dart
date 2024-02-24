import 'package:get/get.dart';
import 'package:newshunt/model/book_mark_item_model.dart';
import 'package:newshunt/model/top_headline_model.dart';

class BookMarkController extends GetxController {
  RxList<BookMarkiteItem> bookMarkList = <BookMarkiteItem>[].obs;

  void addToBookMark(ArticleTHL? articleitem) {
    var existingFavoriteItem = bookMarkList
        .indexWhere((item) => item.article!.title == articleitem!.title);
    if (existingFavoriteItem != -1) {
      return;
    } else {
      bookMarkList.add(BookMarkiteItem(article: articleitem));
    }
    update();
  }

  void removeBookitem(int index) {
    if (index >= 0 && index < bookMarkList.length) {
      bookMarkList.removeAt(index);
      update();
    }
  }

  int get bookmarkcount {
    return bookMarkList.length;
  }
}
