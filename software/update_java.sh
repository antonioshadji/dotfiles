#!/usr/bin/env bash
# -*- coding: utf-8 -*-

# 2022-07-01 10:56:29
# JDK=jdk-17
# 2022-10-06 10:11:53
JDK=jdk-19
# highest priority chosen when running in automode
PRIORITY=3000

sudo update-alternatives --install /usr/bin/jar         jar             "/usr/lib/jvm/${JDK}/bin/jar" "${PRIORITY}"
sudo update-alternatives --install /usr/bin/jarsigner   jarsigner       "/usr/lib/jvm/${JDK}/bin/jarsigner" "${PRIORITY}"
sudo update-alternatives --install /usr/bin/java        java            "/usr/lib/jvm/${JDK}/bin/java" "${PRIORITY}"
sudo update-alternatives --install /usr/bin/javac       javac           "/usr/lib/jvm/${JDK}/bin/javac" "${PRIORITY}"
sudo update-alternatives --install /usr/bin/javadoc     javadoc         "/usr/lib/jvm/${JDK}/bin/javadoc" "${PRIORITY}"
sudo update-alternatives --install /usr/bin/javap       javap           "/usr/lib/jvm/${JDK}/bin/javap" "${PRIORITY}"
sudo update-alternatives --install /usr/bin/jcmd        jcmd            "/usr/lib/jvm/${JDK}/bin/jcmd" "${PRIORITY}"
sudo update-alternatives --install /usr/bin/jconsole    jconsole        "/usr/lib/jvm/${JDK}/bin/jconsole" "${PRIORITY}"
sudo update-alternatives --install /usr/bin/jdb         jdb             "/usr/lib/jvm/${JDK}/bin/jdb" "${PRIORITY}"
sudo update-alternatives --install /usr/bin/jdeprscan   jdeprscan       "/usr/lib/jvm/${JDK}/bin/jdeprscan" "${PRIORITY}"
sudo update-alternatives --install /usr/bin/jdeps       jdeps           "/usr/lib/jvm/${JDK}/bin/jdeps" "${PRIORITY}"
sudo update-alternatives --install /usr/bin/jexec       jexec           "/usr/lib/jvm/${JDK}/lib/jexec" "${PRIORITY}"
sudo update-alternatives --install /usr/bin/jfr         jfr             "/usr/lib/jvm/${JDK}/bin/jfr" "${PRIORITY}"
sudo update-alternatives --install /usr/bin/jhsdb       jhsdb           "/usr/lib/jvm/${JDK}/bin/jhsdb" "${PRIORITY}"
sudo update-alternatives --install /usr/bin/jimage      jimage          "/usr/lib/jvm/${JDK}/bin/jimage" "${PRIORITY}"
sudo update-alternatives --install /usr/bin/jinfo       jinfo           "/usr/lib/jvm/${JDK}/bin/jinfo" "${PRIORITY}"
sudo update-alternatives --install /usr/bin/jlink       jlink           "/usr/lib/jvm/${JDK}/bin/jlink" "${PRIORITY}"
sudo update-alternatives --install /usr/bin/jmap        jmap            "/usr/lib/jvm/${JDK}/bin/jmap" "${PRIORITY}"
sudo update-alternatives --install /usr/bin/jmod        jmod            "/usr/lib/jvm/${JDK}/bin/jmod" "${PRIORITY}"
sudo update-alternatives --install /usr/bin/jps         jps             "/usr/lib/jvm/${JDK}/bin/jps" "${PRIORITY}"
sudo update-alternatives --install /usr/bin/jrunscript  jrunscript      "/usr/lib/jvm/${JDK}/bin/jrunscript" "${PRIORITY}"
sudo update-alternatives --install /usr/bin/jshell      jshell          "/usr/lib/jvm/${JDK}/bin/jshell" "${PRIORITY}"
sudo update-alternatives --install /usr/bin/jstack      jstack          "/usr/lib/jvm/${JDK}/bin/jstack" "${PRIORITY}"
sudo update-alternatives --install /usr/bin/jstat       jstat           "/usr/lib/jvm/${JDK}/bin/jstat" "${PRIORITY}"
sudo update-alternatives --install /usr/bin/jstatd      jstatd          "/usr/lib/jvm/${JDK}/bin/jstatd" "${PRIORITY}"
sudo update-alternatives --install /usr/bin/keytool     keytool         "/usr/lib/jvm/${JDK}/bin/keytool" "${PRIORITY}"
sudo update-alternatives --install /usr/bin/rmiregistry rmiregistry     "/usr/lib/jvm/${JDK}/bin/rmiregistry" "${PRIORITY}"
sudo update-alternatives --install /usr/bin/serialver   serialver       "/usr/lib/jvm/${JDK}/bin/serialver" "${PRIORITY}"
