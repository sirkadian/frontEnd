import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:sirkadian_project/widgets/textfield.dart';

class InitialSetupScreen extends StatefulWidget {
  static const routeName = 'initialSetup_screen';
  InitialSetupScreen({Key key}) : super(key: key);

  @override
  _InitialSetupScreenState createState() => _InitialSetupScreenState();
}

class _InitialSetupScreenState extends State<InitialSetupScreen> {
  int group = 1;

  int pageChanged = 0;
  DateTime _selectedDate;

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: PageController(initialPage: 0),
        onPageChanged: (index) {
          setState(() {
            pageChanged = index;
          });
        },
        children: [
          slideOne(context),
          slideTwo(context),
          slideThree(context),
          slideFour(context),
          slideFive(context),
          slideSix(context),
        ],
      ),
    );
  }

  Widget slideOne(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/motivasi.png',
              ),
              fit: BoxFit.cover)),
      child: Column(
        children: [
          Expanded(
            flex: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Selamat Datang',
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      .copyWith(fontSize: 46, fontWeight: FontWeight.w900),
                ),
                Text(
                  'di',
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      .copyWith(fontSize: 46, fontWeight: FontWeight.w900),
                ),
                Text(
                  'Sirkadian',
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      .copyWith(fontSize: 40, fontWeight: FontWeight.w900),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'Swipe ->',
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  .copyWith(fontSize: 30, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }

  Widget slideTwo(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.black,
      child: Column(
        children: [
          Expanded(
            flex: 10,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Kami butuh beberapa data anda untuk dapat memberikan rekomendasi hidup sehat terbaik bagi anda',
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    .copyWith(fontSize: 30, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'Swipe ->',
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  .copyWith(fontSize: 30, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }

  Widget slideThree(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 40, bottom: 10),
      color: Colors.black,
      child: Column(
        children: [
          Expanded(
            flex: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.only(bottom: 10, left: 12),
                    child: Text(
                      'Tanggal Lahir',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(fontSize: 20),
                    )),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 12),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white)),
                          onPressed: _presentDatePicker,
                          child: Container(
                            width: 165,
                            child: Text(
                              _selectedDate == null
                                  ? 'masukkan tanggal lahir'
                                  : '${DateFormat.yMd().format(_selectedDate)}',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(
                                      color: Colors.green,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                            ),
                          )),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            _selectedDate = null;
                          });
                        },
                        icon: Icon(
                          Icons.refresh,
                          color: Colors.white,
                        ))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    padding: EdgeInsets.only(left: 12),
                    child: Text(
                      'Jenis Kelamin',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(fontSize: 20),
                    )),
                Container(
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Radio(
                            activeColor: Colors.green,
                            fillColor: MaterialStateProperty.all(Colors.green),
                            value: 0,
                            groupValue: group,
                            onChanged: (target) {
                              setState(() {
                                group = target;
                              });
                            },
                          ),
                          Text('Laki-Laki')
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          Radio(
                            activeColor: Colors.green,
                            fillColor: MaterialStateProperty.all(Colors.green),
                            value: 1,
                            groupValue: group,
                            onChanged: (target) {
                              setState(() {
                                group = target;
                              });
                            },
                          ),
                          Text('Perempuan')
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'Swipe ->',
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  .copyWith(fontSize: 30, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}

Widget slideFour(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
    color: Colors.black,
    child: Column(
      children: [
        Expanded(
          flex: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.only(bottom: 10, left: 12),
                  child: Text(
                    'Tinggi Badan (cm)',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(fontSize: 20),
                  )),
              TextFields(title: 'contoh: 170', color: Colors.black),
              SizedBox(
                height: 20,
              ),
              Container(
                  padding: EdgeInsets.only(bottom: 10, left: 12),
                  child: Text(
                    'Berat Badan (kg)',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(fontSize: 20),
                  )),
              TextFields(title: 'contoh: 65', color: Colors.black),
              SizedBox(
                height: 20,
              ),
              Container(
                  padding: EdgeInsets.only(left: 12),
                  child: Text(
                    'Tingkat Keaktifan',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(fontSize: 20),
                  )),
              Container(
                child: Row(
                  children: [
                    Row(
                      children: [
                        Radio(
                          activeColor: Colors.green,
                          fillColor: MaterialStateProperty.all(Colors.green),
                          value: 0,
                          groupValue: 2,
                          onChanged: (T) {},
                        ),
                        Text('rendah')
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                        Radio(
                          activeColor: Colors.green,
                          fillColor: MaterialStateProperty.all(Colors.green),
                          value: 1,
                          groupValue: 2,
                          onChanged: (T) {},
                        ),
                        Text('Sedang')
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          activeColor: Colors.green,
                          fillColor: MaterialStateProperty.all(Colors.green),
                          value: 1,
                          groupValue: 2,
                          onChanged: (T) {},
                        ),
                        Text('Tinggi')
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.only(left: 12),
                  child: Text(
                    'Preferensi Olahraga',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(fontSize: 20),
                  )),
              Container(
                child: Row(
                  children: [
                    Row(
                      children: [
                        Radio(
                          activeColor: Colors.green,
                          fillColor: MaterialStateProperty.all(Colors.green),
                          value: 0,
                          groupValue: 2,
                          onChanged: (T) {},
                        ),
                        Text('Ringan')
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                        Radio(
                          activeColor: Colors.green,
                          fillColor: MaterialStateProperty.all(Colors.green),
                          value: 1,
                          groupValue: 2,
                          onChanged: (T) {},
                        ),
                        Text('Sedang')
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          activeColor: Colors.green,
                          fillColor: MaterialStateProperty.all(Colors.green),
                          value: 1,
                          groupValue: 2,
                          onChanged: (T) {},
                        ),
                        Text('Berat')
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            'Swipe ->',
            style: Theme.of(context)
                .textTheme
                .headline1
                .copyWith(fontSize: 30, fontWeight: FontWeight.w700),
          ),
        ),
      ],
    ),
  );
}

Widget slideFive(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
    color: Colors.black,
    child: Column(
      children: [
        Expanded(
          flex: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.only(left: 12),
                  child: Text(
                    'Apakah Anda Vegetarian?',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(fontSize: 20),
                  )),
              Container(
                child: Row(
                  children: [
                    Row(
                      children: [
                        Radio(
                          activeColor: Colors.green,
                          fillColor: MaterialStateProperty.all(Colors.green),
                          value: 0,
                          groupValue: 2,
                          onChanged: (T) {},
                        ),
                        Text('Ya')
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                        Radio(
                          activeColor: Colors.green,
                          fillColor: MaterialStateProperty.all(Colors.green),
                          value: 1,
                          groupValue: 2,
                          onChanged: (T) {},
                        ),
                        Text('Tidak')
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.only(left: 12),
                  child: Text(
                    'Apakah ingin berat badan seprti apa?',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(fontSize: 20),
                  )),
              Container(
                child: Row(
                  children: [
                    Row(
                      children: [
                        Radio(
                          activeColor: Colors.green,
                          fillColor: MaterialStateProperty.all(Colors.green),
                          value: 0,
                          groupValue: 2,
                          onChanged: (T) {},
                        ),
                        Text('Turun')
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                        Radio(
                          activeColor: Colors.green,
                          fillColor: MaterialStateProperty.all(Colors.green),
                          value: 1,
                          groupValue: 2,
                          onChanged: (T) {},
                        ),
                        Text('Tetap')
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          activeColor: Colors.green,
                          fillColor: MaterialStateProperty.all(Colors.green),
                          value: 1,
                          groupValue: 2,
                          onChanged: (T) {},
                        ),
                        Text('Sehat')
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            'Swipe ->',
            style: Theme.of(context)
                .textTheme
                .headline1
                .copyWith(fontSize: 30, fontWeight: FontWeight.w700),
          ),
        ),
      ],
    ),
  );
}

Widget slideSix(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
    color: Colors.black,
    child: Column(
      children: [
        Expanded(
          flex: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.only(left: 12),
                  child: Text(
                    'Alergi Bahan Makanan',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(fontSize: 20),
                  )),
              Container(
                padding: EdgeInsets.only(left: 12),
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    onPressed: () {},
                    child: Container(
                      alignment: Alignment.center,
                      width: 245,
                      child: Text(
                        'Pilih Alergi',
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: Colors.green,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                  padding: EdgeInsets.only(left: 12),
                  child: Text(
                    'Riwayat Penyakit yang Sedang dialami',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(fontSize: 20),
                  )),
              Container(
                padding: EdgeInsets.only(left: 12),
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    onPressed: () {},
                    child: Container(
                      alignment: Alignment.center,
                      width: 245,
                      child: Text(
                        'Pilih Riwayat Penyakit',
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: Colors.green,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                  padding: EdgeInsets.only(left: 12),
                  child: Text(
                    'Ketergantungan yang sedang dialami',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(fontSize: 20),
                  )),
              Container(
                padding: EdgeInsets.only(left: 12),
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    onPressed: () {},
                    child: Container(
                      alignment: Alignment.center,
                      width: 245,
                      child: Text(
                        'Pilih Adiksi',
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: Colors.green,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            'Swipe ->',
            style: Theme.of(context)
                .textTheme
                .headline1
                .copyWith(fontSize: 30, fontWeight: FontWeight.w700),
          ),
        ),
      ],
    ),
  );
}
