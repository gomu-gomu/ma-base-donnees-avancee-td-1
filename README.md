# Memoires SGA et PGA

Exercices are inside of the [td.pdf](./assets/td.pdf) file.

Source code is under the [src](./src/) folder

# Usage

To comply with licensing requirements, it is essential to acknowledge and accept Oracle's policy before proceeding with the installation of any Oracle products. Prior to installation, ensure that the Docker environment receives Oracle's verified .zip files. You can download the Oracle Database version 19c from [this link](https://download.oracle.com/otn/linux/oracle19c/190000/LINUX.X64_193000_db_home.zip). Subsequently, place the downloaded binary file in the [./src/bin](./src/19.3.0) directory. For your convenience, the Oracle Database 19c installation file can also be obtained from the official Oracle Database software [downloads page](https://www.oracle.com/database/technologies/oracle-database-software-downloads.html).

## 1. Build

To initiate the setup and build process for the Docker file responsible for creating the Oracle Database environment, execute the script `./build.sh`.

Ensure that you have previously installed and placed the Oracle Database version 19c .zip file in its designated location, as outlined earlier. This step is crucial for the proper configuration and successful execution of the Docker file.

```sh
./build.sh
```

## 2. Run

Now that the Docker image has been successfully built, you can launch a container using the `start.sh` script. This script facilitates the execution of the container, allowing you to interact with the configured Oracle Database environment.

```sh
./start.sh
```

## 3. Start

Finally, Upon executing the `run.sh` script, the process will not only update the password but also seamlessly log you into an interactive **SQL*Plus** shell. This provides a convenient and secure means to interact with the Oracle Database environment, allowing for efficient management and exploration of the database functionalities.

```sh
./run.sh
```

> **Note**: You can also access the web ui via https://localhost:5500/em/shell.
```
Username: system
Password: password
Container Name: orclpdb1
```
