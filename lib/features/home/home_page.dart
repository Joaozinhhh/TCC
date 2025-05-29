import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:src/common/constants/app_colors.dart';
import 'package:src/common/constants/app_text_styles.dart';
import 'package:src/common/extensions/sizes.dart';
import 'package:src/common/widgets/custom_circular_progress_indicator.dart';
import 'package:src/locator.dart';
import 'home_controller.dart';
import 'home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double get textScaleFactor =>
      MediaQuery.of(context).size.width < 360 ? 0.7 : 1.0;
  double get iconSize => MediaQuery.of(context).size.width < 360 ? 16.0 : 24.0;

  final controller = locator.get<HomeController>();

  @override
  void initState() {
    super.initState();
    controller.getAllTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColors.azul_claro, AppColors.azul_escuro],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(500, 30),
                  bottomRight: Radius.elliptical(500, 30),
                ),
              ),
              height: 287.h,
            ),
          ),
          Positioned(
            left: 24.0,
            right: 24.0,
            top: 74.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Boa tarde,',
                      textScaleFactor: textScaleFactor,
                      style: AppTextStyles.SmallText.copyWith(
                        color: AppColors.branco,
                      ),
                    ),
                    Text(
                      'João da Silva',
                      textScaleFactor: textScaleFactor,
                      style: AppTextStyles.MediumText.copyWith(
                        color: AppColors.branco,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                    color: AppColors.branco.withOpacity(0.06),
                  ),
                  child: Stack(
                    alignment: const AlignmentDirectional(0.5, -0.5),
                    children: [
                      const Icon(
                        Icons.notifications_none_outlined,
                        color: AppColors.branco,
                      ),
                      Container(
                        width: 8.w,
                        height: 8.w,
                        decoration: BoxDecoration(
                          color: AppColors.vermelho,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 24.w,
            right: 24.w,
            top: 155.h,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
              decoration: const BoxDecoration(
                color: AppColors.azul_escuro,
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Saldo Total',
                            textScaleFactor: textScaleFactor,
                            style: AppTextStyles.MediumText.copyWith(
                              color: AppColors.branco,
                            ),
                          ),
                          Text(
                            'R\$ 1.556,00',
                            textScaleFactor: textScaleFactor,
                            style: AppTextStyles.MediumText.copyWith(
                              color: AppColors.branco,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () => log('options'),
                        child: PopupMenuButton(
                          padding: EdgeInsets.zero,
                          child: const Icon(
                            Icons.more_horiz,
                            color: AppColors.branco,
                          ),
                          itemBuilder:
                              (context) => [
                                const PopupMenuItem(
                                  height: 24.0,
                                  child: Text("Item 1"),
                                ),
                              ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 36.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              color: AppColors.branco.withOpacity(0.06),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(16.0),
                              ),
                            ),
                            child: Icon(
                              Icons.arrow_downward,
                              color: AppColors.branco,
                              size: iconSize,
                            ),
                          ),
                          const SizedBox(width: 4.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Receitas',
                                textScaleFactor: textScaleFactor,
                                style: AppTextStyles.MediumText.copyWith(
                                  color: AppColors.branco,
                                ),
                              ),
                              Text(
                                'R\$ 1.840,00',
                                textScaleFactor: textScaleFactor,
                                style: AppTextStyles.MediumText.copyWith(
                                  color: AppColors.branco,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              color: AppColors.branco.withOpacity(0.06),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(16.0),
                              ),
                            ),
                            child: Icon(
                              Icons.arrow_upward,
                              color: AppColors.branco,
                              size: iconSize,
                            ),
                          ),
                          const SizedBox(width: 4.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Despesas',
                                textScaleFactor: textScaleFactor,
                                style: AppTextStyles.MediumText.copyWith(
                                  color: AppColors.branco,
                                ),
                              ),
                              Text(
                                'R\$ 2.824,00',
                                textScaleFactor: textScaleFactor,
                                style: AppTextStyles.MediumText.copyWith(
                                  color: AppColors.branco,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 397.h,
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Histórico de Transações',
                        style: AppTextStyles.MediumText,
                      ),
                      Text('Ver tudo', style: AppTextStyles.inputLabelText),
                    ],
                  ),
                ),
                Expanded(
                  child: AnimatedBuilder(
                    animation: controller,
                    builder: (context, _) {
                      if (controller.state is HomeStateLoading) {
                        return const CustomCircularProgressIndicator(
                          color: AppColors.azul_claro,
                        );
                      }
                      if (controller.state is HomeStateError) {
                        return const Center(
                          child: Text('Ocorreu um erro ao carregar.'),
                        );
                      }
                      if (controller.transactions.isEmpty) {
                        return const Center(
                          child: Text('Nenhuma transação no momento.'),
                        );
                      }
                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: controller.transactions.length,
                        itemBuilder: (context, index) {
                          final item = controller.transactions[index];
                          final color =
                              item.value.isNegative
                                  ? AppColors.vermelho
                                  : AppColors.verde;
                          final value = "R\$ ${item.value.toStringAsFixed(2)}";
                          return ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            leading: Container(
                              decoration: const BoxDecoration(
                                color: AppColors.branco,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                              ),
                              padding: const EdgeInsets.all(8.0),
                              child: const Icon(Icons.monetization_on_outlined),
                            ),
                            title: Text(
                              item.description,
                              style: AppTextStyles.MediumText,
                            ),
                            subtitle: Text(
                              // Ajuste o formato da data conforme seu modelo
                              DateTime.fromMillisecondsSinceEpoch(
                                item.date,
                              ).toString(),
                              style: AppTextStyles.SmallText,
                            ),
                            trailing: Text(
                              value,
                              style: AppTextStyles.MediumText.copyWith(
                                color: color,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
