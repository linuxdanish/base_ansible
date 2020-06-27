FROM centos:centos8
# Install dependencies, update and install ansible-lint
RUN dnf -y update
RUN dnf install -y epel-release
RUN dnf -y update
RUN dnf install -y ansible python36 
RUN python3 -m pip install --user --upgrade pip
RUN python3 -m pip install ansible-lint
RUN python3 -m pip install pywinrm

EXPOSE 22
# Bring in files
WORKDIR /ansible
COPY . .
RUN ansible-galaxy install -r requirements.yml

RUN ansible-lint *.yml
CMD ["/bin/bash"]

