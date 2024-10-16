#!/bin/bash -e
#
# Copyright (c) 2019, 2022 Oracle and/or its affiliates. All rights reserved.
#
# This program and the accompanying materials are made available under the
# terms of the Eclipse Distribution License v. 1.0, which is available at
# http://www.eclipse.org/org/documents/edl-v10.php.
#
# SPDX-License-Identifier: EPL-2.0 OR BSD-3-Clause

#
# Arguments:
#  N/A

echo '-[ EclipseLink Build ]-----------------------------------------------------------'
/opt/bin/mysql-start.sh

if [ ${CONTINUOUS_BUILD} = "true" ]; then
    ANT_TARGET=build-continuous
else
    ANT_TARGET=build-nightly
fi

export ANT_OPTS=-Xmx4G
set -o pipefail
$ANT_HOME/bin/ant -f autobuild.xml ${ANT_TARGET} -Denv.JAVA_HOME=${JAVA_HOME} -DM2_HOME=${M2_HOME} -Djdbc.driver.jar=${HOME}/extension.lib.external/mysql-connector-j-8.2.0.jar -Ddb.url=${TEST_DB_URL} -Ddb.user=${TEST_DB_USERNAME} -Ddb.pwd=${TEST_DB_PASSWORD} -Dextensions.depend.dir=${HOME}/extension.lib.external -Declipse.install.dir=${HOME}/extension.lib.external/eclipse -Djunit.lib=${HOME}/extension.lib.external/junit-4.13.2.jar:${HOME}/extension.lib.external/hamcrest-core-1.3.jar:${HOME}/extension.lib.external/jmockit-1.35.jar -Dhudson.workspace=${WORKSPACE} -Dtest.logging.level=INFO -Dfail.on.error=true

/opt/bin/mysql-stop.sh
