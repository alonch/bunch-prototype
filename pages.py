from webapp2 import RequestHandler

class MainHandler(RequestHandler):
    def get(self):
        tpl = env.get_template('index.tpl')
        self.response.write(tpl.render())

class AddHandler(RequestHandler):
    def get(self):
        tpl = env.get_template('add.tpl')
        self.response.write(tpl.render())

