import os
import sys
from custom_code.replacer.replacer_text import replacer
from custom_code.custom_utils import bcolors

def update_index_content(folder_to_update,index_file):
    full_file = f'{folder_to_update}/{index_file}'
    print(f'{bcolors.OKGREEN} \t Updating index file: {folder_to_update} and {index_file}{bcolors.ENDC}')
    text_to_change = ''
    for root, dirs, files in os.walk(folder_to_update):
        path = root.split(os.sep)
        for file in files:
            item = '/'.join(path).replace(folder_to_update,'.') + '/'+file

            #should remove the file is the index.
            if '_index.dart' not in item and item.find(".dart") != -1: 
                text_to_change += f'\npart \'{item}\';'
    return replacer('[replace_here]',text_to_change,index_file)