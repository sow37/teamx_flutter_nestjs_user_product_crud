import 'package:flutter/material.dart';
import 'package:teamx_client/pages/users.dart';
import 'package:teamx_client/service/userService.dart';

class UserDetails extends StatefulWidget {
  final userId;
  final firstname;
  final lastname;
  final address;
  final iscreate;

  const UserDetails(
      {Key? key, this.userId, this.firstname, this.lastname, this.address, required this.iscreate})
      : super(key: key);
  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  bool loginFail = false;
  var fnameCont = TextEditingController();
  var lnameCont = TextEditingController();
  var addressCont = TextEditingController();
  var  label;

  @override
  Widget build(BuildContext context) {
    if(!widget.iscreate){
      fnameCont.text = widget.firstname;
      lnameCont.text = widget.lastname;
      addressCont.text = widget.address;
      label = "UPDATE";
    }else{
      label = "ADD";
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Center(
                child: Icon(Icons.person, color: Colors.grey, size: 200,),
              ),
              Divider(
                color: Colors.grey[800],
                height: 60.0,
              ),
              const SizedBox(height: 10.0),
              TextField(
                controller: fnameCont,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Entrer your firstname',
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(8)),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(8)),
                  labelText: 'Firstname',
                  labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                  errorText: loginFail ? 'please enter your firstname' : null,
                ),
              ),
              const SizedBox(height: 30.0),
              TextField(
                controller: lnameCont,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Entrer your Lastname',
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(8)),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(8)),
                  labelText: 'Lastname',
                  labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                  errorText: loginFail ? 'please enter your Lastname' : null,
                ),
              ),
              const SizedBox(height: 30.0),
              TextField(
                controller: addressCont,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Entrer your Address',
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(8)),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(8)),
                  labelText: 'Address',
                  labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                  errorText: loginFail ? 'please enter your Address' : null,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green)),
        onPressed: () {
          if(widget.iscreate){
            final body = {
              "firstname": fnameCont.text,
              "lastname": lnameCont.text,
              "address": addressCont.text,
            };
            UserService.addUser(body).then((success) {
              if (success) {
                print("################# success ################");
                showDialog<String>(
                  builder: (context) => AlertDialog(
                    title: const Text('Success'),
                    content: const Text('User has been added!!!'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('OK'),
                      )
                    ],
                  ),
                  context: context,
                );
                return;
              } else {
                print("################# Failled ################");
                showDialog<String>(
                  builder: (context) => AlertDialog(
                    title: const Text('Failled!!!'),
                    content: const Text('Error adding User!!!'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('OK'),
                      )
                    ],
                  ),
                  context: context,
                );
                return;
              }
            });
          }else{
            final body = {
              "_id": widget.userId,
              "firstname": fnameCont.text,
              "lastname": lnameCont.text,
              "address": addressCont.text,
            };
            UserService.update(body,widget.userId).then((success) {
              if (success) {
                print("################# success ################");
                showDialog<String>(
                  builder: (context) => AlertDialog(
                    title: const Text('Status'),
                    content: const Text('User has been updated!!!'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('OK'),
                      )
                    ],
                  ),
                  context: context);
              } else {
                print("################# Failled ################");
                showDialog<String>(
                  builder: (context) => AlertDialog(
                    title: const Text('Status!!!'),
                    content: const Text('Error updating User!!!'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('OK'),
                      )
                    ],
                  ),
                  context: context,
                );
                return;
              }
            });
          }

        },
        child: SizedBox(
          height: 60,
          child:  Center(
              child: Text(
            '$label',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
          )),
        ),
      ),
    );
  }
}
