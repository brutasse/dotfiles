#! /usr/bin/env python2
import os
import requests
import sys

url = 'https://wifi.free.fr/Auth'

config_file = os.path.join(os.path.expanduser('~'), '.freewifi')


def load_config():
    with open(config_file, 'r') as config:
        login = config.readline().strip()
        password = config.readline().strip()
    return login, password


def freewifi():
    try:
        login, password = load_config()
    except IOError:
        print ("Error: add your FreeWifi credentials to '%s': username, "
               "password on two separate lines." % config_file)
        sys.exit(1)
    r = requests.post(url, {'login': login,
                            'password': password,
                            'submit': 'Valider'})
    if "CONNEXION AU SERVICE REUSSIE" in r.content:  # Hello, 1998
        print "Success"
    else:
        print r.status_code, r.content

if __name__ == '__main__':
    freewifi()
