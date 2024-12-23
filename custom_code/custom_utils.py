class file_creator:
    replacing_text = '[MyText]'
    path_for_screen_template = './_original_files/project_template_file/screen_template.dart'
    path_for_service_template = './_original_files/project_template_file/service_template.dart'
    path_for_presentational_template = './_original_files/project_template_file/presentationals_index.dart'
    path_for_service_index_template = './_original_files/project_template_file/services_index.dart'
    path_for_widget_template = './_original_files/project_template_file/widget_template.dart'
   
class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKCYAN = '\033[96m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

class select_options:
    create_service = 1
    create_widget = 2
    create_screen = 3
    init_project = 4
    update_index = 5
    exit = 6
    all_items = [create_service,create_widget,create_screen,init_project,update_index,exit]

def get_user_choice():
    while True:
        print('\n---------FLUTTER GENERATION TOOLS---------')
        print(f"{bcolors.OKBLUE}Please select an option:{bcolors.ENDC}")
        print("1. Create Service")
        print("2. Create Widget")
        print("3. Create Screen")
        print(f"4. {bcolors.FAIL}[USE IT CAREFULLY]{bcolors.ENDC} Initialize default project")
        print("5. Update index")
        print("6. Exit script")

        try:
            choice = int(input(f"Enter your choice (1-{len(select_options.all_items)}): "))
            if 1 <= choice <= len(select_options.all_items):
                return choice
            else:
                print(f"\n{bcolors.FAIL} ***** Invalid choice *****{bcolors.ENDC}")
        except ValueError:
            print(f"\n{bcolors.FAIL} ***** Invalid choice *****{bcolors.ENDC}")
            print('reactivating scripts....\n.....')