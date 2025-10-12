import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:income_tracker_app/data/local/app_database.dart';
import 'package:income_tracker_app/shared/empty_state.dart';
import 'package:income_tracker_app/features/categories/category_controller.dart';
import 'package:drift/drift.dart' as drift;

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final categoryController = Get.find<CategoryController>();
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
      appBar: AppBar(
        title: const Text('Categories'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showBottomSheet(context, categoryController),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Obx(
              () => categoryController.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : categoryController.categories.isEmpty
                  ? const Center(
                      child: EmptyStateWidget(categoryName: 'Categories'),
                    )
                  : ListView.builder(
                      itemCount: categoryController.categories.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(15),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    categoryController.categories[index].categoryName,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: categoryController
                                                .categories[index]
                                                .categoryisActiveStatus
                                            ? Colors.green
                                            : Colors.grey,
                                        width: 1,
                                      ),
                                    ),
                                    child: Text(
                                      categoryController
                                              .categories[index]
                                              .categoryisActiveStatus
                                          ? 'Active'
                                          : 'Inactive',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: categoryController
                                                .categories[index]
                                                .categoryisActiveStatus
                                            ? Colors.green
                                            : Colors.grey,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                              const SizedBox(height: 5,),
                              Text(
                                categoryController.categories[index].categoryDescription,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
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
    CategoryController categoryController,
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
                  final category = IncomeCategoriesCompanion(
                    categoryName: drift.Value(categoryNameController.text),
                    categoryDescription: drift.Value(
                      categoryDescriptionController.text,
                    ),
                  );
                  await categoryController.addCategory(category);
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
