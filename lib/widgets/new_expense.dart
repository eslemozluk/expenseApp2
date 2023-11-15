import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({Key? key}) : super(key: key);

  @override
  _NewExpenseState createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _namecontroller = TextEditingController();
  final _amountCountroller = TextEditingController();
  DateTime _tarih = DateTime.now();
  void changeDate(DateTime date) {
    setState(() {
      _tarih = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _namecontroller,
              maxLength: 50,
              decoration: const InputDecoration(label: Text("Expense Name")),
            ),
            TextField(
              controller: _amountCountroller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  label: Text("Expense Name"), prefixText: "₺"),
            ),
            IconButton(
                onPressed: () async {
                  //kullanıcıya tarih seçimini göstren pencereyi aç
                  var date = await showDatePicker(
                    context: context,
                    initialDate: _tarih,
                    firstDate: DateTime(2000, 1, 1),
                    lastDate: DateTime(2200, 12, 31),
                  );
                  //Eğer kullanıcı bir tarih seçerse tarihi güncelle
                  if (date != null) {
                    changeDate(date);
                  }
                  //Date Picker açmak
                },
                icon: const Icon(Icons.calendar_month)),
            Text("tarih seçiniz"),
            ElevatedButton(
                onPressed: () {
                  print("kayıt Başarılı: ${_namecontroller.text}");
                },
                child: const Text("kaydet")),
          ],
        ));
  }
}
