import 'package:database/database.dart';

mixin BlogDaoMixin {
  BlogPostDao get blogPostDao;

  BlogPostCommentDao get blogPostCommentDao;

  BlogPostCategoryDao get blogPostCategoryDao;
}
