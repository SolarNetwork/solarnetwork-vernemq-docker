FROM vernemq/vernemq:2.0.1

COPY --chown=vernemq:vernemq vmq.acl /etc/vernemq/vmq.acl

COPY --chown=vernemq:vernemq vmq.passwd /etc/vernemq/vmq.passwd

RUN vmq-passwd -U /etc/vernemq/vmq.passwd

RUN <<EOF bash
sed -i 's/accept_eula = no/accept_eula = yes/' /etc/vernemq/vernemq.conf
sed -i 's/^allow_anonymous = off/allow_anonymous = on/' /etc/vernemq/vernemq.conf
sed -i 's/^listener.tcp.name/#listener.tcp.name/' /etc/vernemq/vernemq.conf
sed -i 's/^listener.ssl.name/#listener.ssl.name/' /etc/vernemq/vernemq.conf
mkdir -p /etc/vernemq/conf.d
EOF

COPY --chown=vernemq:vernemq solarnet.conf /etc/vernemq/conf.d/
