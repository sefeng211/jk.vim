if !has('python3')
    finish
endif


if $SSH_CLIENT != "" || $SSH_TTY != "" || $SSH_CONNECTION != ""
    finish
endif

py3 << EOF
from pynput import keyboard

last_key = None

def send_jk():
    mode = vim.eval("mode()")
    if mode == "i":
        #TODO: Check the current input method? And only
        #send jk when the input method is not English
        vim.command('stopinsert')

def main():
    def on_press(key):
        global last_key
        try:
            if last_key is not None and key.char == "k" and last_key.char == "j":
                vim.async_call(send_jk)
            last_key = key
        except Exception:
            pass

    # start the listener in a non-blocking fasion
    lis = keyboard.Listener(
            on_press=on_press,
            );
    lis.start()

main()
EOF
