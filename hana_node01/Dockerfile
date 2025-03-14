# Fetch and build the agent
# The agent is built in a separate stage to avoid copying the whole repository into the final image
FROM golang as agent-builder

ADD https://github.com/trento-project/agent.git agent
RUN cd agent && make build
RUN cp "agent/build/$(go env GOARCH)/trento-agent" agent/trento-agent


# Build the final image
FROM registry.suse.com/bci/bci-base
RUN zypper -n in catatonit
COPY --from=agent-builder /go/agent/trento-agent /usr/bin/trento-agent
COPY --from=ghcr.io/dottorblaster/soappatrol:latest /bin/soappatrol /usr/bin/soappatrol
COPY --from=ghcr.io/trento-project/fakemall:latest /bin/fakemall /usr/bin/fakemall
COPY . /

RUN useradd -ms /bin/bash mckadm

ENTRYPOINT ["catatonit", "--", "/init.sh"]
