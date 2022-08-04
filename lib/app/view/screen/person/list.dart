import 'package:flutter/material.dart';
import 'package:rick_and_morty_test_restapi/app/view/widget/drawer/common_drawer.dart';
import 'package:rick_and_morty_test_restapi/app/view/widget/person/list.dart';

class PersonListScreen extends StatelessWidget {
  //final MultiplePersonListFilter? filter;

  const PersonListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Person list:'), //${filter != null ? ': filtered ${filter!.filterName} ${filter!.filterCriteria}' : ': all persons'}'),
      ),
      drawer: (MediaQuery.of(context).size.width < 600 /*&& filter == null*/) ? const Drawer(child: Menu()) : null,
      body: SafeArea(
        //const PersonListWidget(),
        child: Center(
          child: (MediaQuery.of(context).size.width < 600 /*|| filter != null*/)
              ? const PersonListWidget() /* PersonBuildInListWidget(filter: filter)*/
              : Row(
                  children: [
                    const SizedBox(width: 300, child: Menu()),
                    SizedBox(width: MediaQuery.of(context).size.width - 300, child: const PersonListWidget(/*filter: filter*/))
                  ],
                ),
        ),
      ),
    );
  }
}
