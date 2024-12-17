import 'package:E3InspectionsMultiTenant/src/bloc/settings_bloc.dart';
//import 'package:E3InspectionsMultiTenant/src/ui/breadcrumb_navigation.dart';
import 'package:E3InspectionsMultiTenant/src/ui/cachedimage_widget.dart';
import 'package:E3InspectionsMultiTenant/src/ui/showprojecttype_widget.dart';
import 'package:provider/provider.dart';
import 'package:realm/realm.dart';

import '../models/realm/realm_schemas.dart';

import '../resources/realm/realm_services.dart';
import 'addedit_location.dart';
import 'addedit_subproject.dart';

import 'location.dart';
import 'package:flutter/material.dart';

class SubProjectDetailsPage extends StatefulWidget {
  final ObjectId id;
  final String userfullName;
  final String prevPageName;
  const SubProjectDetailsPage(this.id, this.prevPageName, this.userfullName,
      {Key? key})
      : super(key: key);
  @override
  State<SubProjectDetailsPage> createState() => _SubProjectDetailsPageState();
  static MaterialPageRoute getRoute(
          ObjectId id, String prevPageName, String userName, String pageName) =>
      MaterialPageRoute(
          settings: RouteSettings(name: pageName),
          builder: (context) =>
              SubProjectDetailsPage(id, prevPageName, userName));
}

//Add New Project
class _SubProjectDetailsPageState extends State<SubProjectDetailsPage>
    with SingleTickerProviderStateMixin {
  late int selectedTabIndex = 0;
//Tab Controls
  late TabController _tabController;
  String userFullName = "";
  late ObjectId buildingId;

  late SubProject currentBuilding;
  late List<Child?> buildinglocations;
  late List<Child?> apartments;
  late Location newLocation;
  late Location newApartment;
  late String prevPageName;

  Location getLocation(String type) {
    return Location(ObjectId(), buildingId, false,
        name: "",
        description: "",
        createdby: userFullName,
        type: type,
        url: "",
        parenttype: 'subproject');
  }

  @override
  void initState() {
    buildingId = widget.id;
    userFullName = widget.userfullName;
    super.initState();
    prevPageName = widget.prevPageName;

    _tabController = TabController(vsync: this, length: 2);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    switch (_tabController.index) {
      case 0:
        selectedTabIndex = 0;
        break;
      case 1:
        selectedTabIndex = 1;
        break;
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void addEditSubProject() {
    setState(() {});
    Navigator.push(
            context,
            AddEditSubProjectPage.getRoute(currentBuilding, false, userFullName,
                currentBuilding.name as String))
        .then((value) => setState(
              () {},
            ));
  }

  void addNewChild(String name) {
    setState(() {});
    if (selectedTabIndex == 1) {
      Navigator.push(
          context,
          AddEditLocationPage.getRoute(
              getLocation('buildinglocation'), true, userFullName, name));
    } else {
      Navigator.push(
        context,
        AddEditLocationPage.getRoute(
            getLocation('apartment'), true, userFullName, name),
      );
    }
  }

  void gotoDetails(ObjectId id, String type, String pageName) {
    Navigator.push(
            context,
            LocationPage.getRoute(id, currentBuilding.name as String, type,
                userFullName, pageName)
            // MaterialPageRoute(
            //     builder: (context) => LocationPage(
            //         id, currentBuilding.name as String, type, userFullName)),
            )
        .then((value) => setState(() => {}));
  }

  @override
  Widget build(BuildContext context) {
    final realmServices = Provider.of<RealmProjectServices>(context);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leadingWidth: 120,
          leading: ElevatedButton.icon(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.blue,
            ),
            label: const Text(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              'Back',
              style: TextStyle(color: Colors.blue),
            ),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.blue,
          elevation: 0,
          title: const Text(
            'Building',
            style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
          ),
        ),
        // floatingActionButton: Padding(
        //   padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
        //   child: BreadCrumbNavigator(),
        // ),
        body: StreamBuilder<RealmObjectChanges<SubProject>>(
          //projectsBloc.projects
          stream: realmServices.getSubProject(buildingId)!.changes,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data;

              if (data == null) {
                return Center(
                  child: Text(
                    '${snapshot.error} occurred',
                    style: const TextStyle(fontSize: 18),
                  ),
                );

                // if we got our data
              } else {
                currentBuilding = data.object;
                return SingleChildScrollView(
                    child: Column(
                  children: [
                    StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                      return buildingDetails();
                    }),
                    subProjectChildrenTab(context),
                  ],
                ));
              }
            }

            // Displaying LoadingSpinner to indicate waiting state
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }

  Widget buildingDetails() {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 4,
          ),
          const ProjectType(),
          Container(
            height: 220,
            decoration: BoxDecoration(
                color: appSettings.isInvasiveMode ? Colors.orange : Colors.blue,
                // image: DecorationImage(
                //     image: AssetImage('assets/images/icon.png'),
                //     fit: BoxFit.cover),
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                boxShadow: const [
                  BoxShadow(blurRadius: 1.0, color: Colors.blue)
                ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: cachedNetworkImage(currentBuilding.url),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
              child: Text(
                currentBuilding.name as String,
                maxLines: 2,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: Text(
                'Description',
                style: TextStyle(
                  fontSize: 14,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Text(
                        maxLines: 2,
                        currentBuilding.description as String,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Visibility(
                      visible: !appSettings.isInvasiveMode,
                      child: InkWell(
                          onTap: () {
                            addEditSubProject();
                          },
                          child: const Chip(
                            avatar: Icon(
                              Icons.edit_outlined,
                              color: Colors.blue,
                            ),
                            labelPadding: EdgeInsets.all(2),
                            label: Text(
                              'Edit Building ',
                              style: TextStyle(color: Colors.blue),
                              selectionColor: Colors.white,
                            ),
                            shadowColor: Colors.transparent,
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            autofocus: true,
                          )),
                    ),
                  ],
                )),
          ),
          const Divider(
            color: Color.fromARGB(255, 222, 213, 213),
            height: 5,
            thickness: 2,
            indent: 0,
            endIndent: 0,
          ),
        ],
      ),
    );
  }

  Widget subProjectChildrenTab(BuildContext context) {
    // return DefaultTabController(
    //   length: 2,
    //   child:
    buildinglocations = List.empty(growable: true);
    apartments = List.empty(growable: true);
    if (appSettings.isInvasiveMode) {
      buildinglocations = currentBuilding.children
          .where((element) =>
              element.type == 'buildinglocation' && element.isInvasive)
          .toList();

      apartments = currentBuilding.children
          .where((element) => element.type == 'apartment' && element.isInvasive)
          .toList();
    } else {
      buildinglocations = currentBuilding.children
          .where((element) => element.type == 'buildinglocation')
          .toList();
      apartments = currentBuilding.children
          .where((element) => element.type == 'apartment')
          .toList();
    }
    buildinglocations.sort((l1, l2) {
      if (l1!.sequenceNo != null && l2!.sequenceNo != null) {
        if (int.parse(l1.sequenceNo!) < int.parse(l2.sequenceNo!)) {
          return -1;
        } else {
          return 1;
        }
      } else {
        return l1.id.toString().compareTo(l2!.id.toString());
      }
    });
    apartments.sort((l1, l2) {
      if (l1!.sequenceNo != null && l2!.sequenceNo != null) {
        if (int.parse(l1.sequenceNo!) < int.parse(l2.sequenceNo!)) {
          return -1;
        } else {
          return 1;
        }
      } else {
        return l1.id.toString().compareTo(l2!.id.toString());
      }
    });
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              text: "Apartments(${apartments.length})",
              height: 32,
            ),
            Tab(
              text: "Building Locations (${buildinglocations.length})",
              height: 32,
            ),
          ],
          labelColor: Colors.black,
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: TabBarView(controller: _tabController, children: [
              locationsWidget('apartment'),
              locationsWidget('building location'),
            ])),
      ],
      // ),
    );
  }

  Widget locationsWidget(String type) {
    bool isLocation = true;
    isLocation = type == 'building location'
        ? buildinglocations.isEmpty
        : apartments.isEmpty;
    return Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Visibility(
              visible: !appSettings.isInvasiveMode,
              child: Align(
                alignment: Alignment.topRight,
                child: InkWell(
                    onTap: () {
                      addNewChild(currentBuilding.name as String);
                    },
                    child: Chip(
                      avatar: const Icon(
                        Icons.add_circle_outline,
                        color: Colors.blue,
                      ),
                      labelPadding: const EdgeInsets.all(2),
                      label: Text(
                        'Add $type',
                        style:
                            const TextStyle(color: Colors.blue, fontSize: 15),
                        selectionColor: Colors.white,
                      ),
                      shadowColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      autofocus: true,
                    )),
              ),
            ),
            isLocation
                ? Align(
                    alignment: Alignment.center,
                    child: Text(
                      'No $type, Add $type.',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16),
                    ))
                : type == 'building location'
                    ? Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: buildinglocations.length,
                            itemBuilder: (BuildContext context, int index) {
                              return horizontalScrollChildren(context, index);
                            }))
                    : Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: apartments.length,
                            itemBuilder: (BuildContext context, int index) {
                              return horizontalScrollChildrenApartments(
                                  context, index);
                            }))
          ],
        ));
  }

  //Todo create widget for locations
  Widget horizontalScrollChildren(BuildContext context, int index) {
    return SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  gotoDetails(buildinglocations[index]!.id, 'Common Location',
                      buildinglocations[index]!.name as String);
                },
                child: Container(
                  height: 140,
                  width: 192,
                  decoration: BoxDecoration(
                      color: appSettings.isInvasiveMode
                          ? Colors.orange
                          : Colors.blue,
                      // image: networkImage(currentProject.url as String),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                      boxShadow: const [
                        BoxShadow(blurRadius: 1.0, color: Colors.blue)
                      ]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: cachedNetworkImage(buildinglocations[index]!.url),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(4, 4, 4, 0),
                  child: Text(
                    buildinglocations[index]!.name as String,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Text(
                            maxLines: 2,
                            buildinglocations[index]!.description as String,
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 13,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    )),
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ));
  }

  Widget horizontalScrollChildrenApartments(BuildContext context, int index) {
    return SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  gotoDetails(apartments[index]!.id, 'Apartment',
                      apartments[index]!.name as String);
                },
                child: Container(
                    height: 140,
                    width: 192,
                    decoration: BoxDecoration(
                        color: appSettings.isInvasiveMode
                            ? Colors.orange
                            : Colors.blue,
                        // image: networkImage(currentProject.url as String),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8.0)),
                        boxShadow: const [
                          BoxShadow(blurRadius: 1.0, color: Colors.blue)
                        ]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: cachedNetworkImage(apartments[index]!.url),
                    )),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(4, 4, 4, 0),
                  child: Text(
                    apartments[index]!.name as String,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Text(
                            maxLines: 2,
                            apartments[index]!.description as String,
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 13,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    )),
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ));
  }
}
