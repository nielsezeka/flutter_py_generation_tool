import re
from custom_code.replacer.replacer_text import replacer
from custom_code.custom_utils import bcolors,file_creator
from custom_code.transfer_files.transfer_template_files import save_text
from custom_code.update_index.update_index import update_index_content

def convert_camel_case(string:str)->str:
    # strip before split the sentence
    return ''.join([word.capitalize() for word in string.strip().split()])

def camel_to_snake(name):
    name = re.sub('(.)([A-Z][a-z]+)', r'\1_\2', name)
    return re.sub('([a-z0-9])([A-Z])', r'\1_\2', name).lower()

def create_screen(project_path):
    create_screen_name = str(input(f"Enter {bcolors.HEADER}SCREEN{bcolors.ENDC} name(keep it simple and has normal space like: {bcolors.HEADER} main, detail page, settting ... {bcolors.ENDC} ):\n\n \tYour input: {bcolors.HEADER}"))
    camel_case = convert_camel_case(create_screen_name)
    snake_case = camel_to_snake(camel_case)
    builded_file_name = f'screen_{snake_case}.dart'
    builded_code_name = f'Screen{camel_case}'
    project_path += '/lib/presentationals/screens/'
    print(f'\n{bcolors.OKGREEN} --------- GENERATING FILES ---------{bcolors.ENDC}')
    print(f'{bcolors.OKGREEN}Creating new screen in folder:{bcolors.ENDC} {bcolors.OKBLUE}lib/presentationals/screens/{builded_file_name}{bcolors.ENDC}')
    print('-------- Create screen process -------------------------------------')
    content_file = replacer(file_creator.replacing_text ,builded_code_name,file_creator.path_for_screen_template)
    save_text(content_file,builded_file_name,snake_case,project_path)
    print('-------- Completed screen process ----------------------------------')

def create_service(project_path):
    create_screen_name = str(input(f"Enter {bcolors.HEADER}SERVICE{bcolors.ENDC} name(keep it simple and has normal space like: {bcolors.HEADER} main, detail page, settting ... {bcolors.ENDC} ):\n\n \tYour input: {bcolors.HEADER}"))
    camel_case = convert_camel_case(create_screen_name)
    snake_case = camel_to_snake(camel_case)
    builded_file_name = f'service_{snake_case}.dart'
    builded_code_name = f'Service{camel_case}'
    project_path += f'/lib/services/'
    print(f'\n{bcolors.OKGREEN} --------- GENERATING FILES ---------{bcolors.ENDC}')
    print(f'{bcolors.OKGREEN}Creating new service in folder:{bcolors.ENDC} {bcolors.OKBLUE}lib/services/{snake_case}{bcolors.ENDC}')
    # print('-------- Create screen process -------------------------------------')
    content_file = replacer(file_creator.replacing_text ,builded_code_name,file_creator.path_for_service_template)
    save_text(content_file,builded_file_name,snake_case,project_path)
    print('-------- Completed service process ----------------------------------')

def create_widget(project_path):
    create_screen_name = str(input(f"Enter {bcolors.HEADER}WIDGET{bcolors.ENDC} name(keep it simple and has normal space like: {bcolors.HEADER} main, detail page, settting ... {bcolors.ENDC} ):\n\n \tYour input: {bcolors.HEADER}"))
    camel_case = convert_camel_case(create_screen_name)
    snake_case = camel_to_snake(camel_case)
    builded_file_name = f'app_{snake_case}.dart'
    builded_code_name = f'App{camel_case}'
    project_path += '/lib/presentationals/widgets/'
    print(f'\n{bcolors.OKGREEN} --------- GENERATING FILES ---------{bcolors.ENDC}')
    print(f'{bcolors.OKGREEN}Creating new widget in folder:{bcolors.ENDC} {bcolors.OKBLUE}lib/services/{snake_case}{bcolors.ENDC}')
    # print('-------- Create screen process -------------------------------------')
    content_file = replacer(file_creator.replacing_text ,builded_code_name,file_creator.path_for_widget_template)
    save_text(content_file,builded_file_name,builded_file_name,project_path)
    print('-------- Completed widget process ----------------------------------')
