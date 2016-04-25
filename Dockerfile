FROM centos:7

MAINTAINER Brian Hicks <brian@aster.is>

# add development tools
RUN yum groupinstall -y "Development Tools"

# add FPM
RUN yum install -y ruby ruby-devel
RUN gem install fpm --no-rdoc --no-ri

# TODO: add scripts
