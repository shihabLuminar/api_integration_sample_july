import 'package:api_integration_sample/controller/nationalise_api_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NationaliseApiScreen extends StatefulWidget {
  const NationaliseApiScreen({super.key});

  @override
  State<NationaliseApiScreen> createState() => _NationaliseApiScreenState();
}

class _NationaliseApiScreenState extends State<NationaliseApiScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await context
            .read<NationaliseApiScreenController>()
            .fetchNationalizeData();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final nationaliseApiScreenState =
        context.watch<NationaliseApiScreenController>();
    return Scaffold(
      appBar: AppBar(
        leading: Text(nationaliseApiScreenState.count.toString()),
        centerTitle: true,
        title: Text(nationaliseApiScreenState.name.toString()),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
                leading: Text(nationaliseApiScreenState
                    .countryList[index].countryId
                    .toString()),
                title: Text(nationaliseApiScreenState
                    .countryList[index].probability
                    .toString()),
              ),
          separatorBuilder: (context, index) => Divider(),
          itemCount: nationaliseApiScreenState.countryList.length),
    );
  }
}
