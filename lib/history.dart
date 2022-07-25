
class History {
  final int id;
  final String content;
  final String result;

  History({required this.id,required this.content,required this.result});

  Map<String,dynamic> toMap(){
    return{
      'id' : id,
      'content' :content,
      'result' : result,
    };
  }

  @override
  String toString() {
    return 'History {id: $id, content: $content, result : $result }';
  }
}