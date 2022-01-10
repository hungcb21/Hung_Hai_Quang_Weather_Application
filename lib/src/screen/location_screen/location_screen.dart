import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/blocs/location/location_event.dart';

import '../../blocs/location/location_bloc.dart';
import '../../blocs/location/location_state.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_string.dart';
import '../../constants/routes_name.dart';
import '../../models/city.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);
  static String displayStringForOption(City city) => city.name;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
     context.read<LocationBloc>().add(LocationRequested());
    return Scaffold(
        backgroundColor: ColorsApp.primaryBackgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorsApp.primaryBackgroundColor,
          leading: TextButton(
            child: Text(
              AppString.done,
              style: _theme.textTheme.bodyText2!.copyWith(
                  fontSize: 17.5,
                  fontWeight: FontWeight.w300,
                  color: ColorsApp.leadingTextColor),
            ),
            onPressed: () {},
          ),
          centerTitle: true,
          title: Column(
            children: [
              Text(
                AppString.location,
                style: _theme.textTheme.bodyText1!
                    .copyWith(fontSize: 18, color: Colors.white),
              ),
              Text(
                'Utrecht',
                style: _theme.textTheme.bodyText1!.copyWith(
                    color: ColorsApp.secondaryTextColor, fontSize: 18),
              )
            ],
          ),
        ),
        body: BlocBuilder<LocationBloc, LocationState>(
          builder: (context, state) {
            if (state is LocationLoadInProgress) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is LocationLoadSuccess) {
              return Container(
                color: ColorsApp.searchFieldColor,
                child: Autocomplete<City>(
                  displayStringForOption: displayStringForOption,
                  fieldViewBuilder: (BuildContext context,
                      TextEditingController fieldTextEditingController,
                      FocusNode fieldFocusNode,
                      VoidCallback onFieldSubmitted) {
                    return TextField(
                      cursorColor: ColorsApp.cursorColor,
                      autofocus: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search,
                              color: ColorsApp.searchIconColor),
                          suffixIcon: IconButton(
                              onPressed: () =>
                                  fieldTextEditingController.clear(),
                              icon: Icon(Icons.close,
                                  color: ColorsApp.searchFieldIconColor)),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          hintText: AppString.hintText),
                      controller: fieldTextEditingController,
                      focusNode: fieldFocusNode,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(fontSize: 16, color: Colors.grey.shade400),
                    );
                  },
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text.isEmpty) {
                      return const Iterable<City>.empty();
                    }
                    return state.cities.where((City city) {
                      return city.name
                          .toString()
                          .toLowerCase()
                          .contains(textEditingValue.text.toLowerCase());
                    });
                  },
                  optionsViewBuilder: (context, onSelected, cities) {
                    return Container(
                      color: ColorsApp.primaryBackgroundColor,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => Divider(
                          color: Colors.white,
                          thickness: 1,
                          indent: 20,
                        ),
                        padding: EdgeInsets.zero,
                        itemCount: cities.length,
                        itemBuilder: (BuildContext context, int index) {
                          final City city = cities.elementAt(index);
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  RouteNames.weatherForecast,
                                  arguments: city.name);
                            },
                            child: Material(
                              color: ColorsApp.primaryBackgroundColor,
                              child: ListTile(
                                title: Text(
                                  city.name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(color: Colors.white54),
                                ),
                              ),
                            ),
                          );
                        },
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
        ));
  }
}
