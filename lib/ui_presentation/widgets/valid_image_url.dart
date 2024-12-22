import 'package:flutter/material.dart';

class ValidImageUrl extends StatefulWidget {
  final String imageUrl;
  final double? size;
  final double marginDouble;
  final BorderRadiusGeometry? borderRadius;
  const ValidImageUrl({
    super.key,
    required this.imageUrl,
    required this.size,
    this.borderRadius = BorderRadius.zero,
    this.marginDouble = 0,
  });

  @override
  State<ValidImageUrl> createState() => _ValidImageUrlState();
}

class _ValidImageUrlState extends State<ValidImageUrl> {
  late final String newImageUrl;

  @override
  void initState() {
    newImageUrl = widget.imageUrl.startsWith('https:')
        ? widget.imageUrl
        : 'https:${widget.imageUrl}';
    super.initState();
  }

  /* Future<bool> _checkImageValidity() async {
    try {
      final response = await http.head(Uri.parse(widget.imageUrl));
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  } */

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: widget.marginDouble),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            blurRadius: 4,
            spreadRadius: 0,
            color: const Color(0xFF0B211D).withOpacity(0.1),
          ),
        ],
        border: Border.all(
          width: 1,
          color: const Color(0xFF19A292).withOpacity(0.4),
        ),
        borderRadius: widget.borderRadius,
        /* image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            widget.imageUrl,
          ),
        ), */
      ),
      clipBehavior: Clip.hardEdge,
      child: buildPhoto(),
    );
  }

  Widget buildPhoto() {
    return Image.network(
      newImageUrl,

      /* loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return const Center(
          child: CircularProgressIndicator(),
        );
      }, */
      fit: BoxFit.cover,
      height: widget.size,
      width: widget.size,
      errorBuilder: (context, error, stackTrace) {
        return _noImageAvailable1();
      },
    );
  }

  Widget _noImageAvailable1() {
    return Image(
      height: widget.size,
      fit: BoxFit.cover,
      width: double.infinity,
      image: const AssetImage('assets/no_image.jpg'),
    );
  }
}
