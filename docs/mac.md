2025-07-09 09:46:20 Wednesday

- bash builds on macos 
- source from: https://ftp.gnu.org/gnu/bash/

```bash
./configure --prefix=/opt/bash-5.3
make
sudo make install
sudo ln -s /opt/bash-5.3 /opt/bash
```

- git clone bash completion repo
  - copy https://raw.githubusercontent.com/scop/bash-completion/refs/heads/main/bash_completion
  - to ../bash/bash_completion
  - copy https://raw.githubusercontent.com/scop/bash-completion/refs/heads/main/bash_completion.d/000_bash_completion_compat.bash
  - to ../bash/000_bash_completion_compat.bash


