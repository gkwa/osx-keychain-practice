#!/bin/sh

set -e

security delete-keychain trash1.keychain||:
ls ~/Library/Keychains/trash1.keychain||:

# allow new chain to appear in search list and in KeyChain Access GUI
security list-keychains -s trash1.keychain
security create-keychain -p mypassword trash1.keychain
# security create-keypair -k trash1.keychain mydescription
security list-keychains

ls ~/Library/Keychains/trash1.keychain
security list-keychains -s trash1.keychain
security add-internet-password -a john.doe@gmail.com \
	 -w mygmailpassword -s pop3://pop.gmail.com trash1.keychain

security add-generic-password -a john.doe@gmail.com \
	 -w mygmailpassword -s pop3://pop.gmail.com trash1.keychain

security list-keychains -s trash1.keychain
