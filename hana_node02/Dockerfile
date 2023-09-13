FROM golang as agent-builder

RUN git clone https://github.com/trento-project/agent.git
RUN cd agent && make build

FROM registry.suse.com/bci/bci-base
COPY --from=agent-builder /go/agent/trento-agent /usr/bin/trento-agent
COPY --from=ghcr.io/trento-project/fakemall:latest /bin/fakemall /usr/bin/fakemall
COPY . /

ENTRYPOINT ["/usr/bin/trento-agent", "start"]
