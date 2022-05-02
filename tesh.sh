#!/bin/bash

# run all unit tests (writes nothing if passed)
for test in $(ls *_test.praat); do
    echo $test
    praat $test
done
