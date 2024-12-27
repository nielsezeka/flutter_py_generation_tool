import os
from custom_code.builders.app_builder import install_libs
from custom_code.builders.file_builder import create_screen, create_service, create_widget
from custom_code.transfer_files.transfer_template_files import save_text, transfer
from custom_code.custom_utils import bcolors, file_creator,select_options,get_user_choice
from custom_code.update_index.update_index import update_index_content
# location, please edit...
# leave it if you are using it directly in your project
project_path = '/Users/nango/Desktop/internal_server/flutter_py_tools/demo/flutter_common_widget_design_template'
#do not edit these configs
folder_project_structure = '/_original_files/project_structure_templates'
working_directory = os.path.dirname(os.path.abspath(__file__))

def initialize_project():
    #step 1: copy alls default files and folder to target project
    transfer(f'{working_directory}{folder_project_structure}',project_path)
    #step 2: install all default lib
    install_libs(project_path,['google_fonts','flutter_screenutil','rxdart'])
def update_index():
    lib_path = f'{project_path}/lib/'
    content_index = update_index_content(f'{lib_path}/presentationals',file_creator.path_for_presentational_template)
    save_text(content_index,'presentationals_index.dart','presentationals',lib_path.replace('presentationals/screens/',''),is_override = True)
    content_index_service = update_index_content(f'{lib_path}/services',file_creator.path_for_service_index_template)
    save_text(content_index_service,'services_index.dart','services',lib_path,is_override = True)

#default script actions...
user_choice = get_user_choice()
if user_choice == select_options.init_project:
    print(f'{bcolors.OKGREEN}Generating new template{bcolors.ENDC}')
    initialize_project()
if user_choice == select_options.create_screen:
    create_screen(project_path)
    update_index()
if user_choice == select_options.create_service:
    create_service(project_path)
    update_index()
if user_choice == select_options.create_widget:
    create_widget(project_path)
    update_index()
if user_choice == select_options.update_index:
    update_index()
    
print(f'{bcolors.OKGREEN}Action completed! terminating script....{bcolors.ENDC}')