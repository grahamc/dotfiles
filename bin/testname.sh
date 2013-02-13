#!/bin/bash

mypath="$1"

if [[ `echo $mypath | grep -c "test\/unit\/"` == 1 ]]; then
   filename=`echo $mypath |sed -e 's/test\/unit\///' | sed -e 's/Test.php/.php/'`
   echo $filename
else
    filename=`echo $mypath | sed -e 's/\(.*\/\)\(lib\/.*\)/\1test\/unit\/\2/' | sed -e 's/.php/Test.php/'`
   echo $filename
fi

