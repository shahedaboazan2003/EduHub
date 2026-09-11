import 'package:flutter/material.dart';


class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF1E1E1E)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'EduHub',
          style: TextStyle(
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.bold,
            color: Color(0xFF1B61EB),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.all(20.0),
            child: TextField(
              controller: searchController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Search courses, skills ....',
                hintStyle:  TextStyle(
                  fontFamily: 'Inter',
                  color: Color(0xFFA0AEC0),
                  fontSize: 14,
                ),
                prefixIcon:  Icon(Icons.search, color: Color(0xFFA0AEC0)),
                filled: true,
                fillColor: Colors.white,
                contentPadding:  EdgeInsets.symmetric(vertical: 12),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:  BorderSide(color: Color(0x4DC3C6D7)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:  BorderSide(color: Color(0x4DC3C6D7)),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding:  EdgeInsets.symmetric(horizontal: 20),
              children: [

                SizedBox(height: 16),

                SizedBox(height: 16),

                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
