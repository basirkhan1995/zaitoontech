import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:zaitoontech/components/colors/colors.dart';
import 'package:zaitoontech/components/methods/screen_layout.dart';
import 'package:zaitoontech/services/jsonModel/usersModel.dart';
import 'package:zaitoontech/services/localDB/local_db.dart';
import '../../../components/getX_controllers/xController.dart';
import '../../../components/methods/app_header.dart';
import '../../../components/methods/input_field.dart';
import '../../../components/methods/switch_button.dart';

class NewEmployee extends StatefulWidget {
  const NewEmployee({Key? key}) : super(key: key);

  @override
  State<NewEmployee> createState() => _NewEmployeeState();
}

class _NewEmployeeState extends State<NewEmployee> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _email = TextEditingController();
  final _cellPhone = TextEditingController();
  final _userName = TextEditingController();
  final _userPassword = TextEditingController();
  final _confirmPassword = TextEditingController();

  DateTime start = DateTime(2022, 12, 24);
  DateTime end = DateTime(2022, 12, 24);
  Future<DateTime?> startDate() => showDatePicker(
      context: context,
      initialDate: end,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100));

  Future<DateTime?> endDate() => showDatePicker(
      context: context,
      initialDate: start,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100));

  final controller = Get.put(XController());
  int _currentStep = 0;
  List<Step> getSteps() => [
        Step(
          title: const Text("Personal Information"),
          content: Column(
            children: [
              SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          minVerticalPadding: 5,
                          title: const Text(
                            "personal_info",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ).tr(),
                        ),
                        const SizedBox(height: 10),
                        Row(children: [
                          Expanded(
                            child: InputField(
                              inputAction: TextInputAction.next,
                              controller: _firstName,
                              radius: 8,
                              height: 45,
                              width: .8,
                              hint: "firstname",
                              prefixIcon: Icons.person,
                              validator: (value) => controller
                                  .inputFieldValidator(value, "firstname"),
                            ),
                          ),
                          const SizedBox(width: 3),
                          Expanded(
                            child: InputField(
                              inputAction: TextInputAction.next,
                              controller: _lastName,
                              radius: 8,
                              height: 45,
                              width: .8,
                              hint: "lastname",
                              prefixIcon: Icons.people_alt,
                              validator: (value) => controller
                                  .inputFieldValidator(value, "lastname"),
                            ),
                          ),
                        ]),
                        InputField(
                          inputAction: TextInputAction.next,
                          inputFormat: [FilteringTextInputFormatter.digitsOnly],
                          controller: _cellPhone,
                          radius: 8,
                          height: 45,
                          width: .9,
                          hint: "phone",
                          prefixIcon: Icons.call,
                          validator: (value) =>
                              controller.inputFieldValidator(value, "phone"),
                        ),
                        InputField(
                          inputAction: TextInputAction.next,
                          controller: _email,
                          radius: 8,
                          height: 45,
                          width: .8,
                          hint: "email",
                          prefixIcon: Icons.email,
                          validator: (value) =>
                              controller.emailValidator(value),
                        ),
                        InputField(
                          inputAction: TextInputAction.next,
                          controller: _userName,
                          radius: 8,
                          height: 45,
                          width: .8,
                          hint: "username",
                          prefixIcon: Icons.account_circle,
                          validator: (value) =>
                              controller.inputFieldValidator(value, "username"),
                        ),
                        Obx(() => InputField(
                              inputAction: TextInputAction.next,
                              obscureText: controller.isInvisible.value,
                              suffixIcon: IconButton(
                                icon: !controller.isInvisible.value
                                    ? const Icon(Icons.visibility, color: kBlue)
                                    : const Icon(Icons.visibility_off,
                                        color: kBlue),
                                onPressed: () {
                                  controller.isInvisible.value =
                                      !controller.isInvisible.value;
                                },
                              ),
                              validator: (value) =>
                                  controller.passwordValidator(value!),
                              controller: _userPassword,
                              radius: 8,
                              width: .8,
                              height: 45,
                              hint: "password",
                              prefixIcon: Icons.lock,
                            )),
                        Obx(() => InputField(
                              inputAction: TextInputAction.done,
                              suffixIcon: IconButton(
                                icon: !controller.isInvisible.value
                                    ? const Icon(Icons.visibility, color: kBlue)
                                    : const Icon(Icons.visibility_off,
                                        color: kBlue),
                                onPressed: () {
                                  controller.isInvisible.value =
                                      !controller.isInvisible.value;
                                },
                              ),
                              obscureText: controller.isInvisible.value,
                              validator: (value) {
                                if (_userPassword.text !=
                                    _confirmPassword.text) {
                                  return "password_not_matched";
                                }
                                return null;
                              },
                              controller: _confirmPassword,
                              radius: 8,
                              width: .8,
                              height: 45,
                              hint: "confirm_password",
                              prefixIcon: Icons.lock,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          isActive: _currentStep >= 0,
          state: _currentStep > 0 ? StepState.complete : StepState.indexed,
        ),
        Step(
          title: const Text("Contract Details"),
          content: Column(
            children: [
              const Text("contract_details"),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 10),
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width * .95,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kBlue.withOpacity(.03),
                        ),
                        child: ListTile(
                          title:
                              Text("${start.year}/${start.month}/${start.day}"),
                          trailing: IconButton(
                              onPressed: () async {
                                final date = await startDate();
                                if (date == null) return;
                                setState(() => start = date);
                              },
                              icon:
                                  const Icon(Icons.expand_circle_down_rounded)),
                          leading: const Icon(Icons.date_range),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 10),
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width * .95,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kBlue.withOpacity(.03),
                        ),
                        child: ListTile(
                          title: Text("${end.year}/${end.month}/${end.day}"),
                          trailing: IconButton(
                              onPressed: () async {
                                final date = await endDate();
                                if (date == null) return;
                                setState(() => end = date);
                              },
                              icon:
                                  const Icon(Icons.expand_circle_down_rounded)),
                          leading: const Icon(Icons.date_range),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          isActive: _currentStep >= 1,
          state: _currentStep > 1 ? StepState.complete : StepState.indexed,
        ),
        Step(
          title: const Text("User role"),
          content: SizedBox(
            height: 700,
            width: 600,
            child: GetBuilder<XController>(builder: (context) {
              return Column(
                children: [
                  SwitchRole(
                      switchTitle: "settings",
                      subTitle: controller.isSettings.toString(),
                      switchValue: controller.isSettings,
                      onChanged: (value) => controller.settingsSwitch(value)),
                  SwitchRole(
                      switchTitle: "finance",
                      subTitle: controller.isSettings.toString(),
                      switchValue: controller.isSettings,
                      onChanged: (value) => controller.settingsSwitch(value)),
                  SwitchRole(
                      switchTitle: "hr",
                      subTitle: controller.isSettings.toString(),
                      switchValue: controller.isSettings,
                      onChanged: (value) => controller.settingsSwitch(value)),
                  SwitchRole(
                      switchTitle: "security",
                      subTitle: controller.isSettings.toString(),
                      switchValue: controller.isSettings,
                      onChanged: (value) => controller.settingsSwitch(value)),
                  SwitchRole(
                      switchTitle: "privacy",
                      subTitle: controller.isSettings.toString(),
                      switchValue: controller.isSettings,
                      onChanged: (value) => controller.settingsSwitch(value)),
                  SwitchRole(
                      switchTitle: "language",
                      subTitle: controller.isSettings.toString(),
                      switchValue: controller.isSettings,
                      onChanged: (value) => controller.settingsSwitch(value)),
                  SwitchRole(
                      switchTitle: "help",
                      subTitle: controller.isSettings.toString(),
                      switchValue: controller.isSettings,
                      onChanged: (value) => controller.settingsSwitch(value)),
                  SwitchRole(
                      switchTitle: "help",
                      subTitle: controller.isSettings.toString(),
                      switchValue: controller.isSettings,
                      onChanged: (value) => controller.settingsSwitch(value)),
                  SwitchRole(
                      switchTitle: "help",
                      subTitle: controller.isSettings.toString(),
                      switchValue: controller.isSettings,
                      onChanged: (value) => controller.settingsSwitch(value)),
                ],
              );
            }),
          ),
          isActive: _currentStep >= 2,
          state: _currentStep > 2 ? StepState.complete : StepState.indexed,
        ),
        Step(
          title: const Text("Profile Image"),
          content: Column(
            children: [
              Stack(
                children: [
                  const CircleAvatar(
                    backgroundColor: kBlue,
                    radius: 90,
                    child: CircleAvatar(
                      radius: 88,
                      backgroundImage: AssetImage('assets/ghufran.jpg'),
                    ),
                  ),
                  Positioned(
                      top: 130,
                      left: 130,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: IconButton(
                            splashRadius: 50,
                            splashColor: kBlue.withOpacity(.05),
                            onPressed: () {},
                            icon: const Icon(Icons.camera_alt)),
                      )),
                ],
              ),
              const SizedBox(height: 15),
              TextButton(onPressed: () {}, child: const Text("upload"))
            ],
          ),
          isActive: _currentStep >= 3,
          state: _currentStep > 3 ? StepState.complete : StepState.indexed,
        ),
        Step(
          title: const Text("Complete"),
          content: Column(
            children: const [Text("Account Successfully Created")],
          ),
          isActive: _currentStep >= 4,
          state: _currentStep == 4 ? StepState.complete : StepState.indexed,
        ),
      ];
  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
        mobile: newEmployeeMobile(),
        tablet: newEmployeeTablet(context),
        desktop: newEmployeeDesktop(context));
  }

  Widget newEmployeeMobile() {
    return Scaffold(
        appBar: AppBar(
          title: const Text("new_employee"),
        ),
        body: const Text("new Employee Mobile"));
  }

  Widget newEmployeeTablet(context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("new_employee"),
        ),
        body: const Text("New Employee Tablet"));
  }

  Widget newEmployeeDesktop(context) {
    return Scaffold(
        body: Column(
      children: [
        const AppHeader(
            title: "new_employee",
            leadingIcon: Icons.dashboard_customize_sharp),
        //Body
        const SizedBox(height: 8),

        Expanded(
          child: Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(primary: kBlue),
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Stepper(
                onStepTapped: (step) => setState(() {
                  _currentStep = step;
                }),
                elevation: 0,
                type: StepperType.horizontal,
                currentStep: _currentStep,
                steps: getSteps(),
                controlsBuilder: (context, _) {
                  return Row(
                    children: <Widget>[
                      TextButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            await DBHelper.createUser(
                                UserModel(
                                    usrName: _userName.text,
                                    usrPass: _userPassword.text,
                                    usrEmail: _email.text,
                                    usrFirstName: _firstName.text,
                                    usrLastName: _lastName.text,
                                    usrPhone: _cellPhone.text)
                            ).then((value) => debugPrint('user Created successfully'));
                            final isLastStep = _currentStep == getSteps().length - 1;
                            if (isLastStep){
                            } else {
                              setState(() {
                                _currentStep += 1;
                              });
                            }
                          }
                        },
                        child: const Text('Next'),
                      ),
                      TextButton(
                        onPressed: _currentStep == 0
                            ? null
                            : () => setState(() {
                                  _currentStep -= 1;
                                }),
                        child: const Text('Back'),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        )
      ],
    ));
  }
}
