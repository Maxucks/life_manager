import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_manager/app/core/dependency_injection/injector/inject_provider.dart';
import 'package:life_manager/app/core/ui/theme/bloc/theme_bloc.dart';
import 'package:life_manager/app/core/ui/theme/bloc/theme_events.dart';
import 'package:life_manager/app/core/ui/theme/bloc/theme_state.dart';
import 'package:life_manager/app/core/ui/theme/core/theme_provider.dart';
import 'package:life_manager/app/salary/ui/blocs/salary/bloc.dart';
import 'package:life_manager/app/salary/ui/blocs/salary/events.dart';
import 'package:life_manager/app/salary/ui/blocs/salary/state.dart';
import 'package:life_manager/app/salary/ui/screens/widgets/salary_screen_calendar.dart';
import 'package:life_manager/app/salary/ui/screens/widgets/salary_screen_content.dart';

class SalaryScreen extends StatefulWidget {
  const SalaryScreen({
    super.key,
  });

  @override
  State<SalaryScreen> createState() => _SalaryScreenState();
}

class _SalaryScreenState extends State<SalaryScreen> {
  @override
  void didChangeDependencies() {
    final bloc = context.injector.obtain<SalaryBloc>();
    bloc.add(CalculateSalaryEvent());

    super.didChangeDependencies();
  }

  void _onPageChanged(int page) {
    // final bloc = context.injector.obtain<SalaryBloc>();

    // if (page > currentPage) {
    //   bloc.add(ChangeSalaryMonthEvent(
    //     direction: ChangeMonthDirection.next,
    //   ));
    // } else {
    //   bloc.add(ChangeSalaryMonthEvent(
    //     direction: ChangeMonthDirection.prev,
    //   ));
    // }

    // setState(() {
    //   currentPage = page;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.palette.background.primary,
      body: BlocBuilder<SalaryBloc, SalaryState>(
        builder: (context, state) {
          if (state.constraints == null) {
            return const Center(
              child: Text("Constraints are null"),
            );
          }

          if (state.calculation == null) {
            return const Center(
              child: Text("Calculation is null"),
            );
          }

          return CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.only(
                  top: kToolbarHeight,
                  left: 16,
                  right: 16,
                  bottom: 6,
                ),
                sliver: SliverToBoxAdapter(
                  child: BlocBuilder<ThemeBloc, ThemeState>(
                    builder: (context, state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Dark mode",
                            style: TextStyle(
                              color: context.theme.palette.text.primary,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Switch(
                            activeColor: context.theme.palette.accent.primary,
                            inactiveThumbColor:
                                context.theme.palette.text.primary,
                            inactiveTrackColor: Colors.transparent,
                            value: !state.isLightTheme,
                            onChanged: (value) {
                              final bloc = context.read<ThemeBloc>();
                              bloc.add(SwitchThemeEvent());
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SwipeToAction(
                  onAction: (direction) {
                    final bloc = context.injector.obtain<SalaryBloc>();

                    if (direction == DismissDirection.endToStart) {
                      bloc.add(ChangeSalaryMonthEvent(
                        direction: ChangeMonthDirection.next,
                      ));
                    } else {
                      bloc.add(ChangeSalaryMonthEvent(
                        direction: ChangeMonthDirection.prev,
                      ));
                    }
                  },
                  child: SalaryScreenCalendar(
                    currentDate: state.currentDate,
                    calculation: state.calculation!,
                    constraints: state.constraints!,
                  ),
                ),
              ),
              SalaryScreenContent(
                calculation: state.calculation!,
                constraints: state.constraints!,
              ),
            ],
          );
        },
      ),
    );
  }
}

class SwipeToAction extends StatefulWidget {
  const SwipeToAction({
    super.key,
    required this.child,
    this.onAction,
  });

  final Widget child;

  final Function(DismissDirection direction)? onAction;

  @override
  State<SwipeToAction> createState() => _SwipeToActionState();
}

class _SwipeToActionState extends State<SwipeToAction>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this);
    _animation = Tween<double>(
      begin: -1.0,
      end: 1.0,
    ).animate(_animationController);
    _animationController.animateTo(0.0, duration: Duration.zero);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              final (currentValue, isLeftAction) =
                  _animationController.value == 0.0
                      ? (0.0, null)
                      : _animation.value < 0
                          ? (-_animation.value, true)
                          : (_animation.value, false);

              return Positioned(
                left: isLeftAction != null && isLeftAction
                    ? 16 * currentValue
                    : null,
                bottom: 0,
                top: 0,
                right: isLeftAction != null && isLeftAction
                    ? null
                    : 16 * currentValue,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: isLeftAction == null
                        ? []
                        : isLeftAction
                            ? [
                                Icon(
                                  Icons.navigate_before_rounded,
                                  size: 32 * currentValue,
                                ),
                                Text(
                                  "Previous",
                                  textScaleFactor: currentValue,
                                ),
                              ]
                            : [
                                Text(
                                  "Next",
                                  textScaleFactor: currentValue,
                                ),
                                Icon(
                                  Icons.navigate_next_rounded,
                                  size: 32 * currentValue,
                                ),
                              ],
                  ),
                ),
              );
            }),
        Dismissible(
          onUpdate: (details) {
            if (details.direction == DismissDirection.endToStart) {
              _animationController.animateTo(
                details.progress * 2.5,
                duration: Duration.zero,
              );
            } else {
              _animationController.animateTo(
                -details.progress * 2.5,
                duration: Duration.zero,
              );
            }
          },
          confirmDismiss: (direction) async {
            widget.onAction?.call(direction);
            return false;
          },
          key: UniqueKey(),
          child: widget.child,
        ),
      ],
    );
  }
}
