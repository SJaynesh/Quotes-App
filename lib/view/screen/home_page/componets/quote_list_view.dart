import '../../../../headers.dart';
import '../../../../models/quotes_model.dart';
import '../../../../utills/quotes_utills.dart';

Expanded quotesListTile() {
  return Expanded(
    flex: 14,
    child: Scrollbar(
      thickness: 6,
      radius: const Radius.circular(20),
      interactive: true,
      thumbVisibility: true,
      trackVisibility: true,
      child: ListView.separated(
        itemCount: allQuotes.length,
        padding: const EdgeInsets.all(12),
        itemBuilder: (context, index) {
          QuotesModel quote = allQuotes[index];
          return (cat == quote.category)
              ? expansionTile(index: index, quote: quote)
              : (cat == 'All')
                  ? expansionTile(index: index, quote: quote)
                  : Container();
        },
        separatorBuilder: (context, index) =>
            (cat == allQuotes[index].category || cat == 'All')
                ? const Divider(
                    thickness: 2,
                    color: Colors.grey,
                    // color: Colors.black,
                  )
                : Container(),
      ),
    ),
  );
}

ExpansionTile expansionTile({
  required int index,
  required QuotesModel quote,
}) {
  return ExpansionTile(
    backgroundColor: Colors.primaries[index % 18][300],
    // trailing: const Icon(Icons.keyboard_arrow_down),
    tilePadding: const EdgeInsets.all(10),
    collapsedShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    collapsedBackgroundColor: Colors.primaries[index % 18][200],
    leading: Text("${index + 1}"),
    title: Text(quote.quotes),
    children: [
      Text(quote.author),
      Text(quote.category),
    ],
  );
}
