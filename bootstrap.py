import os

if not os.path.exists("swp"):
    print "creating swp directory ... "
    os.mkdir("swp")

if not os.path.exists("backup"):
    print "creating backup directory ... "
    os.mkdir("backup")


os.chdir("..")

if not os.path.exists(".vim"):
    print "renaming 'vim-config' to '.vim' ... "
    os.rename("vim-config", ".vim")

if not os.path.islink(".vimrc"):
    print "creating symlink to .vimrc ... "
    os.symlink(".vim/vimrc",".vimrc")

print "opening vim with BundleInstall"
os.system("vim +BundleInstall +qall")

print "all done!"
