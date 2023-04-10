import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/app/ui/theme/app_colors.dart';
import 'package:news_app/app/ui/theme/app_text_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsWidget extends StatefulWidget {
  final String? newsAuthor;
  final String? newsImage;
  final String? newsTime;
  final String? newsTitle;
  final String? newsDescription;

  const NewsWidget({
    Key? key,
    this.newsAuthor,
    this.newsImage,
    this.newsTime,
    this.newsTitle,
    this.newsDescription,
  }) : super(key: key);

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  Size? screenSize;

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: screenSize!.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                leftRowWidget(),
                const SizedBox(
                  width: 10.0,
                ),
                rightRowWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget leftRowWidget() {
    return SizedBox(
      width: screenSize!.width * 0.35,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            fit: BoxFit.cover,
            height: 80.0,
            width: screenSize!.width * 0.35,
            imageUrl: widget.newsImage!,
            placeholder: (context, url) => const CupertinoActivityIndicator(),
            errorWidget: (context, url, error) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.image_not_supported_rounded,
                  size: 30.0,
                  color: AppColors.primaryColor,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Cannot Load Image",
                  style: AppTextStyles.subText_12,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            widget.newsAuthor!,
            style: AppTextStyles.subText_12,
            softWrap: true,
            maxLines: 2,
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            widget.newsTime!,
            style: AppTextStyles.subText_12,
            softWrap: true,
            maxLines: 1,
          ),
        ],
      ),
    );
  }

  Widget rightRowWidget() {
    return SizedBox(
      width: screenSize!.width * 0.49,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Text(
              widget.newsTitle!,
              style: AppTextStyles.headTextBold_14,
              softWrap: true,
              maxLines: 3,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          SizedBox(
            child: Text(
              widget.newsDescription!,
              style: AppTextStyles.subText_12,
              softWrap: true,
              maxLines: 5,
            ),
          )
        ],
      ),
    );
  }
}
