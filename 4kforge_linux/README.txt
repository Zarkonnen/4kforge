4kForge by David Stark, 2011

This is an assembly of scripts intended to help you develop, compile, compress
and test a Java game that weighs in at under 4 kB. The game is assumed to be
comprised entirely of the class "a" found in the src folder.

To begin using 4kForge, run install.sh. This will prompt you to install
Proguard and kzip, two external tools needed by 4kForge.

Proguard's website: http://proguard.sourceforge.net/
kzip is by Ken Silverman: http://advsys.net/ken/utils.htm

4kForge also includes Zip2Gzip and HTTPD, two Java programs written by pjt33.
The former converts between two compression formats, and the latter is a tiny
webserver that is able to correctly host pack200'ed applets.

Once install.sh has run successfully, you can run make.sh in the make folder to
compile and shrink your program, and startserver.sh to host the resulting
pack200'ed and gzipped applet.

THESE TOOLS ARE PROVIDED AS-IS WITH NO WARRANTY/GUARANTEE OF CORRECT OPERATION.