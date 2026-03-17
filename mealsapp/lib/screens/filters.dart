import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/providers/filters_provider.dart';

// enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

// class FiltersScreen extends ConsumerStatefulWidget { commenting cause thegoal is to no longer manage the local state
//   const FiltersScreen({super.key});

//   //final Map<Filter, bool> currentFilters;
//   @override
//   ConsumerState<FiltersScreen> createState() {
//     return _FiltersScreen();
//   }
// }

// class _FiltersScreen extends ConsumerState<FiltersScreen> {
//   var _glutenFreeFilterSet = false;
//   var _lactoseFreeFilterSet = false;
//   var _vegetarianFilterSet = false;
//   var _veganFilterSet = false;

class FiltersScreen extends ConsumerWidget {
  // using only consumer widget instead of earlier one
  // @override
  // void initState() {
  //   super.initState();
  //   //ref.read(filtersProvider);

  //   final activeFilters = ref.read(filtersProvider);
  //   _glutenFreeFilterSet = activeFilters[Filter.glutenFree]!;
  //   _lactoseFreeFilterSet = activeFilters[Filter.lactoseFree]!;
  //   _veganFilterSet = activeFilters[Filter.vegan]!;
  //   _vegetarianFilterSet = activeFilters[Filter.vegetarian]!;
  // } simplying so getting rid of init state

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(
      filtersProvider,
    ); //watch instead of read cause it sets up a listener that reexecutes the build method whenever the state in the provider changes so whenever the filter changes

    return Scaffold(
      appBar: AppBar(title: Text('Your Filters')),
      // drawer: MainDrawer(
      //   onSelectScreen: (identifier) {
      //     Navigator.of(
      //       context,
      //     ).push(MaterialPageRoute(builder: (ctx) => Tabsscreen()));
      //   },
      // ),
      // body: PopScope(
      //   canPop: true,
      //   onPopInvokedWithResult: (bool didPop, dynamic result) {
      //     if (didPop) {
      //       return;
      //     }
      //     ref.read(filtersProvider.notifier).setFilter({
      //       Filter.glutenFree: _glutenFreeFilterSet,
      //       Filter.lactoseFree: _lactoseFreeFilterSet,
      //       Filter.vegan: _veganFilterSet,
      //       Filter.vegetarian: _vegetarianFilterSet,
      //     }); //Navigator.of(context).pop({
      //   }, also getting rid of this
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilters[Filter.glutenFree]!, //_glutenFreeFilterSet,
            onChanged: (isChecked) {
              // setState(() {
              //   _glutenFreeFilterSet = isChecked;
              // });

              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, isChecked);
            },
            title: Text(
              'Gluten-Free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            subtitle: Text(
              'Only include Gluten-Free Meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),

          SwitchListTile(
            value: activeFilters[Filter.lactoseFree]!, //_lactoseFreeFilterSet,
            onChanged: (isChecked) {
              // setState(() {
              //   _lactoseFreeFilterSet = isChecked;
              // });
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactoseFree, isChecked);
            },
            title: Text(
              'Lactose-Free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            subtitle: Text(
              'Only include Lactose-Free Meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),

          SwitchListTile(
            value: activeFilters[Filter.vegetarian]!, //_vegetarianFilterSet,
            onChanged: (isChecked) {
              // setState(() {
              //   _vegetarianFilterSet = isChecked;
              // });
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetarian, isChecked);
            },
            title: Text(
              'Vegetarian',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            subtitle: Text(
              'Only include Vegetarian Meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),

          SwitchListTile(
            value: activeFilters[Filter.vegan]!, // _veganFilterSet,
            onChanged: (isChecked) {
              // setState(() {
              //   _veganFilterSet = isChecked;
              // });
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegan, isChecked);
            },
            title: Text(
              'Vegan',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            subtitle: Text(
              'Only include Vegan Meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
        ],
      ),
    );
    // );
  }
}
