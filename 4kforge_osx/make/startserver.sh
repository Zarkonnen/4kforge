#! /bin/sh

# Go into our own dir.
cd "`dirname "$0"`"

echo "Hosting applet at http://localhost:8087/applet.html"
echo "Press ctrl-c to stop server."

java -cp ../bin/pjt33/ HTTPD . 8087