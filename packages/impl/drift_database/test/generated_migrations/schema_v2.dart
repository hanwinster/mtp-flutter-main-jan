// GENERATED CODE, DO NOT EDIT BY HAND.
// ignore_for_file: type=lint
//@dart=2.12
import 'package:drift/drift.dart';

class BlogPosts extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  BlogPosts(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> slug = GeneratedColumn<String>(
      'slug', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> bodyUpper = GeneratedColumn<String>(
      'body_upper', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> blockQuote = GeneratedColumn<String>(
      'block_quote', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> bodyLower = GeneratedColumn<String>(
      'body_lower', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> privacy = GeneratedColumn<String>(
      'privacy', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<int> viewCount = GeneratedColumn<int>(
      'view_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<int> shareCount = GeneratedColumn<int>(
      'share_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<String> shareLink = GeneratedColumn<String>(
      'share_link', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<int> duration = GeneratedColumn<int>(
      'duration', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<String> durationUnit = GeneratedColumn<String>(
      'duration_unit', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> featuredVideo = GeneratedColumn<String>(
      'featured_video', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<bool> isDisplayVideo = GeneratedColumn<bool>(
      'is_display_video', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_display_video" IN (0, 1))'));
  late final GeneratedColumn<String> videoLink = GeneratedColumn<String>(
      'video_link', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
      'author', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<bool> hasRead = GeneratedColumn<bool>(
      'has_read', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("has_read" IN (0, 1))'));
  late final GeneratedColumn<int> numberOfReactions = GeneratedColumn<int>(
      'number_of_reactions', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<int> numberOfComments = GeneratedColumn<int>(
      'number_of_comments', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<int> overallScore = GeneratedColumn<int>(
      'overall_score', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<bool> hasQuiz = GeneratedColumn<bool>(
      'has_quiz', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("has_quiz" IN (0, 1))'));
  late final GeneratedColumn<String> categories = GeneratedColumn<String>(
      'categories', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
      'tags', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> currentReaction = GeneratedColumn<String>(
      'current_reaction', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> postReactions = GeneratedColumn<String>(
      'post_reactions', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        slug,
        title,
        bodyUpper,
        blockQuote,
        bodyLower,
        privacy,
        viewCount,
        shareCount,
        shareLink,
        duration,
        durationUnit,
        imageUrl,
        featuredVideo,
        isDisplayVideo,
        videoLink,
        author,
        hasRead,
        numberOfReactions,
        numberOfComments,
        overallScore,
        hasQuiz,
        categories,
        tags,
        currentReaction,
        postReactions,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'blog_posts';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  BlogPosts createAlias(String alias) {
    return BlogPosts(attachedDatabase, alias);
  }
}

class BlogPostQueries extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  BlogPostQueries(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> query = GeneratedColumn<String>(
      'query', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> ids = GeneratedColumn<String>(
      'ids', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [query, ids];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'blog_post_queries';
  @override
  Set<GeneratedColumn> get $primaryKey => {query};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  BlogPostQueries createAlias(String alias) {
    return BlogPostQueries(attachedDatabase, alias);
  }
}

class BlogPostComments extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  BlogPostComments(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> postId = GeneratedColumn<String>(
      'post_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> comment = GeneratedColumn<String>(
      'comment', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> user = GeneratedColumn<String>(
      'user', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> currentReaction = GeneratedColumn<String>(
      'current_reaction', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> videoUrl = GeneratedColumn<String>(
      'video_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<int> replyCount = GeneratedColumn<int>(
      'reply_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<int> numberOfReactions = GeneratedColumn<int>(
      'number_of_reactions', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        postId,
        comment,
        user,
        currentReaction,
        imageUrl,
        videoUrl,
        replyCount,
        numberOfReactions,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'blog_post_comments';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  BlogPostComments createAlias(String alias) {
    return BlogPostComments(attachedDatabase, alias);
  }
}

class BlogPostCategories extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  BlogPostCategories(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
      'active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("active" IN (0, 1))'));
  late final GeneratedColumn<int> numberOfArticles = GeneratedColumn<int>(
      'number_of_articles', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<int> numberOfPublicArticles = GeneratedColumn<int>(
      'number_of_public_articles', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        active,
        numberOfArticles,
        numberOfPublicArticles,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'blog_post_categories';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  BlogPostCategories createAlias(String alias) {
    return BlogPostCategories(attachedDatabase, alias);
  }
}

class CourseAssessmentQuestions extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CourseAssessmentQuestions(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> courseId = GeneratedColumn<String>(
      'course_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> question = GeneratedColumn<String>(
      'question', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> options = GeneratedColumn<String>(
      'options', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> correctAnswers = GeneratedColumn<String>(
      'correct_answers', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<int> order = GeneratedColumn<int>(
      'order', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> passingOption = GeneratedColumn<String>(
      'passing_option', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> userAnswer = GeneratedColumn<String>(
      'user_answer', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        courseId,
        question,
        options,
        correctAnswers,
        order,
        type,
        passingOption,
        userAnswer,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'course_assessment_questions';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  CourseAssessmentQuestions createAlias(String alias) {
    return CourseAssessmentQuestions(attachedDatabase, alias);
  }
}

class CourseCategories extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CourseCategories(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'course_categories';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  CourseCategories createAlias(String alias) {
    return CourseCategories(attachedDatabase, alias);
  }
}

class Courses extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Courses(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> objective = GeneratedColumn<String>(
      'objective', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> learningOutcome = GeneratedColumn<String>(
      'learning_outcome', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> coverImage = GeneratedColumn<String>(
      'cover_image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> urlLink = GeneratedColumn<String>(
      'url_link', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<bool> isDisplayVideo = GeneratedColumn<bool>(
      'is_display_video', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_display_video" IN (0, 1))'));
  late final GeneratedColumn<String> videoUrl = GeneratedColumn<String>(
      'video_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> categories = GeneratedColumn<String>(
      'categories', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> downloadableOption =
      GeneratedColumn<String>('downloadable_option', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> courseLevel = GeneratedColumn<String>(
      'course_level', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> courseType = GeneratedColumn<String>(
      'course_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<bool> isAllowFeedback = GeneratedColumn<bool>(
      'is_allow_feedback', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_allow_feedback" IN (0, 1))'));
  late final GeneratedColumn<bool> isAllowDiscussion = GeneratedColumn<bool>(
      'is_allow_discussion', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_allow_discussion" IN (0, 1))'));
  late final GeneratedColumn<String> discussion = GeneratedColumn<String>(
      'discussion', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<int> acceptableScoreForAssignment =
      GeneratedColumn<int>(
          'acceptable_score_for_assignment', aliasedName, false,
          type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<int> acceptableScoreForAssessment =
      GeneratedColumn<int>(
          'acceptable_score_for_assessment', aliasedName, false,
          type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<String> estimatedDuration =
      GeneratedColumn<String>('estimated_duration', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<int> numberOfEnrollments = GeneratedColumn<int>(
      'number_of_enrollments', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<int> totalLectures = GeneratedColumn<int>(
      'total_lectures', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<int> totalQuizzes = GeneratedColumn<int>(
      'total_quizzes', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<int> viewCount = GeneratedColumn<int>(
      'view_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<double> rating = GeneratedColumn<double>(
      'rating', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  late final GeneratedColumn<String> courseOrderType = GeneratedColumn<String>(
      'course_order_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> lectureOrderType = GeneratedColumn<String>(
      'lecture_order_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> courseOrder = GeneratedColumn<String>(
      'course_order', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> lectureOrderByLectureId =
      GeneratedColumn<String>('lecture_order_by_lecture_id', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> evaluationMessage =
      GeneratedColumn<String>('evaluation_message', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<bool> isXApiCourse = GeneratedColumn<bool>(
      'is_x_api_course', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_x_api_course" IN (0, 1))'));
  late final GeneratedColumn<String> resourceFileUrl = GeneratedColumn<String>(
      'resource_file_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<bool> hasUserTakenCourse = GeneratedColumn<bool>(
      'has_user_taken_course', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("has_user_taken_course" IN (0, 1))'));
  late final GeneratedColumn<bool> isUserCanAccessCourse =
      GeneratedColumn<bool>('is_user_can_access_course', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("is_user_can_access_course" IN (0, 1))'));
  late final GeneratedColumn<String> createdBy = GeneratedColumn<String>(
      'created_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        description,
        objective,
        learningOutcome,
        coverImage,
        urlLink,
        isDisplayVideo,
        videoUrl,
        categories,
        downloadableOption,
        courseLevel,
        courseType,
        isAllowFeedback,
        isAllowDiscussion,
        discussion,
        acceptableScoreForAssignment,
        acceptableScoreForAssessment,
        estimatedDuration,
        numberOfEnrollments,
        totalLectures,
        totalQuizzes,
        viewCount,
        rating,
        courseOrderType,
        lectureOrderType,
        courseOrder,
        lectureOrderByLectureId,
        evaluationMessage,
        isXApiCourse,
        resourceFileUrl,
        hasUserTakenCourse,
        isUserCanAccessCourse,
        createdBy,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'courses';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  Courses createAlias(String alias) {
    return Courses(attachedDatabase, alias);
  }
}

class CourseLearners extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CourseLearners(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> courseId = GeneratedColumn<String>(
      'course_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<int> percentage = GeneratedColumn<int>(
      'percentage', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  late final GeneratedColumn<int> notifyCount = GeneratedColumn<int>(
      'notify_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'));
  late final GeneratedColumn<String> completionStatusByMaterialKey =
      GeneratedColumn<String>(
          'completion_status_by_material_key', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<bool> isReadyToEvaluate = GeneratedColumn<bool>(
      'is_ready_to_evaluate', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_ready_to_evaluate" IN (0, 1))'));
  late final GeneratedColumn<bool> isReadyToGenerateCertificate =
      GeneratedColumn<bool>(
          'is_ready_to_generate_certificate', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("is_ready_to_generate_certificate" IN (0, 1))'));
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        courseId,
        userId,
        status,
        percentage,
        notifyCount,
        isActive,
        completionStatusByMaterialKey,
        isReadyToEvaluate,
        isReadyToGenerateCertificate,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'course_learners';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  CourseLearners createAlias(String alias) {
    return CourseLearners(attachedDatabase, alias);
  }
}

class OfflineCourses extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  OfflineCourses(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> courseId = GeneratedColumn<String>(
      'course_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [courseId, createdAt, updatedAt, deletedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'offline_courses';
  @override
  Set<GeneratedColumn> get $primaryKey => {courseId};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  OfflineCourses createAlias(String alias) {
    return OfflineCourses(attachedDatabase, alias);
  }
}

class OfflineCourseMedia extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  OfflineCourseMedia(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<String> courseId = GeneratedColumn<String>(
      'course_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> thumbnail = GeneratedColumn<String>(
      'thumbnail', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, courseId, url, title, thumbnail, createdAt, updatedAt, deletedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'offline_course_media';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {courseId, url},
      ];
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  OfflineCourseMedia createAlias(String alias) {
    return OfflineCourseMedia(attachedDatabase, alias);
  }
}

class CourseDownloadStatus extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CourseDownloadStatus(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> courseId = GeneratedColumn<String>(
      'course_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> downloadTaskId = GeneratedColumn<String>(
      'download_task_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> downloadRecordJson =
      GeneratedColumn<String>('download_record_json', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<bool> isHandled = GeneratedColumn<bool>(
      'is_handled', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_handled" IN (0, 1))'),
      defaultValue: const Constant(false));
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        courseId,
        downloadTaskId,
        downloadRecordJson,
        isHandled,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'course_download_status';
  @override
  Set<GeneratedColumn> get $primaryKey => {courseId};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  CourseDownloadStatus createAlias(String alias) {
    return CourseDownloadStatus(attachedDatabase, alias);
  }
}

class Lectures extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Lectures(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> resourceUrl = GeneratedColumn<String>(
      'resource_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> resourceType = GeneratedColumn<String>(
      'resource_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> videoUrl = GeneratedColumn<String>(
      'video_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> attachedFileUrl = GeneratedColumn<String>(
      'attached_file_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> courseId = GeneratedColumn<String>(
      'course_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> media = GeneratedColumn<String>(
      'media', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> interactiveFeatures =
      GeneratedColumn<String>('interactive_features', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        resourceUrl,
        description,
        resourceType,
        videoUrl,
        attachedFileUrl,
        courseId,
        media,
        interactiveFeatures,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'lectures';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  Lectures createAlias(String alias) {
    return Lectures(attachedDatabase, alias);
  }
}

class LearningActivities extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  LearningActivities(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> media = GeneratedColumn<String>(
      'media', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> courseId = GeneratedColumn<String>(
      'course_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> lectureId = GeneratedColumn<String>(
      'lecture_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> interactiveFeatures =
      GeneratedColumn<String>('interactive_features', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        description,
        media,
        courseId,
        lectureId,
        interactiveFeatures,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'learning_activities';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  LearningActivities createAlias(String alias) {
    return LearningActivities(attachedDatabase, alias);
  }
}

class LearningSummaries extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  LearningSummaries(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> media = GeneratedColumn<String>(
      'media', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> lectureId = GeneratedColumn<String>(
      'lecture_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> courseId = GeneratedColumn<String>(
      'course_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> interactiveFeatures =
      GeneratedColumn<String>('interactive_features', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        description,
        media,
        lectureId,
        courseId,
        interactiveFeatures,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'learning_summaries';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  LearningSummaries createAlias(String alias) {
    return LearningSummaries(attachedDatabase, alias);
  }
}

class LearningQuizzes extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  LearningQuizzes(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> lectureId = GeneratedColumn<String>(
      'lecture_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> courseId = GeneratedColumn<String>(
      'course_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<bool> isTryAgain = GeneratedColumn<bool>(
      'is_try_again', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_try_again" IN (0, 1))'));
  late final GeneratedColumn<String> questions = GeneratedColumn<String>(
      'questions', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        lectureId,
        courseId,
        type,
        isTryAgain,
        questions,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'learning_quizzes';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  LearningQuizzes createAlias(String alias) {
    return LearningQuizzes(attachedDatabase, alias);
  }
}

class UserCourses extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  UserCourses(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> courseId = GeneratedColumn<String>(
      'course_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> learnerId = GeneratedColumn<String>(
      'learner_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [courseId, learnerId, createdAt, updatedAt, deletedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_courses';
  @override
  Set<GeneratedColumn> get $primaryKey => {courseId, learnerId};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  UserCourses createAlias(String alias) {
    return UserCourses(attachedDatabase, alias);
  }
}

class LiveSessions extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  LiveSessions(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> courseId = GeneratedColumn<String>(
      'course_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> lectureId = GeneratedColumn<String>(
      'lecture_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> topic = GeneratedColumn<String>(
      'topic', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> meetingId = GeneratedColumn<String>(
      'meeting_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<DateTime> startDateTime =
      GeneratedColumn<DateTime>('start_date_time', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  late final GeneratedColumn<String> agenda = GeneratedColumn<String>(
      'agenda', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<bool> isHostVideoEnabled = GeneratedColumn<bool>(
      'is_host_video_enabled', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_host_video_enabled" IN (0, 1))'));
  late final GeneratedColumn<bool> isParticipantVideoEnabled =
      GeneratedColumn<bool>('is_participant_video_enabled', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("is_participant_video_enabled" IN (0, 1))'));
  late final GeneratedColumn<int> durationInMinutes = GeneratedColumn<int>(
      'duration_in_minutes', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> passcode = GeneratedColumn<String>(
      'passcode', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> startUrl = GeneratedColumn<String>(
      'start_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> joinUrl = GeneratedColumn<String>(
      'join_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        courseId,
        lectureId,
        topic,
        meetingId,
        startDateTime,
        agenda,
        isHostVideoEnabled,
        isParticipantVideoEnabled,
        durationInMinutes,
        description,
        passcode,
        status,
        startUrl,
        joinUrl,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'live_sessions';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  LiveSessions createAlias(String alias) {
    return LiveSessions(attachedDatabase, alias);
  }
}

class DatabaseAtV2 extends GeneratedDatabase {
  DatabaseAtV2(QueryExecutor e) : super(e);
  late final BlogPosts blogPosts = BlogPosts(this);
  late final BlogPostQueries blogPostQueries = BlogPostQueries(this);
  late final BlogPostComments blogPostComments = BlogPostComments(this);
  late final BlogPostCategories blogPostCategories = BlogPostCategories(this);
  late final CourseAssessmentQuestions courseAssessmentQuestions =
      CourseAssessmentQuestions(this);
  late final CourseCategories courseCategories = CourseCategories(this);
  late final Courses courses = Courses(this);
  late final CourseLearners courseLearners = CourseLearners(this);
  late final OfflineCourses offlineCourses = OfflineCourses(this);
  late final OfflineCourseMedia offlineCourseMedia = OfflineCourseMedia(this);
  late final CourseDownloadStatus courseDownloadStatus =
      CourseDownloadStatus(this);
  late final Lectures lectures = Lectures(this);
  late final LearningActivities learningActivities = LearningActivities(this);
  late final LearningSummaries learningSummaries = LearningSummaries(this);
  late final LearningQuizzes learningQuizzes = LearningQuizzes(this);
  late final UserCourses userCourses = UserCourses(this);
  late final LiveSessions liveSessions = LiveSessions(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        blogPosts,
        blogPostQueries,
        blogPostComments,
        blogPostCategories,
        courseAssessmentQuestions,
        courseCategories,
        courses,
        courseLearners,
        offlineCourses,
        offlineCourseMedia,
        courseDownloadStatus,
        lectures,
        learningActivities,
        learningSummaries,
        learningQuizzes,
        userCourses,
        liveSessions
      ];
  @override
  int get schemaVersion => 2;
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}
