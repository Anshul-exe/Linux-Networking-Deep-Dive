# Linux Questions for Job Interview

## Beginner Level

#### **Q1. How to check file permsissions in Linux?**

- _A1._ Use `ls -l` or `getfacl <file>`

#### **Q2. How to view the history of used commands?**

- _A2._ Use `history` command

#### **Q3. What is inode and how to find it for a file?**

- _A3._ Inode is a data structure that stores information about a file. Use `ls -i` to find inode of a file. inode is an index node. It serves as a unique identifier for a specific piece of metadata on a given filesystem

#### **Q4. Which command can you use for finding files on a Linux system?**

- _A3._ Use `find` and `locate` command

#### **Q5. How to permanently delete a file in Linux?**

- _A5._ Use `shred` which overwrites the file multiple times before deleting it.

#### **Q6. How to add content with and without deleting inner content in a file?**

- _A6._ Use `echo "content" > file.txt` to add content and `echo "content" >> file.txt` to append(without deleting and adding at the bottom) content.

#### **Q7. How to check the disk space in Linux?**

- _A7._ Use `df -h` to check disk space in Linux.

#### **Q8. How to check size of directory's content**

- _A8._ Use `du -sh <directory>` to check size of directory's content.

#### **Q9. How to check open port on Linux system?**

- _A9._ Use `netstat -tulnp` to check open ports on Linux system. like `netstat putan | grep port_no`

#### **Q10. What does RHEL stands for?**

- A9. Red Hat Enterprise Linux

## Intermediate Level

#### **Q11. What is kernal?**

- A10. The Linux kernel is the main component of a Linux OS and is the core interface between a computer’s hardware and its processes.

#### **Q12. What is swap space in Linux?**

- A12. When RAM is full of processes and the system needs more memory then some of the inactive processess/pages/datas are moved to swap space. It is a part of hard disk.

#### Q13. What is the use of /etc/shadow file

- A13. The /etc/shadow file stores actual password data in an encrypted format for user’s accounts with additional properties related to user password.
