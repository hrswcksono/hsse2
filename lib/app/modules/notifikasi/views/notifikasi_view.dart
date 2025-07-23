import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hsse2/app/data/models/NotifikasiResponse.dart';
import 'package:hsse2/app/modules/notifikasi/controllers/notifikasi_controller.dart';
import 'package:hsse2/app/routes/app_pages.dart';
import 'package:hsse2/app/widgets/global_app_bar.dart';
import 'package:hsse2/utils/values/colors.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NotifikasiView extends GetView<NotifikasiController> {
  const NotifikasiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        pTitle: "Notifikasi",
        pBgColor: CustomColor.appBarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: SmartRefresher(
          controller: controller.xRefreshController,
          enablePullDown: true,
          enablePullUp: false,
          header: WaterDropMaterialHeader(
            backgroundColor: Colors.white,
            color: const Color(0xFF4ECDC4),
          ),
          onRefresh: controller.onRefreshData,
          child: controller.obx(
            (itemdata) {
              if (itemdata == null || itemdata.isEmpty) {
                return const Center(
                  child: Text(
                    'Tidak ada notifikasi permit',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }
        
              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                physics: const ClampingScrollPhysics(),
                itemCount: itemdata.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final item = itemdata[index];
                  return _buildNotificationItem(item, index);
                },
              );
            },
            onEmpty: const Center(
              child: Text(
                'Tidak ada notifikasi permit',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationItem(NotifikasiItem item, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          if (item.jenis == 'PERMIT APPROVE' ||
              item.jenis == 'PERMIT SELESAI' ||
              item.jenis == 'PERMIT BARU') {
            Get.toNamed(
              Routes.PERMIT_DETAIL,
              arguments: {
                "idpermit": item.id,
                "idjenispermit": item.idjenis,
                'asal': "list",
                'action': 'approve',
              },
            );
          } else if (item.jenis == 'SAFETY PATROL') {
            Get.toNamed(
              Routes.UNSAFE_ACTION_DETAIL,
              arguments: {
                "idunsafe": item.id,
                "idjenisunsafe": item.idjenis,
                'asal': "approve",
              },
            );
          }
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Avatar
              CircleAvatar(
                radius: 20,
                backgroundColor: _getStatusColor(item.jenis!),
                child: Text(
                  _getInitials(item.nama!),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(width: 12),

              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Nama dan Kode
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            item.nama!.trim(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        if (item.jenis == 'PERMIT APPROVE' ||
                            item.jenis == 'PERMIT SELESAI' ||
                            item.jenis == 'PERMIT BARU')
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: _getStatusColor(item.jenis!),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              item.kode!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 6),

                    // Status
                    Text(
                      item.jenis!,
                      style: TextStyle(
                        fontSize: 12,
                        color: _getStatusColor(item.jenis!),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),

                    // Tanggal dan Role
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 12,
                          color: Colors.grey[500],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          _formatDate(item.tgltrans.toString()),
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey[500],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            item.userbuat!,
                            style: TextStyle(
                              fontSize: 9,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Status indicator
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _getStatusColor(item.jenis!),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getStatusColor(String jenis) {
    switch (jenis.toUpperCase()) {
      case 'PERMIT SELESAI':
        return const Color(0xFF4CAF50); // Green
      case 'PERMIT APPROVE':
        return const Color(0xFF2196F3); // Blue
      case 'PERMIT BARU':
        return Colors.red; // Blue
      default:
        return Colors.grey;
    }
  }

  String _getInitials(String name) {
    List<String> nameParts = name.trim().split(' ');
    if (nameParts.length >= 2) {
      return '${nameParts[0][0]}${nameParts[1][0]}'.toUpperCase();
    } else if (nameParts.isNotEmpty) {
      return nameParts[0][0].toUpperCase();
    }
    return 'U';
  }

  String _formatDate(String dateStr) {
    try {
      final date = DateTime.parse(dateStr);
      final now = DateTime.now();
      final difference = now.difference(date).inDays;

      if (difference == 0) {
        return 'Hari ini';
      } else if (difference == 1) {
        return 'Kemarin';
      } else if (difference < 7) {
        return '$difference hari lalu';
      } else {
        final months = [
          '',
          'Jan',
          'Feb',
          'Mar',
          'Apr',
          'Mei',
          'Jun',
          'Jul',
          'Agu',
          'Sep',
          'Okt',
          'Nov',
          'Des',
        ];
        return '${date.day} ${months[date.month]} ${date.year}';
      }
    } catch (e) {
      return dateStr;
    }
  }
}
