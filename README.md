# Monte Carlo Example

A Lingua Franca and Python application that approximates the value of π.
The user interface is implemented as a webserver and data is visualized
in Grafana.

## Prerequisites

- Bash (or you may review the run script to replicate steps otherwise)
- Python 3.10 or later
- Python virtual environment packages
- Lingua Franca compiler

## Run the Application

Install Python requriements

```shell
pip install -r requirements.txt
```

Then use `Lingua Franca: Build and Run` from within Visual Studio. You'll be prompted to open a web browser.

Launch the web app in your browser by navigating to the IP address printed when the application starts. Note the default port of 8080.

## Alternate methods to build and run

### Run the application in a Python virtual environment

To levererate the `Lingua Franca: Build and Run` command from within Visual Studio:

1. Use the `Python: Create environment...` command in Visual Studio to configure a Python virutal environment.
1. When given the option to select a dependencies file, select `requirements.txt`.

Subsequent runs will execute from within the virtual environment.

### Manually build and run (advanced)

The run script `run.sh` will configure a Python virtual environment `.venv`, install dependencies, compile the application with the Lingua Franca compiler and run application.

Review the script to see the steps to configure your own environment and correctly link in dependencies.
