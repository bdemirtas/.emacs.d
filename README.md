Package dependency

# Ubuntu #
  * silversearcher-ag
  * sbt
  * ripgrep
  * libpq-dev
  * python-dev
  * libxml2-dev
  * libxslt1-dev
  * libldap2-dev
  * libsasl2-dev
  * libffi-dev
  * python3-dev
  * python3-venv
  * texlive-latex-extra
  * pandoc
  * auctex

# lsp #
```bash
# Make sure to use coursier v1.1.0-M9 or newer.
curl -L -o coursier https://git.io/coursier-cli
chmod +x coursier
./coursier bootstrap \
  --java-opt -Xss4m \
  --java-opt -Xms100m \
  --java-opt -Dmetals.client=emacs \
  org.scalameta:metals_2.12:0.10.0 \
  -r bintray:scalacenter/releases \
  -r sonatype:snapshots \
  -o /usr/local/bin/metals-emacs -f
```
