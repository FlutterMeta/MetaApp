part of "../blog_page.dart";

class _BlankPost extends StatelessWidget {
  final VoidCallback onAddTap;
  final VoidCallback onCancelTap;
  final TextEditingController titleController;
  final TextEditingController bodyController;

  const _BlankPost({
    required this.onAddTap,
    required this.onCancelTap,
    required this.titleController,
    required this.bodyController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          context.localizations.create,
          style: context.text.profilePageBody.copyWith(fontSize: 30),
        ),
        const SizedBox(height: 20),
        _EditablePostSection(
          titleController: titleController,
          bodyController: bodyController,
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: [
            ColoredButton(
              title: context.localizations.approveBlogArticle,
              onTap: onAddTap,
              color: context.color.profilePageSecondaryVariant,
            ),
            ColoredButton(
              title: context.localizations.cancel,
              onTap: onCancelTap,
              color: context.color.profilePageError,
            ),
          ],
        ),
      ],
    );
  }
}
