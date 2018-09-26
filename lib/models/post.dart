
class Post {
 final int id;
 final int author;
 final String title;
 final String date;
 final String dateStr;
 final String link;
 final String authorName;
 final String excerpt;
 final String commentNums;
 final String thumbnailurl;
 final String featuredimgurl;

 Post({this.id, this.author, this.title, this.date, this.dateStr, this.link, this.authorName, this.excerpt, this.commentNums, this.thumbnailurl, this.featuredimgurl});

 factory Post.fromJson(Map<String, dynamic> json) {
   return Post(
     id: json['id'],
     author: json['author'],
     title: json['title'],
     date: json['date'],
     dateStr: json['dateStr'],
     link: json['link'],
     authorName: json['authorName'],
     excerpt: json['excerpt'],
     commentNums: json['commentNums'],
     thumbnailurl: json['thumbnailurl'],
     featuredimgurl: json['featuredimgurl'],
   );
 }
}
