-module(testRecord).
-export([printRecord/0]).

%-record(Person,{Name, Age, Sex, Department}).
-record(department,{dName, dNum, dPosition}).
-record(person,{name, age, sex, department = #department{}}).

printRecord() ->
    Department = #department{dName ="R&D", dNum = 001, dPosition = "HHD"},
    Person = #person{name = "Wang", age = 20, sex = "Male", department= Department#department{}},
    io:format("~p ~n",[Person]),
    io:format("Person's name: ~p~n",[Person#person.name]),
    io:format("Person's age: ~p~n",[Person#person.age]),
    io:format("Person's sex: ~p~n",[Person#person.sex]),
    io:format("Person's department Name:~p~n",[(Person#person.department)#department.dName]).

