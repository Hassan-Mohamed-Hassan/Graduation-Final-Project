import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:untitled15/student/showpdf.dart';

import 'drawer.dart';
import '../../constants/constants.dart';
import '../../Models/books_model.dart';

class BooksDetail extends StatelessWidget {
Book ?books;

BooksDetail(this.books);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back,size: 35,),
      ),),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Image(
                image: NetworkImage('${books!.image}'),
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                  '${books!.name}',
                style: GoogleFonts.aBeeZee(fontSize: 20,color: defaultColor)
              ),
              const SizedBox(height: 18),
              Text(
                  '${books!.description}',
                style:GoogleFonts.actor(fontSize: 15)
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  const Icon(Icons.person),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    '${books!.teacher!.name}',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.visibility_outlined),
                      const SizedBox(
                        width: 6,
                      ),
                      Text('${books!.views} Views')
                    ],
                  ),
                  RatingBar.builder(
                    itemSize: 20,
                    initialRating: 3/*model.bookRating*/,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text('${books!.createdAt}'),
              const SizedBox(height: 18),
              Center(
                child: Container(
                  width: width(context, .5),
                  height: 60,
                  padding: EdgeInsets.all(8),
                  child: MaterialButton(
                    color: const Color.fromRGBO(0, 178, 255, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PDFViewer(url:'${books!.book}',)));
                    },
                    child: Row(
                      children:  [
                        Icon(
                          Icons.book_outlined,
                          color: Colors.white,
                        ),
                       SizedBox(width: 10,),
                        Text(
                          'Read',
                          style:GoogleFonts.cairo(fontSize: 20,color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
