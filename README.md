
# Table of Contents

1.  [Ana](#org785a962)
2.  [Evaluate](#org9bbe7b1)
3.  [Flowers](#orgb965be7)
4.  [Trajectory-Recognition](#org700b708)

This repository contains all my public Dockerfiles.
Each folder represents a different project.


<a id="org785a962"></a>

# Ana

This image contains Ana (Python Data Analysis Framework) and other software and data necessary to reproduce the results of my master thesis.

-   Alpine Linux
    This [Dockerfile](ana/alpine/Dockerfile) is based on the latest Linux Alpine (`alpine:latest`) image. It is smaller and contains only the newest and barely necessary packages. This is the preferred image to analyze data.

-   Python 3.9 / Debian Bullseye (11.0)
    This [Dockerfile](ana/bullseye/Dockerfile) is based on the latest Debian Linux (`python:3.9-bullseye`) image. Debian provides older, but more stable packages.


<a id="org9bbe7b1"></a>

# Evaluate

This [Dockerfile](evaluate/Dockerfile) installs Python and Anaconda on a plain Debian Linux image.


<a id="orgb965be7"></a>

# Flowers

This [Dockerfile](flowers/Dockerfile) installs all software and images necessary to classify flowers. It contains images from two different Kaggle challenges designed to learn the features of flowers. It provides the base image for the flowers project.


<a id="org700b708"></a>

# Trajectory-Recognition

This [Dockerfile](trajectory-recognition/Dockerfile) installs Python and OpenCV together with pybgs to detect a background in a video. It provides the base image for the trajectory-recognition project published on GitLab.

