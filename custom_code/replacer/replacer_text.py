from custom_code.custom_utils import bcolors


def replacer(input,replace_item,file_to_replace):
    print(f'\tStarting text processing {bcolors.HEADER}{file_to_replace.split('/')[-1:]}{bcolors.ENDC} using new name {bcolors.HEADER}{replace_item}{bcolors.ENDC}')
    f = open(file_to_replace, 'r')
    content = f.read()
    new_content = content.replace(f'{input}',replace_item)
    return new_content
