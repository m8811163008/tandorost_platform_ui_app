import 'package:athletes_directory/athletes_directory.dart';
import 'package:athletes_directory/src/coach_finance_info_dialog.dart';
import 'package:athletes_directory/src/coach_work_space/edit_dialog.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class CoachFinance extends StatelessWidget {
  const CoachFinance({super.key});

  Widget _buildFinanceBalance(BuildContext context) {
    return BlocSelector<AthelteDirectoryCubit, AthelteDirectoryState, double>(
      selector: (state) => state.subscription
          .where((e) => e.paymentStatus.isNotPaid)
          .fold(0.0, (value, element) => value + element.paidAmount),
      builder: (context, balance) {
        return Text(context.l10n.financeSectionBalance(balance, 'ریال'));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppCardHeader(title: context.l10n.financeSectionHeadline),
          _buildFinanceBalance(context),
          SizedBox(height: context.sizeExtenstion.small),
          EditFinanceCardId(),
          Text(
            context.l10n.financeSectionBalanceSubtitle,
            style: context.textTheme.labelSmall,
          ),

          // Text(context.l10n.inviteTraineeSectionSubtitle2),
          // SizedBox(height: context.sizeExtenstion.small),
          // Directionality(
          //   textDirection: TextDirection.ltr,
          //   child: RegullarTextField(
          //     label: context.l10n.inviteTraineeSectionTextFieldLabel,
          //     hintText: context.l10n.inviteTraineeSectionTextFieldHint,
          //     textAlign: TextAlign.left,
          //     onChange: (value) {},
          //     suffixWidget: TextButton.icon(
          //       onPressed: () {},
          //       label: Text(context.l10n.send),
          //       icon: Icon(Icons.send),
          //     ),

          //     validator: (value) {
          //       if (value == null || value.isEmpty) {
          //         return context.l10n.emptyFormFieldValidationError;
          //       } else {
          //         final phonenumberEmailRegex = RegExp(
          //           r'(^09\d{9}$)|(^[^@]+@[^@]+\.[^@]+$)',
          //         );
          //         if (!phonenumberEmailRegex.hasMatch(value)) {
          //           return context.l10n.identifierTextFieldValidationError;
          //         }
          //       }
          //       return null;
          //     },
          //   ),
          // ),
          // SizedBox(height: context.sizeExtenstion.small),
        ],
      ),
    );
  }
}

class EditFinanceCardId extends StatefulWidget {
  const EditFinanceCardId({super.key});

  @override
  State<EditFinanceCardId> createState() => _EditFinanceCardIdState();
}

class _EditFinanceCardIdState extends State<EditFinanceCardId> {
  String? _cardId;
  @override
  void initState() {
    final cubit = context.read<AthelteDirectoryCubit>();
    _cardId = cubit.state.userProfile?.financeCardId;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return UserInfoRichText(
      label: context.l10n.coachFinanceId,
      value: _cardId ?? '',
      editValueButton: EditDialog(
        dialog: CoachFinanceInfoDialog(
          dialogTitle: context.l10n.dialogTitleChangeName,
          textFieldlabel: context.l10n.changeNameTextFieldLabel,
          initialValue: _cardId ?? '',
          onChnaged: (value) {
            setState(() {
              _cardId = value;
            });
          },
          onSubmit: _cardId != null
              ? () {
                  context.read<AthelteDirectoryCubit>().onUpdateFinanceCardId(
                    _cardId!,
                  );
                }
              : null,
        ),
      ),
    );
  }
}
