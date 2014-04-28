#! /bin/sh

#    4kForge make script: Compiles and shrinks a single Java class.
#    Copyright (C) 2014  David Stark

# Go into our own dir.
cd "`dirname "$0"`"

# Go into temp dir.
mkdir tmp
cd tmp

# Copy over the current source.
cp ../../src/a.java .

# Compile source.
javac -source 1.5 -target 1.5 a.java

# Put source into a jar file.
jar cvfM a.normal.jar a.class

# Run proguard.
java -jar ../../bin/proguard/proguard4.11/lib/proguard.jar -injars a.normal.jar -outjars a.proguard.jar -libraryjars /System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Classes/classes.jar -keep public class a -optimizationpasses 9 -overloadaggressively

# Run pack200.
pack200 --effort=9 --strip-debug --no-keep-file-order -O --no-gzip a.pack a.proguard.jar

# Run kzip.
../../bin/kzipmix/kzipmix-20091108-darwin/kzip -b96 -y a.kz.pack a.pack

# Run Zip2Gzip.
java -cp ../../bin/pjt33/ Zip2Gzip a.kz.pack a.pack.gz

# Copy result into main make folder.
cp a.pack.gz ../a.pack.gz

# Go back into make folder.
cd ..

# List memory used.
echo "Output file:"
ls -la a.pack.gz