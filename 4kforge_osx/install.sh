#! /bin/sh

# Go into our own dir.
cd "`dirname "$0"`"

echo "This script will download & configure kzip and ProGuard, two programs needed"
echo "for 4kForge. First, you must accept their licensing terms."
echo "Press enter to continue."
read IN

echo "ProGuard Licence:"
cat licences/gplv2.txt
echo
echo
echo "Enter 'y' to accept the licence and proceed to download."
read IN
if [ $IN != "y" ]; then
  echo "You chose no. Aborting install."
  exit
fi
echo "Licence accepted. Downloading."
cd bin/proguard/
curl -L -o pg.tar.gz http://sourceforge.net/projects/proguard/files/latest/download?source=files
gunzip pg.tar.gz
tar xvf pg.tar
cd ../..

echo
echo
echo
echo "kzip Licence:"
cat licences/kzip.txt
echo
echo
echo "Enter 'y' to accept the licence and proceed to download."
read IN
if [ $IN != "y" ]; then
  echo "You chose no. Aborting install."
  exit
  return
fi
echo "Licence accepted. Downloading."
cd bin/kzipmix
curl -o kzip.tar.gz http://static.jonof.id.au/dl/kenutils/kzipmix-20091108-darwin.tar.gz
echo "Installing."
gunzip kzip.tar.gz
tar xvf kzip.tar
cd ../..

echo
echo
echo
echo "Finishing install."
chmod +x make/make.sh
chmod +x make/startserver.sh