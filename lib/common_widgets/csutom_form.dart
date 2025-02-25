import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/custom_text_field.dart';
import 'package:inspiringseniorswebapp/common_widgets/text_button.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';



class FormDialogContent extends StatefulWidget {
  @override
  _FormDialogContentState createState() => _FormDialogContentState();
}

class _FormDialogContentState extends State<FormDialogContent> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Handle form submission
      print("Name: ${nameController.text}");
      print("Email: ${emailController.text}");
      print("Phone: ${phoneController.text}");
      print("Description: ${descController.text}");

      Navigator.pop(context); // Close the form dialog

      // Show Thank You Dialog
      _showThankYouDialog(context);
    }
  }

  void _showThankYouDialog(BuildContext context) {
    showDialog(

      context: context,
      builder: (context) {
        return Container(
          child: AlertDialog(


            contentPadding: EdgeInsets.symmetric(horizontal: 30,vertical: 60),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Column(
              children: [
                Icon(Icons.check_circle, color: Colors.green, size: 50),
                SizedBox(height: 10),
                Text(
                  "Thank You!",
                  style: TextStyleUtils.heading2
                ),
              ],
            ),
            actionsPadding: EdgeInsets.symmetric(vertical: 30,horizontal: 20),
            content: Container(
              width: MediaQuery.of(context).size.width*0.4,

              child: Text(
                "Your information has been submitted successfully. Would you like to provide additional details?",
                textAlign: TextAlign.center,
                style: TextStyleUtils.heading4,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close Thank You Dialog
                  showMoreDetailsForm(context); // Open More Details Form
                },
                child: Text("Provide More Details",style: TextStyleUtils.heading5,),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close dialog
                },
                child: Text("Cancel",style: TextStyleUtils.heading5,),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        padding: EdgeInsets.symmetric(horizontal: 60,vertical: 40),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Text("Registration Form",style: TextStyleUtils.heading2,textAlign: TextAlign.center,),
              SizedBox(height: 20,),
              _buildTextField(nameController, "Full Name", Icons.person),
              _buildTextField(emailController, "Email", Icons.email, keyboardType: TextInputType.emailAddress),
              _buildTextField(phoneController, "Phone Number", Icons.phone, keyboardType: TextInputType.phone),
              _buildTextField(descController, "Description", Icons.description, maxLines: 3),

              SizedBox(height: 20),

              // Submit Button
              CustomButton(onpressed:
                _submitForm
                // Get.toNamed(RoutingNames.PDF_VIEWER_SCREEN);
              ,shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: 16,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 16,vpadding: 10,isHoverGetStarted: false.obs,text: "Submit"),


            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon, {int maxLines = 1, TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
            hoverColor: Color(0xFFF6F4F4),
            labelStyle: TextStyle(
                color:  ColorUtils.GREY_COLOR_PLACEHOLDER),
            focusColor: ColorUtils.GREY_COLOR_PLACEHOLDER,
            alignLabelWithHint: true,
            filled: true,
            fillColor: Color(0xFFF6F4F4), // Added Background Color
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                    width: 2, color: ColorUtils.GREY_DOTTED)),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  width: 2, color: ColorUtils.GREY_DOTTED),
              borderRadius: BorderRadius.circular(8),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  width: 2, color: ColorUtils.ERROR_RED),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  width: 2, color: ColorUtils.ERROR_RED),
              borderRadius: BorderRadius.circular(8),
            ),
            floatingLabelStyle: TextStyle(
                color:
                     ColorUtils.GREY_COLOR_PLACEHOLDER
                   ),
            isDense: false,
            labelText: label,
            prefixIcon: Icon(icon),
            errorStyle: TextStyle(
                color: ColorUtils.ERROR_RED,
                fontSize: TextSizeDynamicUtils.dHeight12,
                fontWeight: FontWeight.w400)),

        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return "Please enter $label";
          }
          return null;
        },
      ),
    );
  }
}

void showMoreDetailsForm(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

        content: MoreDetailsForm(),
      );
    },
  );
}

class MoreDetailsForm extends StatefulWidget {
  @override
  _MoreDetailsFormState createState() => _MoreDetailsFormState();
}

class _MoreDetailsFormState extends State<MoreDetailsForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController occupationController = TextEditingController();
  final TextEditingController commentsController = TextEditingController();

  void _submitAdditionalDetails() {
    if (_formKey.currentState!.validate()) {
      print("Address: ${addressController.text}");
      print("Occupation: ${occupationController.text}");
      print("Comments: ${commentsController.text}");

      Get.snackbar("Success", "Additional details submitted!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);

      Navigator.pop(context); // Close Additional Details Form
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        padding: EdgeInsets.symmetric(horizontal: 60,vertical: 40),

        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Additional Details",style: TextStyleUtils.heading2,textAlign: TextAlign.center,),
              SizedBox(height: 20,),

              _buildTextField(addressController, "Address", Icons.home),
              _buildTextField(occupationController, "Occupation", Icons.work),
              _buildTextField(commentsController, "Comments", Icons.comment, maxLines: 3),

              SizedBox(height: 20),


              CustomButton(onpressed:
              _submitAdditionalDetails
                  // Get.toNamed(RoutingNames.PDF_VIEWER_SCREEN);
                  ,shadowColor: ColorUtils.BRAND_COLOR_LIGHT,fontSize: 16,bgColor: ColorUtils.BRAND_COLOR,hoveredColor: ColorUtils.HEADER_GREEN,hpadding: 16,vpadding: 10,isHoverGetStarted: false.obs,text: "Submit"),


            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon, {int maxLines = 1, TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
            hoverColor: Color(0xFFF6F4F4),
            labelStyle: TextStyle(
                color:  ColorUtils.GREY_COLOR_PLACEHOLDER),
            focusColor: ColorUtils.GREY_COLOR_PLACEHOLDER,
            alignLabelWithHint: true,
            filled: true,
            fillColor: Color(0xFFF6F4F4), // Added Background Color
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                    width: 2, color: ColorUtils.GREY_DOTTED)),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  width: 2, color: ColorUtils.GREY_DOTTED),
              borderRadius: BorderRadius.circular(8),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  width: 2, color: ColorUtils.ERROR_RED),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  width: 2, color: ColorUtils.ERROR_RED),
              borderRadius: BorderRadius.circular(8),
            ),
            floatingLabelStyle: TextStyle(
                color:
                ColorUtils.GREY_COLOR_PLACEHOLDER
            ),
            isDense: false,
            labelText: label,
            prefixIcon: Icon(icon),
            errorStyle: TextStyle(
                color: ColorUtils.ERROR_RED,
                fontSize: TextSizeDynamicUtils.dHeight12,
                fontWeight: FontWeight.w400)),

        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return "Please enter $label";
          }
          return null;
        },
      ),
    );
  }
}
