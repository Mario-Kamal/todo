class TaskModel{
  int? id;
  String? title;
  String? task;
  TaskModel({this.id,this.title,this.task});
  TaskModel.fromDB(Map<String,dynamic> data){
    id = data['id'];
    title = data['title'];
    task = data['task'];
  }
 Map<String,dynamic> todata(){
    return {
      'title':title,
      'task':task,
      'id':id,
    };
 }

}