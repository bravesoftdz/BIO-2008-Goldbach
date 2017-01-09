program project1;
{goldbach conjecture 2008 Q1} {self-marked: 25/25} {completed 38 mins}
{$mode objfpc}{$H+}

uses sysUtils,strUtils;
var userNum,numOfSums,numA,numB,i,n,place:integer;
    primes:array[1..1230] of integer;
    isNotPrime:boolean;
    sums:array[1..50] of string;
begin
  {initialising variables}
  numOfSums:=0;
  place:=1;
  {user input}
  readln(userNum);
  {make list of primes}
  for n:=2 to 10000 do
    begin
      isNotPrime:=false;
      for i:=2 to n-1 do
          if n MOD i = 0 then
            isNotPrime:=true;
      if not isNotPrime then
        begin
          primes[place]:=n;
          inc(place);
        end;
    end;
  {check input}
  if (userNum MOD 2 = 0) AND ((userNum >= 4) AND (userNum <= 10000)) then
    begin
      for numA := 1 to 1230 do
        for numB := 1 to 1230 do
          if primes[numA]+primes[numB]=userNum then
            inc(numOfSums);
      {output}
      {removing sums of same numbers but different order ie 3+7 = 7+3}
      numOfSums:=trunc((numOfSums+1)/2);
      writeln(numOfSums);
      readln;
    end;
end.

