## MFC node Docker

MFC node docker image

### Building

docker build -t mfc_node .

### Running

docker run -d --name node -p 22825:22825 mfc_node

### Checking MFCoind logs

docker exec node tail -f /root/.MFC/debug.log`

### Interactive troubleshooting

If you want to check how things are inside the container, get in

docker exec -ti node /bin/bash`

Then check the MFCoind in /root/.MFC 
