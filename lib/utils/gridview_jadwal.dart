import 'package:flutter/material.dart';

class GridViewJadwal extends StatelessWidget {
  const GridViewJadwal({
    required this.hariJadwal,
    required this.totalJadwal,
    required this.onTap,
    required this.color,
    super.key,
  });

  final String hariJadwal;
  final String totalJadwal;
  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 187,
          height: 103,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                blurRadius: 15,
                offset: Offset(6, 10),
                color: Colors.black12,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  hariJadwal,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                Text(
                  totalJadwal,
                  style: TextStyle(
                    color: color,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
