# Monte Carlo Example

A Lingua Franca and Python application that approximates the value of π. The user interface is implemented as a webserver and data is visualized in a web interface or optionally Grafana. Monte Carlo approximations are independent calculations that accumulate towards a converging value, which allows distribution of calculations across threads and federates.

## Theory of Operation

The Monte Carlo technique for estimating the value of π (pi) is a probabilistic method that leverages randomness to solve problems that might be deterministic in principle but are nondeterministic in how they converge.

Imagine a square with a side length of 2, within which a circle with a radius of 1 is inscribed. The area of the square is 4 (since area = side²), and the area of the circle is π (since area = πr², and r = 1). By randomly generating points within the square, the ratio of points that fall inside the circle to the total number of points approximates the ratio of the circle's area to the square's area. Since the area of the square is 4 and the area of the circle is π, this ratio can be used to approximate π.

![animation of monte carlo approximatin of π](docs/monte-carlo-pi.gif)

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

To leverage the `Lingua Franca: Build and Run` command from within Visual Studio:

1. Use the `Python: Create environment...` command in Visual Studio to configure a Python virutal environment.
1. When given the option to select a dependencies file, select `requirements.txt`.

Subsequent runs will execute from within the virtual environment.

### Manually build and run (advanced)

The run script `run.sh` will configure a Python virtual environment `.venv`, install dependencies, compile the application with the Lingua Franca compiler and run application.

Review the script to see the steps to configure your own environment and correctly link in dependencies.

## Method

Initialization: Define a square with sides of length 2 and an inscribed circle of radius 1 centered at the origin (0,0).

Point Generation: Uniformly generate random points within the square. This means every point has an equal chance of being chosen anywhere in the square.

Counting: For each point, determine if it lies inside the circle. A point (x, y) is inside the circle if x²+y²≤1.

Calculating Pi: Calculate the ratio of points inside the circle to the total number of points and multiply by 4. This gives an approximation of π.

The effectiveness of the Monte Carlo method in approximating π relies on the law of large numbers, which states that as more trials are performed, the experimental probability (in this case, the ratio of points inside the circle to the total points) will converge to the theoretical probability. Thus, by increasing the number of random points, the approximation of π becomes more accurate.
