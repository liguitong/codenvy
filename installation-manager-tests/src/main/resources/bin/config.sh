#!/bin/bash
#
# CODENVY CONFIDENTIAL
# ________________
#
# [2012] - [2015] Codenvy, S.A.
# All Rights Reserved.
# NOTICE: All information contained herein is, and remains
# the property of Codenvy S.A. and its suppliers,
# if any. The intellectual and technical concepts contained
# herein are proprietary to Codenvy S.A.
# and its suppliers and may be covered by U.S. and Foreign Patents,
# patents in process, and are protected by trade secret or copyright law.
# Dissemination of this information or reproduction of this material
# is strictly forbidden unless prior written permission is obtained
# from Codenvy S.A..
#

UPDATE_SERVER="http://updater-nightly.codenvy-dev.com:8080/update"
TEST_LOG="installation-manager-test.log"
SINGLE_NODE_VAGRANT_FILE="../vagrant/single/CentOS70/Vagrantfile"

AVAILABLE_CODENVY_VERSIONS=$(curl -s -X GET ${UPDATE_SERVER}/repository/updates/codenvy)
PREV_CODENVY_VERSION=`echo ${AVAILABLE_CODENVY_VERSIONS} | sed 's/.*"\([^"]*\)","[^"]*"\]/\1/'`
LATEST_CODENVY_VERSION=`echo ${AVAILABLE_CODENVY_VERSIONS} | sed 's/.*"\([^"]*\)".*/\1/'`

AVAILABLE_IM_CLI_CLIENT_VERSIONS=$(curl -s -X GET ${UPDATE_SERVER}/repository/updates/installation-manager-cli)
PREV_IM_CLI_CLIENT_VERSION=`echo ${AVAILABLE_IM_CLI_CLIENT_VERSIONS} | sed 's/.*"\([^"]*\)","[^"]*"\]/\1/'`
LATEST_IM_CLI_CLIENT_VERSION=`echo ${AVAILABLE_IM_CLI_CLIENT_VERSIONS} | sed 's/.*"\([^"]*\)".*/\1/'`
