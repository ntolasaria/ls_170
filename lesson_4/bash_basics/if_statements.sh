string='Hello'

if [ -n $string ]
then
  echo $string
fi

int_1=10
int_2=10

if [ $int_1 -eq $int_2 ]
then
  echo $int_1 and $int_2 are equal!
fi

if [ -e ./hello_world.sh ]
then
  echo 'File exists'
fi

int=4

if [ $int -lt 10 ]
then
  echo $int is less than 10

  if [ $int -lt 5 ]
  then
    echo $int is also less than 5
  fi
fi

int=15

if [ $int -lt 10 ]
then
  echo $int is less than 10
else
  echo $int is not less than 10
fi

if [ $int -lt 10 ]
then
  echo $int is less than 10
elif [ $int -gt 20 ]
then
  echo $int is greater than 20
else
  echo $int is between 10 and 20
fi

if [ $int -gt 10 ] && [ $int -lt 20 ]
then
  echo $int is between 10 and 20 using '&&'
fi

if [ $int -lt 5 ] || [ $int -gt 10 ]
then
  echo $int is less than 5 or greater than 10 using \|\|
fi

int=8

if ! ([ $int -lt 5 ] || [ $int -gt 10 ])
then
  echo $int is between 5 and 10 using \! and \|\|
fi