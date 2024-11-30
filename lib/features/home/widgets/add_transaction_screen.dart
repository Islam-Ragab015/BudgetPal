import 'package:budget_pal/core/helpers/spacing.dart';
import 'package:budget_pal/core/networking/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theming/fonts.dart';
import '../../../core/theming/my_colors.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  _AddTransactionScreenState createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  // Function to pick a date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  // Helper method to show stylish SnackBar
  void showStylishSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      backgroundColor: Colors.transparent, // Transparent to apply custom design
      content: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [MyColors.orangeColor, MyColors.redColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(30), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              Icons.check_circle, // Success Icon
              color: Colors.white,
              size: 30.w,
            ),
            horizontalSpace(10), // Add spacing between icon and text
            Text(
              message,
              style: TextStyle(
                fontSize: 16.sp, // Responsive font size
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      behavior:
          SnackBarBehavior.floating, // Makes the SnackBar float on the screen
      duration: const Duration(seconds: 2), // Duration of the SnackBar
    );

    // Show the SnackBar
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          automaticallyImplyLeading: false, // Hide the default back button
          title: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              "Add Transaction",
              style: FontHelper.font18BoldWhite
                  .copyWith(color: Colors.white, fontSize: 24),
            ),
          ),
          backgroundColor: Colors
              .transparent, // Transparent background to use gradient below
          elevation: 0, // Remove default shadow
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [MyColors.orangeColor, MyColors.redColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
          // Custom action icons
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(
                  context); // Pops the current screen and returns to the previous one
            },
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInputField(
                  label: 'Transaction Name',
                  hintText: 'Enter transaction name',
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                verticalSpace(20), // Add vertical spacing

                _buildInputField(
                  label: 'Price',
                  hintText: 'Enter amount',
                  controller: _priceController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a price';
                    }
                    final price = double.tryParse(value);
                    if (price == null || price <= 0) {
                      return 'Please enter a valid price greater than 0';
                    }
                    return null;
                  },
                ),
                verticalSpace(20), // Add vertical spacing

                // Date Picker Field
                const Text(
                  'Select Date',
                  style: FontHelper.font18BoldWhite,
                ),
                GestureDetector(
                  onTap: () => _selectDate(context),
                  child: AbsorbPointer(
                    child: _buildInputField(
                      label: '',
                      hintText: "${_selectedDate.toLocal()}".split(' ')[0],
                      controller: TextEditingController(
                          text: "${_selectedDate.toLocal()}".split(' ')[0]),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a date';
                        }
                        return null;
                      },
                      icon: Icons.calendar_today,
                    ),
                  ),
                ),
                verticalSpace(20), // Add vertical spacing

                // Stylish Add Transaction Button
                // Inside your AddTransactionScreen widget:

                _buildStylishButton(
                  label: 'Add Transaction',
                  onPressed: () async {
                    if (_formKey.currentState?.validate() ?? false) {
                      // Get the current user ID
                      String? userId = FirebaseHelper().getCurrentUser()?.uid;

                      if (userId != null) {
                        // Call FirebaseHelper to add the transaction to Firestore
                        await FirebaseHelper().addTransactionToFirestore(
                          userId: userId,
                          name: _nameController.text,
                          price: double.tryParse(_priceController.text) ?? 0.0,
                          date: _selectedDate,
                        );

                        // Show success SnackBar
                        showStylishSnackBar(context, 'Transaction Added');

                        // Navigate back to the previous screen
                        Navigator.pop(context);
                      } else {
                        // Handle the case where the user is not logged in
                        showStylishSnackBar(context, 'Please log in first');
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper widget to build stylish input fields
  Widget _buildInputField({
    required String label,
    required String hintText,
    required TextEditingController controller,
    TextInputType? keyboardType,
    required String? Function(String?) validator,
    IconData? icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty)
          Text(
            label,
            style: FontHelper.font18BoldWhite.copyWith(color: Colors.white),
          ),
        verticalSpace(8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 15,
                spreadRadius: 5,
              ),
            ],
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: hintText,
              filled: true,
              fillColor: Colors.transparent,
              prefixIcon:
                  icon != null ? Icon(icon, color: MyColors.navyColor) : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            ),
            validator: validator,
          ),
        ),
      ],
    );
  }

  // Helper widget for a stylish button
  Widget _buildStylishButton({
    required String label,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: double.infinity,
      height: 50.h,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [MyColors.orangeColor, MyColors.redColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 15,
            spreadRadius: 5,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent, // Remove default color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          elevation: 0, // Remove the default elevation
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
