import os
from custom_code.custom_utils import bcolors
import shutil
def transfer(source, target):
    print(f'{bcolors.OKBLUE}STARTING TRANSFER..... {bcolors.ENDC}')
    shutil.copytree(source, target,dirs_exist_ok=True)
    print(f'{bcolors.OKGREEN}TRANSFERED ALL FILES {bcolors.ENDC}')

def save_text(text,file_name,file_folder,location,is_override = False):
    file_folder_full_path = f'{location}{file_folder}/'
    file_name_full_path = f'{file_folder_full_path}/{file_name}'
    if not is_override:
        if os.path.isdir(file_folder_full_path):
            print(f'{bcolors.FAIL}\t!!!!!FILE IS EXISTED, PLEASE CHOOSE ANOTHER NAME!!!!!{bcolors.ENDC}')
            return
    file_folder_full_path = file_folder_full_path.replace('.dart','')
    if os.path.exists(file_name_full_path):
        os.remove(file_name_full_path)
    print(f'\tSaving file {bcolors.HEADER}{file_folder_full_path}{bcolors.ENDC} to location:{bcolors.HEADER}{file_folder_full_path}{bcolors.ENDC}')
    if not os.path.isdir(file_folder_full_path):
        os.makedirs(file_folder_full_path)
        
    file1 = open(file_name_full_path, "w")
    file1.write(text)
    file1.close()