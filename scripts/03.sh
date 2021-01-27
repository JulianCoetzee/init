#!/bin/sh

greetings ()
{
    greetings="Hail, $input"
    echo $greetings
}

echo "Input name"
read input
echo $(greetings)