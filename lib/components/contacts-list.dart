import 'package:flutter/material.dart';
import 'package:fonebook/pages/contact-details.dart';
import '../app-contact.class.dart';
import 'contact-avatar.dart';

class ContactsList extends StatelessWidget {
  final List<AppContact> contacts;
  Function() reloadContact;

  ContactsList({Key key, this.contacts, this.reloadContact}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          AppContact contact = contacts[index];

          return ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => ContactDetails(
                    contact,
                    onContactDelete: (AppContact _contact) {
                      reloadContact();
                      Navigator.of(context).pop();

                    },
                    onContactUpdate: (AppContact _contact) {
                      reloadContact();

                    },
                  )
              ));
            },
              title: Text(contact.info.displayName),
              subtitle: Text(
                  contact.info.phones.length > 0 ? contact.info.phones.elementAt(0).value : ''
              ),
              leading: ContactAvatar(contact, 36)
          );
        },
      ),
    );
  }
}