#!/bin/bash

psql -U postgres -c 'CREATE DATABASE nycflights13;'

psql -U postgres -d nycflights13 -f /raw-data/nycflights13/import.sql

