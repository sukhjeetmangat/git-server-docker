docker stop git-server
docker rmi git-server

docker build -t git-server .

docker run -d --rm -p 2222:22 \
	-v ~/git-server/keys:/git-server/keys \
	-v ~/git-server/repos:/git-server/repos \
	--name git-server  \
	git-server


# git clone ssh://git@0.0.0.0:2222/git-server/repos/myrepo.git
# git clone ssh://git@192.168.99.100:32222/git-server/repos/kube-test-repo.git
