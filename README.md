# forensics-samples

## About

forensics-samples is a set of useful files to help to learn or test forensics
tools and techniques. These files are examples of pictures, filesystems and
other possible artifacts as memory dumps (not available yet).

forensics-samples is useful for students and CI tests. The main intent of this
work is provide a standardized set of files to avoid time waste in some tasks
when learning about forensics or testing tools.

## Content

forensics-samples has several files inside "original-files" directory. There
are some filesystem images available (currently: ext2, ext4, btrfs, NTFS,
FAT2 (vfat) and exFAT). Inside each filesystem image, all files from
"original-files" were copied and, after this, all directories ending with
"2" in their names were deleted. Is possible use tools to analyse the files
and their metadata or carvers to recover deleted files.

See below the content of "original-files":

    original-files/
    ├── audio1
    │   ├── debian.mp3
    │   ├── debian.ogg
    │   └── debian.wav
    ├── audio2
    │   ├── deleted.mp3
    │   ├── deleted.ogg
    │   └── deleted.wav
    ├── movie1
    │   └── VID_20191220_170832.mp4
    ├── movie2
    │   ├── movie-hello.avi
    │   ├── movie-hello.mp4
    │   ├── movie-hello.mpeg
    │   └── movie-hello.ogg
    ├── pic1
    │   ├── debian_logo.jpg
    │   ├── debian_logo.png
    │   ├── debian.png
    │   ├── debian.ppm
    │   ├── debian.xcf
    │   ├── empty.jpg
    │   ├── IMG_1054.JPG
    │   ├── IMG-20191006-WA0002.jpg
    │   └── IMG_20200827_231612.jpg
    ├── pic2
    │   ├── d-debian.jpg
    │   ├── d-debian.png
    │   ├── d-debian.ppm
    │   ├── d-debian.xcf
    │   ├── IMG_20191224_234846.jpg
    │   ├── IMG_20200124_231153.jpg
    │   └── IMG_20200608_111614.jpg
    ├── text1
    │   ├── a-text.docx
    │   ├── a-text.odt
    │   ├── a-text-pass-A5d.pdf
    │   ├── a-text-pass-peanuts.pdf
    │   └── a-text.pdf
    └── text2
        ├── d-text.docx
        ├── d-text.odt
        ├── d-text.pdf
        └── test.sh

## How to use

Just download all repository or an isolated filesystem image and be happy.
You can learn/test tools are foremost, magicrescue, scalpel, exifprobe,
ext4magic, extundelete, ext3grep, sleuthkit, disktype, afflib-tools,
metacam, etc.

All filesystem images have a single partition starting at sector 2048. To
mount it you can use:

    # unxz fs.<name>
    # mount -o ro,offset=1048576 fs.<name> /mnt

PS: 1048576 is equal to 2048 (start sector) * 512 (size of sector).

The files a-text-pass-A5d.pdf and a-text-pass-peanuts.pdf are protected by
passwords "A5d" and "peanuts". It can be used to test PDF crackers.

## Steps used to generate images

This is an informational topic. Each image was created following these steps
(example for ext4):

    $ dcfldd if=/dev/zero of=fs.ext4 bs=1M count=50
    # fdisk fs.ext4  (to create a single disk partition, starting in sector 2048)
    # losetup -fo $[2048*512] fs.ext4  (to create /dev/loop0 starting in 2048)
    # mkfs.ext4 -m .001 /dev/loop0
    # mount /dev/loop0 /mnt
    # ./generate-fs.sh /mnt/
    # umount /mnt
    # losetup -d /dev/loop0
    $ xz fs.ext4

## License

All files in this project were created by me. You can see my female Samoyed
dogs (Lua and Lilas), the trains (subway) in my neighborhood, some little
movies and audio samples made by me, etc.

You must to preserve the following copyright notice:

    Copyright 2019-2020 Joao Eriberto Mota Filho <eriberto@eriberto.pro.br>

For all documents, pictures and movies inside "original-files", the license
is CC-BY-SA-4.0 (Creative Commons Attribution-ShareAlike 4.0 International).

For all other files (including "original-files/text2/test.sh") and filesystem
images, the license is MIT.
