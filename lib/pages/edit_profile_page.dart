import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  final String initialName;
  final String initialEmail;

  const EditProfilePage({
    super.key,
    required this.initialName,
    required this.initialEmail,
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _addressController;
  late final TextEditingController _birthDateController;
  late final TextEditingController _bioController;
  String? _gender;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName);
    _emailController = TextEditingController(text: widget.initialEmail);
    _phoneController = TextEditingController();
    _addressController = TextEditingController();
    _birthDateController = TextEditingController();
    _bioController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _birthDateController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  Widget _buildProfilePicture() {
    return Center(
      child: Stack(
        children: [
          const CircleAvatar(
            radius: 60,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, size: 70, color: Colors.black),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey.shade700,
              child: IconButton(
                icon: const Icon(Icons.camera_alt, color: Colors.white, size: 22),
                onPressed: () {
                  // PERBAIKAN: Pesan yang lebih jelas
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Fitur ganti foto sedang dikembangkan.')),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.grey[400]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Edit Profil'),
        backgroundColor: Colors.grey.shade900,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildProfilePicture(),
            const SizedBox(height: 40),
            _buildTextField(_nameController, 'Nama Lengkap', Icons.person_outline),
            const SizedBox(height: 20),
            _buildTextField(_emailController, 'Email', Icons.email_outlined),
            const SizedBox(height: 20),
            _buildTextField(_phoneController, 'Nomor Telepon', Icons.phone_outlined),
            const SizedBox(height: 20),
            _buildTextField(_addressController, 'Alamat', Icons.location_on_outlined),
            const SizedBox(height: 20),
            // PENAMBAHAN: Field baru
            _buildTextField(_birthDateController, 'Tanggal Lahir (DD/MM/YYYY)', Icons.calendar_today_outlined),
            const SizedBox(height: 20),
            _buildTextField(_bioController, 'Bio Singkat', Icons.edit_note_rounded),
            const SizedBox(height: 20),
            // PENAMBAHAN: Dropdown untuk Jenis Kelamin
            DropdownButtonFormField<String>(
              value: _gender,
              hint: const Text('Pilih Jenis Kelamin'),
              style: const TextStyle(color: Colors.white),
              dropdownColor: Colors.grey.shade900,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.wc, color: Colors.grey[400]),
              ),
              items: ['Pria', 'Wanita']
                  .map((label) => DropdownMenuItem(
                        value: label,
                        child: Text(label),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _gender = value;
                });
              },
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Perubahan berhasil disimpan!'),
                    backgroundColor: Colors.green,
                  ),
                );
                Navigator.pop(context);
              },
              child: const Text(
                'Simpan Perubahan',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
