import subprocess
import modify_apple_script as mas

def run_apple_script(apple_script_path):

    # AppleScript 파일 실행
    process = subprocess.run(["osascript", apple_script_path], text=True, capture_output=True)

    # subprocess.run() 함수를 사용하여 osascript 명령어 실행

    # 결과 출력
    print("stdout:", process.stdout)
    print("stderr:", process.stderr)

    return process.stdout.strip()


def get_project_name():
    script_path = "applescripts/get_project_name.scpt"
    project_name = run_apple_script(script_path)
    return project_name.split(' - ')[0]


def get_project_info_aif():
    script = "applescripts/get_project_info_aif.applescript"

    project_name = get_project_name()
    txt_path = f"aif_info/{project_name}.txt"
    print(f"txt_path : {txt_path}")
    # print(txt_path.encode('iso-8859-1').decode('utf-8'))
    mas.modify_apple_script(script, "YOUR_TXT_PATH", txt_path)

    run_apple_script(script)

    mas.modify_apple_script(script, txt_path, "YOUR_TXT_PATH")


# 함수 호출
get_project_info_aif()
