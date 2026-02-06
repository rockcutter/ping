# builder image
FROM gcc:15.2 as builder

# install vcpkg
RUN apt-get update 
RUN apt-get -y install curl zip unzip tar cmake make 

WORKDIR /opt
RUN git clone https://github.com/microsoft/vcpkg.git
RUN /opt/vcpkg/bootstrap-vcpkg.sh
ENV VCPKG_ROOT=/opt/vcpkg
ENV PATH="${VCPKG_ROOT}:${PATH}"

# install dependencies
WORKDIR /app
COPY Makefile ./
COPY vcpkg.json vcpkg-configuration.json ./
RUN make deps

# build
COPY . . 
RUN make local/build

# final image
FROM debian:stable-slim
WORKDIR /app
COPY --from=builder /app/build/debug/bin/cppplayground .
CMD ["./cppplayground"]

