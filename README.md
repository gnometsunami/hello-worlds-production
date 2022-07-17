## Intro

This is a collection of `Hello World` programs written in various programming languages.

Each language and framework is organized into it's own folder which contains everything needed to build and run the example.

### Dockerfile
All code is built and containerized using docker. The resulting image is intended to be production-worthy. Where possible, the Google distroless base images are used as the final published image. All containers should run as the non-privileged 'nonroot' user. And should be function with a read-only root filesystem.

## C

Written in C, using the gcc compiler and a makefile. Containerized using the Google distroless cc image.

## Cpp

Written in C++, using the gcc compiler and a makefile. Containerized using the Google distroless cc image.

## Clojure

Written in Clojure, built using lein uberjar. Containerized using the Google distroless java image.

## Cs

Written in C#, built using dotnet 6.0 and the 'self-contained' flag. Containerized using the Google distroless cc image.

The reasoning behind choosing to build a self-contained dotnet application is because container images are stateless. If you need to rebuild an image to install dotnet patches, or os patches, you might as well rebuild your application too.

## Fs

Written in F#, built using dotnet 6.0 and the 'stand-alone' flag. Containerized using the Google distroless cc image.

The reasoning behind choosing to build a self-contained dotnet application is due to the immutability of containers. If you need to rebuild an image to install dotnet patches or os patches, you might as well build your application too.

## Go

Written in Go. Containerized using the Google distroless go image.

## JavaScript-Nodejs

Written in JavaScript, built using Nodejs. Containerized using the Google distroless nodejs image.

## Python

Written in Python 3. A requirements.txt file is provided to demonstrate dependancy management. Containerized using the Google distroless python image.

## Powershell

Written in Powershell. The dockerfile has a commented line which provides an example for importing powershell modules. Containerized using the Microsoft Powershell image.

## Rust

Written in Rust. Containerized using the Google distroless cc image.

## TypeScript-Nodejs

Written in TypeScript, built using Nodejs. Containerized using the Google distroless nodejs image.
