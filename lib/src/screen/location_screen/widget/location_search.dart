import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/blocs/location/location_bloc.dart';
import 'package:weather_app/src/blocs/location/location_event.dart';
import 'package:weather_app/src/blocs/location/location_state.dart';
import 'package:weather_app/src/constants/app_colors.dart';
import 'package:weather_app/src/models/city.dart';

class LocationSearch extends StatelessWidget {
  const LocationSearch({Key? key}) : super(key: key);

  static String displayStringForOption(City option) => option.name;

  @override
  Widget build(BuildContext context) {
    context.read<LocationBloc>().add(LocationRequested());

    return BlocBuilder<LocationBloc, LocationState>(
      builder: (context, state) {
        if (state is LocationLoadInProgress) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is LocationLoadSuccess) {
          return Container(
            color: Colors.grey.shade500,
            child: Autocomplete<City>(
              displayStringForOption: displayStringForOption,
              fieldViewBuilder: (BuildContext context,
                  TextEditingController fieldTextEditingController,
                  FocusNode fieldFocusNode,
                  VoidCallback onFieldSubmitted) {
                return TextField(
                  decoration: InputDecoration(
                      prefixIcon:
                          Icon(Icons.search, color: Colors.grey.shade400),
                      suffixIcon: IconButton(
                          onPressed: () => fieldTextEditingController.text = '',
                          icon: Icon(Icons.close, color: Colors.grey.shade400)),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: 'Please Input City Name'),
                  controller: fieldTextEditingController,
                  focusNode: fieldFocusNode,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(fontSize: 18),
                );
              },
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text == '') {
                  return const Iterable<City>.empty();
                }
                return state.cities.where((City option) {
                  return option.name
                      .toString()
                      .toLowerCase()
                      .contains(textEditingValue.text.toLowerCase());
                });
              },
              optionsViewBuilder: (context, onSelected, options) {
                return Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    color: ColorsApp.primaryColor,
                    // width: optionsViewBuilderwidth,
                    child: ListView.builder(
                      itemCount: options.length,
                      itemBuilder: (BuildContext context, int index) {
                        final City option = options.elementAt(index);
                        return GestureDetector(
                          onTap: () {
                            print('a');
                          },
                          child: Card(
                            color: ColorsApp.primaryColor,
                            child: ListTile(
                              title: Text(
                                option.name,
                                style: Theme.of(context).textTheme.headline6!.copyWith(
                                  color: Colors.white38
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          );
        }
        return Container(
          color: Colors.orange,
        );
      },
    );
  }
}
