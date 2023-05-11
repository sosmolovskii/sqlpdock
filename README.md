# sqlpdock
First, execute `./build.sh` (or `make build`). You will need `dockerx` installed (included in Docker Desktop).
The Docker image should be built once. You also may change `NLS_LANG` property in `common.sh`.

After the Docker image has been built, edit newly created file `sqlplus.config` and set parameter `LOCAL_TNS_ADMIN`.
Value of this parameter should point to directory containing configuration files of Oracle InstantClient.
Example:
`LOCAL_TNS_ADMIN=/Users/me/apps/oracle/instantclient/network/admin`.

# Use dockerized sqlplus
Switch to your patch's directory and execute `<sqlpdock_path>/run.sh <user@schema>`.
Then you need to enter a password and may start to execute your SQL scripts.
To exit the program use `exit` command.

For your convenience, you may register alias: `alias sqlpdock='<sqlpdock_path>/run.sh'`.
In that case, the execution command becomes more compact: `sqlpdock <user@schema>`.