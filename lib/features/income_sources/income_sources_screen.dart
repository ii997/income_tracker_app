import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:income_tracker_app/features/income_sources/income_sources_controller.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../../shared/empty_state.dart';

class IncomeSourcesScreen extends StatefulWidget {
  const IncomeSourcesScreen({super.key});

  @override
  State<IncomeSourcesScreen> createState() => _IncomeSourcesScreenState();
}

class _IncomeSourcesScreenState extends State<IncomeSourcesScreen> {
  final incomeSourcesController = Get.find<IncomeSourcesController>();
  final TextEditingController categoryNameController = TextEditingController();
  final TextEditingController categoryDescriptionController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    categoryNameController.dispose();
    categoryDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add new income
        },
        backgroundColor: const Color(0xFF7C3AED),
        elevation: 4,
        icon: const Icon(LucideIcons.plus, color: Colors.white),
        label: const Text(
          'Add Source',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      appBar: AppBar(
        title: const Text('Income Sources'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showBottomSheet(context, incomeSourcesController),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Obx(
              () => incomeSourcesController.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : incomeSourcesController.incomeSources.isEmpty
                  ? const Center(
                      child: EmptyStateWidget(categoryName: 'sources'),
                    )
                  : ListView.builder(
                      itemCount: incomeSourcesController.incomeSources.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                incomeSourcesController
                                    .incomeSources[index]
                                    .sourceName
                                    .toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                incomeSourcesController
                                    .incomeSources[index]
                                    .categoryName
                                    .toString(),
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(
    BuildContext context,
    IncomeSourcesController categoryController,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
            top: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: categoryNameController,
                decoration: const InputDecoration(labelText: 'Category'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: categoryDescriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                child: const Text('Add Category'),
                onPressed: () async {
                  // final category = IncomeCategoriesCompanion(
                  //   name: drift.Value(categoryNameController.text),
                  //   description: drift.Value(
                  //     categoryDescriptionController.text,
                  //   ),
                  // );
                  // await categoryController.addCategory(category);
                  categoryNameController.clear();
                  categoryDescriptionController.clear();
                  Get.back(); // close bottom sheet
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
