# Deploy the tool into a scratch container with certificate bundle from Alpine
FROM alpine:3.13.5 as ca
RUN apk --no-cache add ca-certificates-bundle=20191127-r5

FROM scratch
COPY --from=ca /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY google-f5-preflight-checklist /google-f5-preflight-checklist
ENTRYPOINT ["/google-f5-preflight-checklist"]
