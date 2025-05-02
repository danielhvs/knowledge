* Beginner

(close) Quit C-x C-c
(find) File C-x C-f
(eval org code) Eval C-c C-c

I think commands can start with uppercase when local

* Buffer functions:

(get-buffer-create "bla")


# Install emacs 29.4 from scractch:
# source: https://andrewmemory.wordpress.com/2024/08/24/building-emacs-29-4-on-ubuntu-22-04/

# We want to build it from scratch so we have more control
sudo apt remove emacs
sudo snap remove emacs
# Download emacs
curl https://ftp.gnu.org/gnu/gnu-keyring.gpg --output gnu-keyring.gpg
gpg --import gnu-keyring.gpg
curl https://ftp.gnu.org/gnu/emacs/emacs-29.4.tar.gz.sig --output emacs-29.4.tar.gz.sig
curl https://ftp.gnu.org/gnu/emacs/emacs-29.4.tar.gz --output emacs-29.4.tar.gz
gpg --verify emacs-29.4.tar.gz.sig emacs-29.4.tar.gz

# Install dependencies
sudo apt install libgtk-3-dev libgif-dev libgnutls28-dev texinfo libxpm-dev

# Install it
tar xzvf emacs-29.4.tar.gz
cd emacs-29.4/
./configure
make clean; make
sudo make install
# (this installs emacs in /usr/local/bin)
# $ /usr/local/bin/emacs
