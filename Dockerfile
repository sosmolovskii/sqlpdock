FROM oraclelinux:7-slim

ARG RELEASE=19
ARG UPDATE=18
ARG TNS_ADMIN="/etc/oracle/instantclient/network/admin"
ARG WORK_DIR="/work"

ARG USER_NAME=node
ARG UID=501
ARG NLS_LANG_ARG="AMERICAN_CIS.UTF8"

RUN  yum -y install oracle-release-el7-1.0
RUN  yum -y install oracle-instantclient${RELEASE}.${UPDATE}-basic \
                    oracle-instantclient${RELEASE}.${UPDATE}-devel \
                    oracle-instantclient${RELEASE}.${UPDATE}-sqlplus
RUN  yum -y install oraclelinux-developer-release-el7-1.0

ENV NLS_LANG=${NLS_LANG_ARG}

RUN  rm -rf /var/cache/yum/*

# add user with $HOST_USER_NAME and root group - for correct patchset history
RUN useradd --uid ${UID} --gid 0 --shell /bin/bash ${USER_NAME}

RUN mkdir -p $TNS_ADMIN
ENV TNS_ADMIN=$TNS_ADMIN

RUN mkdir -p $WORK_DIR
WORKDIR $WORK_DIR

USER ${USER_NAME}

CMD ["/bin/bash"]