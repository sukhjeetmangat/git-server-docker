docker stop git-server
docker rmi git-server

docker build -t git-server .

docker run -d --rm -p 2222:22 \
	-v ~/git-server/keys:/git-server/keys \
	-v ~/git-server/repos:/git-server/repos \
	--name git-server  \
	git-server
