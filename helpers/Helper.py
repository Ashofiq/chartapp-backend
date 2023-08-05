import re

class Helper():
    def __init__(self):
        self.app = ''

    def replaceAll(self, text, replace, replace_by):
        updated_text = re.sub(r'\$', replace_by, text)
        return updated_text