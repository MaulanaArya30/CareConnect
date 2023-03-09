// import 'package:cloud_firestore/cloud_firestore.dart';

// class Book {
//   final String title;
//   final String author;
//   final String description;

//   Book({required this.title, required this.author, required this.description});

//   factory Book.fromMap(Map<String, dynamic> data) {
//     return Book(
//       title: data['title'],
//       author: data['author'],
//       description: data['description'],
//     );
//   }
// }

// class BookList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance.collection('books').snapshots(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return CircularProgressIndicator();
//         }
//         List<Book> books = snapshot.data!.docs.map((doc) => Book.fromMap(doc.data())).toList();
//         return ListView.builder(
//           itemCount: books.length,
//           itemBuilder: (context, index) {
//             return ListTile(
//               title: Text(books[index].title),
//               subtitle: Text(books[index].author),
//               trailing: Icon(Icons.arrow_forward),
//             );
//           },
//         );
//       },
//     );
//   }
// }


// class BookListPage extends StatefulWidget {
//   @override
//   _BookListPageState createState() => _BookListPageState();
// }

// class _BookListPageState extends State<BookListPage> {
//   List<Book> _books = [];
  
//   // Add your code to retrieve data from Firebase and populate the _books list here
// }

// class _BookListPageState extends State<BookListPage> {
//   List<Book> _books = [];

//   @override
//   void initState() {
//     super.initState();
//     FirebaseFirestore.instance
//         .collection('books')
//         .get()
//         .then((QuerySnapshot querySnapshot) {
//       querySnapshot.docs.forEach((doc) {
//         setState(() {
//           _books.add(Book.fromMap(doc.data()));
//         });
//       });
//     });
//   }
  
//   // Add your code to build the UI here
// }


// class _BookListPageState extends State<BookListPage> {
//   List<Book> _books = [];

//   @override
//   void initState() {
//     super.initState();
//     FirebaseFirestore.instance
//         .collection('books')
//         .get()
//         .then((QuerySnapshot querySnapshot) {
//       querySnapshot.docs.forEach((doc) {
//         setState(() {
//           _books.add(Book.fromMap(doc.data()));
//         });
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Book List'),
//       ),
//       body: ListView.builder(
//         itemCount: _books.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(_books[index].title),
//             subtitle: Text(_books[index].author),
//             trailing: Icon(Icons.arrow_forward),
//           );
//         },
//       ),
//     );
//   }
// }
