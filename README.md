Package dependency

# Ubuntu #
  * silversearcher-ag ripgrep libpq-dev python-dev libxml2-dev libxslt1-dev libldap2-dev libsasl2-dev libffi-dev python3-dev python3-venv texlive-latex-extra pandoc auctex libtool-bin graphviz

# Telga #
```bash
git clone https://github.com/tdlib/td.git ~/td
cd td
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
cmake --build .
sudo make install
```

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

Nodejs >= 12 need to be install to make lsp-pyright work correctly
```bash
curl -fsSL https://deb.nodesource.com/setup_15.x | sudo -E bash -
```

# Scala #
Sbt is a requirement to work with scala and for some sbt-mode
```bash
curl -s "https://get.sdkman.io" | bash
```
