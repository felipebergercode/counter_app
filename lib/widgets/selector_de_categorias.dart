import 'package:counter_app/styles/colors.dart';
import 'package:flutter/material.dart';

class SelectorDeCategorias extends StatefulWidget {
  final String? selectedCategory;
  final ValueChanged<String?> onChanged;
  const SelectorDeCategorias({
    super.key,
    this.selectedCategory,
    required this.onChanged,
  });

  @override
  State<SelectorDeCategorias> createState() => _SelectorDeCategoriasState();
}

class _SelectorDeCategoriasState extends State<SelectorDeCategorias> {
  final List<String> categories = [
    'Comida',
    'Transporte',
    'Entretenimiento',
    'Servicios',
    'Otros',
  ];

  String? selectedCategorie;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFFD0D0D0)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedCategorie,
          isExpanded: true,
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Color(0xFF9E9E9E),
          ),
          hint: const Text(
            'Seleccioná una categoría',
            style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 15),
          ),
          items: categories
              .map(
                (cat) => DropdownMenuItem(
                  value: cat,
                  child: Text(
                    cat,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
              .toList(),
          onChanged: (value) {
            setState(() {
              selectedCategorie = value;
            });
          },
          selectedItemBuilder: (context) => categories
              .map(
                (cat) => Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    cat,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: appColors.primaryColor,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
