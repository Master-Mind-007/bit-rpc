# Use a Node.js builder stage
FROM node:16 as builder
WORKDIR /workspace
COPY . .
RUN npm install

# Use an Alpine Linux stage
FROM node:16-alpine as alpine
WORKDIR /workspace
COPY --from=builder /workspace .
RUN apk --update add git

COPY run.sh .
RUN chmod +x run.sh
EXPOSE 3002

CMD ["bash", "run.sh"]
