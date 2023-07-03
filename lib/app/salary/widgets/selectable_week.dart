import 'package:flutter/material.dart';
import 'package:life_manager/app/salary/widgets/calendar_cell_card.dart';

class SelectableWeek extends StatefulWidget {
  const SelectableWeek({
    super.key,
    this.gap = 8,
    this.initialData,
    this.onChange,
  });

  final double gap;
  final Set<int>? initialData;

  final void Function(Set<int> selected)? onChange;

  @override
  State<SelectableWeek> createState() => _SelectableWeekState();
}

class _SelectableWeekState extends State<SelectableWeek> {
  final _mon = DateTime(2023, 1, 2);
  final _tue = DateTime(2023, 1, 3);
  final _wed = DateTime(2023, 1, 4);
  final _thu = DateTime(2023, 1, 5);
  final _fri = DateTime(2023, 1, 6);
  final _sat = DateTime(2023, 1, 7);
  final _sun = DateTime(2023, 1, 8);

  late Set<int> selected;

  @override
  void initState() {
    super.initState();
    selected = widget.initialData != null ? {...widget.initialData!} : {};
  }

  double _getSize(double maxWidth) => (maxWidth - 6 * widget.gap) / 7;

  void _toggle(int weekday) {
    final edited = {...selected};

    if (selected.contains(weekday)) {
      edited.remove(weekday);
    } else {
      edited.add(weekday);
    }

    setState(() {
      selected = edited;
    });

    widget.onChange?.call(edited);
  }

  Widget _buildCard(DateTime date, double size) {
    return GestureDetector(
      onTap: () => _toggle(date.weekday),
      child: CalendarCellCard(
        size: size,
        date: date,
        type: CalendarCellType.weekday,
        selected: selected.contains(date.weekday),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final gap = SizedBox(width: widget.gap);

    return LayoutBuilder(
      builder: (context, constraints) {
        final size = _getSize(constraints.maxWidth);

        return Row(
          children: [
            _buildCard(_mon, size),
            gap,
            _buildCard(_tue, size),
            gap,
            _buildCard(_wed, size),
            gap,
            _buildCard(_thu, size),
            gap,
            _buildCard(_fri, size),
            gap,
            _buildCard(_sat, size),
            gap,
            _buildCard(_sun, size),
          ],
        );
      },
    );
  }
}
