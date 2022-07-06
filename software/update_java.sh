#!/usr/bin/env bash
# -*- coding: utf-8 -*-

# 2022-07-01 10:56:29
JDK=jdk-17

sudo update-alternatives --install /usr/bin/java java "/usr/lib/jvm/${JDK}/bin/java" 3
sudo update-alternatives --install /usr/bin/javap javap /usr/lib/jvm/${JDK}/bin/javap 3
sudo update-alternatives --install /usr/bin/javadoc javadoc /usr/lib/jvm/${JDK}/bin/javadoc 3
sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/${JDK}/bin/javac 3
sudo update-alternatives --install /usr/bin/jar jar /usr/lib/jvm/${JDK}/bin/jar 3
sudo update-alternatives --install /usr/bin/jarsigner jarsigner /usr/lib/jvm/${JDK}/bin/jarsigner 3
