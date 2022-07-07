import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'getx.dart';

class LocationList extends StatelessWidget {
  const LocationList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final DataFetch controller = Get.put(DataFetch());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Get.back(),
              // Navigator.pop(context);
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text('Saved Data'),
      ),
      body: GetBuilder<DataFetch>(
        // Obx(()
        // GetX<DataFetch>(
        init: DataFetch(),
        builder: (controller) => (controller.data.isNotEmpty)
            ? ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onDoubleTap: () =>
                        controller.delete(controller.data[index].id as int),
                    child: Card(
                      elevation: 8,
                      child: ListTile(
                        title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("id: ${controller.data[index].id}"),
                              const SizedBox(height: 10),
                              Text(
                                "longitude: ${controller.data[index].longitude.toString()}",
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "latitude: ${controller.data[index].latitude.toString()}",
                              )
                            ]),
                      ),
                    ),
                  );
                })
            : const Center(child: Text("no Data")),
      ),
    );
  }
}
