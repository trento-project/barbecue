# Fetch and build the agent
# The agent is built in a separate stage to avoid copying the whole repository into the final image
FROM golang as agent-builder

ADD https://github.com/trento-project/agent.git agent
RUN cd agent && make build
RUN cp "agent/build/$(go env GOARCH)/trento-agent" agent/trento-agent


# Build the final image
FROM registry.suse.com/bci/bci-base
COPY --from=agent-builder /go/agent/trento-agent /usr/bin/trento-agent
COPY --from=ghcr.io/trento-project/fakemall:latest /bin/fakemall /usr/bin/fakemall
COPY . /

ENTRYPOINT ["/usr/bin/trento-agent", "start"]
