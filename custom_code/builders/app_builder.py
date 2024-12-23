from custom_code.custom_utils import bcolors
from subprocess import CalledProcessError, Popen, PIPE, STDOUT
def install_libs(project_path, libs):
    print(f'{bcolors.OKBLUE}CREATING DEFAULT LIBS: {libs} {bcolors.ENDC}')
    command = f'cd {project_path}'
    for x in libs:
        new_command = f'&& flutter pub add {x}' 
        command += new_command
    command += ' && flutter pub get'
    process = Popen(command, shell=True, stdout=PIPE, stderr=STDOUT)
    process.communicate()
    print(f'{bcolors.OKGREEN}ALL LIBS SUCCESSED INSTALL {bcolors.ENDC}')