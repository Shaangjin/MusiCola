def modify_apple_script(apple_script_path, YOUR_TXT_PATH, new_txt_path):
    # 파일을 읽기 모드로 열기
    with open(apple_script_path, 'r', encoding='ISO-8859-1') as file:
        script_content = file.read()


    # 특정 내용을 새로운 내용으로 교체
    script_content = script_content.replace(YOUR_TXT_PATH, new_txt_path)
    print(script_content)
    # 파일을 쓰기 모드로 열어 내용을 덮어쓰기
    with open(apple_script_path, 'w', encoding='ISO-8859-1') as file:
        file.write(script_content)
