// 单体文章的数据模型
class YBArticleItemModel {
  // app下载链接
  String apkLink;
  // 是否审核
  int audit;
  // 作者
  String author;
  // 能否编辑
  bool canEdit;
  // 文章id
  int chapterId;
  // 文章标题
  String chapterName;
  // 是否收藏
  bool collect;
  // 课程id
  int courseId;
  // 描述
  String desc;
  String descMd;
  //
  String envelopePic;
  //
  bool fresh;
  // 数据id
  int id;
  // 链接地址
  String link;
  // 点赞时间
  String niceDate;
  // 分享时间
  String niceShareDate;
  //
  int shareDate;
  String shareUser;
  String origin;
  String prefix;
  String projectLink;
  int superChapterId;
  String superChapterName;
  List<YBArticleItemTagModel> tags;
  String title;
  int type;
  int userId;
  int visible;
  int zan;
  // 发布时间
  int publishTime;
  int selfVisible;
  YBArticleItemModel.fromJson(Map<String, dynamic> json) {
    this.apkLink = json["apkLink"];
    this.audit = json["audit"];
    this.author = json["author"];
    this.canEdit = json["canEdit"];
    this.chapterId = json["chapterId"];
    this.chapterName = json["chapterName"];
    this.collect = json["collect"];
    this.courseId = json["courseId"];
    this.desc = json["desc"];
    this.descMd = json["descMd"];
    this.envelopePic = json["envelopePic"];
    this.fresh = json["fresh"];
    this.id = json["id"];
    this.link = json["link"];
    this.niceDate = json["niceDate"];
    this.niceShareDate = json["niceShareDate"];
    this.origin = json["origin"];
    this.prefix = json["prefix"];
    this.projectLink = json["projectLink"];
    this.publishTime = json["publishTime"];
    this.selfVisible = json["selfVisible"];
    this.shareDate = json["shareDate"];
    this.shareUser = json["shareUser"];
    this.superChapterId = json["superChapterId"];
    this.superChapterName = json["superChapterName"];
    this.title = json["title"];
    this.type = json["type"];
    this.userId = json["userId"];
    this.visible = json["visible"];
    this.zan = json["zan"];

    List tags = json["tags"];
    this.tags = tags.map((tagItem) {
      return YBArticleItemTagModel.fromJson(tagItem);
    }).toList();
  }
}

// 文章类型标签
class YBArticleItemTagModel {
  String name;
  String url;

  YBArticleItemTagModel.fromJson(Map<String, dynamic> json) {
    this.name = json["name"];
    this.url = json["url"];
  }
}
