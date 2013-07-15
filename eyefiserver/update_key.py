#!/usr/bin/python
import sys
import shutil
import os

def replace_line(file_name, line_num, text):
    lines = open(file_name, 'r').readlines()
    lines[line_num] = text
    out = open(file_name, 'w')
    out.writelines(lines)
    out.close()

def main():
    if (sys.argv[2]=='false'):
        line = open(sys.argv[1], "r").readlines()[16]
        out = sys.stdout
        out.write(line)
    else:
        shutil.copy (sys.argv[1], sys.argv[1]+'.bak')
        replace_line(sys.argv[1], 16, 'upload_key:'+sys.argv[2]+'\n')
        print(sys.argv[2])
        sys.exit(0)
    return line

if __name__ == "__main__":
        main()
