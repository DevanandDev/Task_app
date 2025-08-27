import 'package:flutter/material.dart';

Widget textFieldLog({required String label,required Icon icon, bool obscure =false ,required TextEditingController controler}) {
    return TextField(
      controller: controler,
                      obscureText: obscure,
                      decoration: InputDecoration(
                        prefixIcon: icon,
                        labelText: label,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    );
  }