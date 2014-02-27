import os

if not os.path.exists("swp"):
    print "creating swp directory ... "
    os.mkdir("swp")

if not os.path.exists("backup"):
    print "creating backup directory ... "
    os.mkdir("backup")

if not os.path.exists("bundle"):
    print "creating bundle directory ... "
    os.mkdir("bundle")

os.chdir("bundle")


if not os.path.exists("vundle"):
    os.system("git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle")

os.chdir("../..")

if not os.path.exists(".vim"):
    print "renaming 'vim-config' to '.vim' ... "
    os.rename("vim-config", ".vim")

if not os.path.islink(".vimrc"):
    print "creating symlink to .vimrc ... "
    os.symlink(".vim/vimrc",".vimrc")

print "opening vim with BundleInstall"
os.system("vim +BundleInstall +qall")

os.chdir(".vim/bundle/Command-T")
os.system("rake make")

print "all done!"
