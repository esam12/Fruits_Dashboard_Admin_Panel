import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_admin/core/utils/constants/sizes.dart';
import 'package:fruits_hub_admin/core/widgets/custom_button.dart';
import 'package:fruits_hub_admin/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub_admin/features/add_product/domain/entities/product_entity.dart';
import 'package:fruits_hub_admin/features/add_product/presentation/manager/cubit/add_product_cubit.dart';
import 'package:fruits_hub_admin/features/add_product/presentation/views/widgets/image_feild.dart';
import 'package:fruits_hub_admin/features/add_product/presentation/views/widgets/is_featured_item_check_box.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name, code, description;
  late num price, expirationMonths, numberOfCalories, unitAmount;
  File? image;
  bool isFeatured = false;
  bool isOrganic = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.md),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              CustomTextFormField(
                onSaved: (value) {
                  name = value!;
                },
                hintText: 'Product Name',
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: Sizes.md),
              CustomTextFormField(
                  onSaved: (value) {
                    price = num.parse(value!);
                  },
                  hintText: 'Product Price',
                  keyboardType: TextInputType.number),
              const SizedBox(height: Sizes.md),
              CustomTextFormField(
                  onSaved: (value) {
                    expirationMonths = num.parse(value!);
                  },
                  hintText: 'Expiration Months',
                  keyboardType: TextInputType.number),
              const SizedBox(height: Sizes.md),
              CustomTextFormField(
                  onSaved: (value) {
                    numberOfCalories = num.parse(value!);
                  },
                  hintText: 'Number Of Calories',
                  keyboardType: TextInputType.number),
              const SizedBox(height: Sizes.md),
              CustomTextFormField(
                  onSaved: (value) {
                    unitAmount = num.parse(value!);
                  },
                  hintText: 'Unit Amount',
                  keyboardType: TextInputType.number),
              const SizedBox(height: Sizes.md),
              CustomTextFormField(
                  onSaved: (value) {
                    code = value!.toLowerCase();
                  },
                  hintText: 'Product Code',
                  keyboardType: TextInputType.name),
              const SizedBox(height: Sizes.md),
              CustomTextFormField(
                  maxLines: 5,
                  onSaved: (value) {
                    description = value!;
                  },
                  hintText: 'Product Description',
                  keyboardType: TextInputType.name),
              const SizedBox(height: Sizes.md),
              IsFeaturedItemCheckBox(
                  text: "Is Featured Item ?",
                  onChanged: (value) {
                    isFeatured = value;
                  }),
              const SizedBox(height: Sizes.md),
              IsFeaturedItemCheckBox(
                  text: "Is Organic ?",
                  onChanged: (value) {
                    isOrganic = value;
                  }),
              const SizedBox(height: Sizes.md),
              ImageFeild(
                onFileChanged: (image) {
                  this.image = image;
                },
              ),
              const SizedBox(height: Sizes.lg),
              CustomButton(
                  onPressed: () {
                    if (image != null) {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        ProductEntity input = ProductEntity(
                          id: '',
                          name: name,
                          code: code,
                          description: description,
                          price: price,
                          image: image!,
                          isFeatured: isFeatured,
                          expirationsMonths: expirationMonths.toInt(),
                          numberOfCalories: numberOfCalories.toInt(),
                          unitAmount: unitAmount.toInt(),
                          isOrganic: isOrganic,
                          reviews: [],
                        );
                        context.read<AddProductCubit>().addProduct(input);
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Please Select an Image')));
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                  text: 'Add Product'),
              const SizedBox(height: Sizes.lg),
            ],
          ),
        ),
      ),
    );
  }
}
