import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/models/dictionary.dart';
import '../../../core/services/api_service.dart';
import '../state/dictionary_list_provider.dart';
import '../state/search_validation_provider.dart';
import '../state/search_word_provider.dart';

final textEditingControllerProvider =
    Provider((ref) => TextEditingController());

class SearchWord extends ConsumerWidget {
  const SearchWord({Key? key}) : super(key: key);

  void searchWordRequest(String word, ref) async {
    if (word.length > 0) {
      updateSearchWordProvider(word, ref);
      ApiService().fetchDictionary(word).then((List<Dictionary> value) {
        final List<Dictionary> dataList = value;

        ref.read(dictionaryListProvider.notifier).state = dataList;
        FocusManager.instance.primaryFocus?.unfocus();
      });
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final validation = ref.watch(searchValidationProvider);
    final textEditingController = ref.watch(textEditingControllerProvider);

    return SingleChildScrollView(
      child: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(children: [
          SafeArea(
            child: TextField(
              controller: textEditingController,
              key: const Key('searchWordTextField'),
              onChanged: (value) => validation.validateWord(value, ref),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Word',
                errorText:
                    validation.error.length > 0 ? validation.error : null,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: (validation.error == '')
                ? () {
                    searchWordRequest(textEditingController.text, ref);
                  }
                : null,
            child: const Text('Look up definition'),
          ),
          const SizedBox(
            height: 20,
          ),
          Consumer(
            builder: (context, ref, _) {
              final dictionaryList = ref.watch(dictionaryListProvider);

              return ListView.builder(
                itemCount: dictionaryList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final dictionary = dictionaryList[index];
                  return Column(
                    children: [
                      ListTile(
                        title: Text(dictionary.word),
                        subtitle: Text(dictionary.phonetic),
                      ),
                      if (dictionary.meanings.isNotEmpty)
                        ListView.builder(
                            itemCount: dictionary.meanings.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final meaning = dictionary.meanings[index];
                              return Column(
                                children: [
                                  Text(meaning.partOfSpeech),
                                  if (meaning.definitions.isNotEmpty)
                                    ListView.builder(
                                        itemCount: meaning.definitions.length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          final def =
                                              meaning.definitions[index];
                                          return Column(
                                            children: [
                                              ListTile(
                                                title: Text(def.definition),
                                              ),
                                            ],
                                          );
                                        })
                                ],
                              );
                            })
                    ],
                  );
                },
              );
            },
          )
        ]),
      )),
    );
  }
}