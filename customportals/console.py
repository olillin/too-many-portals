class colored:
    @staticmethod
    def formatted(message: str, code: str):
        return code + message + "\033[0m"
    @staticmethod
    def blue(message: str):
        return colored.formatted(message, "\033[94m")
    @staticmethod
    def cyan(message: str):
        return colored.formatted(message, "\033[96m")
    @staticmethod
    def green(message: str):
        return colored.formatted(message, "\033[92m")
    @staticmethod
    def yellow(message: str):
        return colored.formatted(message, "\033[93m")
    @staticmethod
    def red(message: str):
        return colored.formatted(message, "\033[91m")
    @staticmethod
    def purple(message: str):
        return colored.formatted(message, "\033[95m")
    @staticmethod
    def bold(message: str):
        return colored.formatted(message, "\033[1m")
    @staticmethod
    def underline(message: str):
        return colored.formatted(message, "\033[4m")

def warning(message: str):
    print(colored.yellow("WARNING: " + message))

def error(message: str):
    print(colored.red("ERROR: " + message))

def log(message: str):
    print(colored.cyan(message))