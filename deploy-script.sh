cd /opt \
&& git clone https://github.com/yagavrin/shvirtd-example-python.git \
&& cd shvirtd-example-python \
&& docker build -t shvirtd-example-python-web:1.0.0 -f Dockerfile.python . \
&& docker compose up -d
