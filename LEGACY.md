```bash
# function gtpg() { git checkout -b tmp; git branch -D gh-pages; git checkout --orphan gh-pages; git add --all .; git ci -am "docs(release): build `cat ./../package.json | jq -r .version` docs pages"; git push github gh-pages:gh-pages --force; git branch -D tmp; }
# function gtpm() { git checkout -b tmp; git branch -D master; git checkout --orphan master; git add --all .; git ci -am "chore(release): build `cat ./../package.json | jq -r .version`"; git push github master:master --force; git branch -D tmp; }

# alias npm-proxy-cache="npm-proxy-cache -p 4873"
# alias npmc="npm --proxy http://localhost:4873 --https-proxy http://localhost:4873 --strict-ssl false"
# alias npmzh="npm --registry=https://registry.npm.taobao.org"
# alias cnpm="npm --registry=https://registry.npm.taobao.org --cache=$HOME/.npm/.cache/cnpm --disturl=https://npm.taobao.org/dist --userconfig=$HOME/.cnpmrc"

# alias npm-list="cat package.json | jq .dependencies | jq 'keys[]' -r | xargs"
# alias npm-list-dev="cat package.json | jq .devDependencies | jq 'keys[]' -r | xargs"
# function npm-link-dev() { npm link `cat package.json | jq .devDependencies | jq 'keys[]' -r | xargs`; }
```
