// 分类数据模型
class YBClassifyItemModel {
  // 课程id
  int courseId;
  // 数据id
  int id;
  // 分类名称
  String name;
  // 排序
  int order;
  // 父类章节id
  int parentChapterId;
  // 是否显示置顶按钮（本类使用）
  bool userControlSetTop;
  // 是否有效
  int visible;
  YBClassifyItemModel.fromJson(Map<String, dynamic> json) {
    this.courseId = json["courseId"];
    this.id = json["id"];
    this.name = json["name"];
    this.order = json["order"];
    this.parentChapterId = json["parentChapterId"];
    this.userControlSetTop = json["userControlSetTop"];
    this.visible = json["visible"];
  }
}
