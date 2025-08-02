#!/bin/sh

echo $(gsettings get org.gnome.desktop.interface color-scheme | grep 'dark')
